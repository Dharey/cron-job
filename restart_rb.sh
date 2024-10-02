# #!/bin/bash
# Get all deployments in the acquiring namespace
NAMESPACE="monitoring"
ACQUIRING_JPTS_AND_NUS_PODS=$(kubectl get pods --namespace $NAMESPACE -o custom-columns=:metadata.name)
# | grep -E 'jpos-acquiring-nus|jpos-acquiring-jpts'
#)
echo "The following pods in the monitoring namespace will be restarted:"
for pod in $ACQUIRING_JPTS_AND_NUS_PODS; do
  echo "Restarting pod: $ACQUIRING_JPTS_AND_NUS_PODS"
  
  # Delete the pod (which will cause it to be restarted)
  kubectl delete pod $ACQUIRING_JPTS_AND_NUS_PODS -n $NAMESPACE
  
  # Wait for the pod to be recreated and in Ready state before moving to the next pod
  kubectl wait --for=condition=Ready pod/$ACQUIRING_JPTS_AND_NUS_PODS -n $NAMESPACE --timeout=300s
done

echo "NUS and JPTS pods have been restarted sequentially."
