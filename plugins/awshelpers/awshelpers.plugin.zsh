eip() {
    if (( $# == 0 )) then
        echo 'Please provide an argument'
    elif (( $# == 2)) then
        profile="--profile ${2}";
    fi
    aws ec2 describe-instances ${profile} --instance-id ${1} | jq -r '.Reservations[].Instances[].PrivateIpAddress'
}

autoscale() {
    if (( $# == 1 )) then
        profile="--profile ${1}";
    fi
    aws autoscaling describe-auto-scaling-instances $profile | jq '.AutoScalingInstances | group_by(.HealthStatus)[][] | {(.AutoScalingGroupName): .InstanceId}'
}