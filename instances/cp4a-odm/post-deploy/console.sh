INGRESS_SUBDOMAIN=${INGRESS_SUBDOMAIN:-"oc get IngressController default -n openshift-ingress-operator -o jsonpath='{.spec.defaultCertificate.name}'"}
NAMESPACE=${NAMESPACE:-"tools"}
cat <<EOF |oc apply -f -
apiVersion: console.openshift.io/v1
kind: ConsoleLink
metadata:
  name: cloud-pak-dashboard
spec:
  href: 'https://cpd-${NAMESPACE}.${INGRESS_SUBDOMAIN}'
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
  href: 'https://console-openshift-console.${INGRESS_SUBDOMAIN}/k8s/ns/tools/configmaps/icp4adeploy-cp4ba-access-info'
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
  href: 'https://cpd-${NAMESPACE}.${INGRESS_SUBDOMAIN}/odm/decisioncenter'
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
  href: 'https://cpd-${NAMESPACE}.${INGRESS_SUBDOMAIN}/odm/res'
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
  href: 'https://cpd-${NAMESPACE}.${INGRESS_SUBDOMAIN}/odm/DecisionRunner'
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
  href: 'https://cpd-${NAMESPACE}.${INGRESS_SUBDOMAIN}/odm/DecisionService'
  location: ApplicationMenu
  applicationMenu:
    section: Operational Decision Manager
  text: Decision Server Runtime
EOF
echo Cloud Pak Dashboard
echo https://cpd-${NAMESPACE}.${INGRESS_SUBDOMAIN}
echo Cloud Pak access info
echo https://console-openshift-console.${INGRESS_SUBDOMAIN}/k8s/ns/tools/configmaps/icp4adeploy-cp4ba-access-info
echo Decision Center
echo https://cpd-${NAMESPACE}.${INGRESS_SUBDOMAIN}/odm/decisioncenter
echo Decision Server Console
echo https://cpd-${NAMESPACE}.${INGRESS_SUBDOMAIN}/odm/res
echo Decision Runner
echo https://cpd-${NAMESPACE}.${INGRESS_SUBDOMAIN}/odm/DecisionRunner
echo Decision Server Runtime
echo https://cpd-${NAMESPACE}.${INGRESS_SUBDOMAIN}/odm/DecisionService
