INGRESS_DOMAIN=$(oc get IngressController default -n openshift-ingress-operator -o jsonpath='{.status.domain}')
NAMESPACE=${NAMESPACE:-"odm"}
echo ${NAMESPACE}
echo ${INGRESS_DOMAIN}
cat <<EOF |oc apply -f -
apiVersion: console.openshift.io/v1
kind: ConsoleLink
metadata:
  name: cloud-pak-dashboard
spec:
  href: 'https://cpd-'$NAMESPACE'.'$INGRESS_DOMAIN'
  location: ApplicationMenu
  applicationMenu:
    section: IBM Cloud Paks
  text: Cloud Pak Dashboard
EOF

cat <<EOF |oc apply -f -
apiVersion: console.openshift.io/v1
kind: ConsoleLink
metadata:
  name: cloud-pak-access-info
spec:
  href: 'https://console-openshift-console.'$INGRESS_DOMAIN'/k8s/ns/tools/configmaps/icp4adeploy-cp4ba-access-info'
  location: ApplicationMenu
  applicationMenu:
    section: IBM Cloud Paks
  text: Cloud Pak Access Info
EOF

cat <<EOF |oc apply -f -
apiVersion: console.openshift.io/v1
kind: ConsoleLink
metadata:
  name: decision-center
spec:
  href: 'https://cpd-'$NAMESPACE'.'$INGRESS_DOMAIN'/odm/decisioncenter'
  location: ApplicationMenu
  applicationMenu:
    section: Operational Decision Manager
  text: Decision Center
EOF

cat <<EOF |oc apply -f -
apiVersion: console.openshift.io/v1
kind: ConsoleLink
metadata:
  name: decision-server-console
spec:
  href: 'https://cpd-'$NAMESPACE'.'$INGRESS_DOMAIN'/odm/res'
  location: ApplicationMenu
  applicationMenu:
    section: Operational Decision Manager
  text: Decision Server Console
EOF

cat <<EOF |oc apply -f -
apiVersion: console.openshift.io/v1
kind: ConsoleLink
metadata:
  name: decision-runner
spec:
  href: 'https://cpd-'$NAMESPACE'.'$INGRESS_SUBDOMAIN'/odm/DecisionRunner'
  location: ApplicationMenu
  applicationMenu:
    section: Operational Decision Manager
  text: Decision Runner
EOF

cat <<EOF |oc apply -f -
apiVersion: console.openshift.io/v1
kind: ConsoleLink
metadata:
  name: decision-server-runtime
spec:
  href: 'https://cpd-'$NAMESPACE'.'$INGRESS_DOMAIN'/odm/DecisionService'
  location: ApplicationMenu
  applicationMenu:
    section: Operational Decision Manager
  text: Decision Server Runtime
EOF

echo Cloud Pak Dashboard
echo 'https://cpd-'$NAMESPACE'.'$INGRESS_DOMAIN''
echo Cloud Pak access info
echo 'https://console-openshift-console.'$INGRESS_DOMAIN'/k8s/ns/tools/configmaps/icp4adeploy-cp4ba-access-info'
echo Decision Center
echo 'https://cpd-'$NAMESPACE'.'$INGRESS_DOMAIN'/odm/decisioncenter'
echo Decision Server Console
echo 'https://cpd-'$NAMESPACE'.'$INGRESS_DOMAIN'/odm/res'
echo Decision Runner
echo 'https://cpd-'$NAMESPACE'.'$INGRESS_DOMAIN'/odm/DecisionRunner'
echo Decision Server Runtime
echo 'https://cpd-'$NAMESPACE'.'$INGRESS_DOMAIN'