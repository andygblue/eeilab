# removes all of the Event Enabled Insurance Components from the OCP Cluster
# you will need to be logged in with sufficient permissions
#
# set the namespace
eeins=eei
oc project $eeins
# Integration Runtimes
oc delete IntegrationRuntime claimsapi --namespace $eeins
oc delete IntegrationRuntime processclaims --namespace $eeins

#kafka bindings
oc delete IntegrationBinding kafka-claims-consumer --namespace $eeins
oc delete IntegrationBinding kafka-claims-producer --namespace $eeins
#kafka topic
oc delete KafkaTopic claimstatus --namespace $eeins
#kafka user
oc delete KafkaUser claim-status-consumer --namespace $eeins
oc delete KafkaUser claim-status-producer --namespace $eeins
#kafka cluster
oc delete EventStreams eeikafka  --namespace $eeins

#messaging user
oc delete MessagingUser claimput  --namespace $eeins
#messaging channel
oc delete MessagingChannel eeiclient1  --namespace $eeins
#messaging queue
oc delete MessagingQueue newclaims  --namespace $eeins
#messaging server/queue manager
oc delete MessagingServer eei  --namespace $eeins

#API product
oc delete Product eei-claim-product  --namespace $eeins

#Configuration
oc delete Configuration claimconfig  --namespace $eeins

#assembly
oc delete IntegrationAssembly event-enabled-insurance  --namespace $eeins