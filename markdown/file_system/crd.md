
kubectl patch crd/settings.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge  
kubectl patch crd/nodes.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge  
kubectl patch crd/jobs.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/backingimages.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/engines.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/replicas.longhorn.io  -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/sharemanagers.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/volumes.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/backuptargets.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/engineimages.longhorn.io  -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/backups.longhorn.io  -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/backingimagedatasources.longhorn.io  -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/backupvolumes.longhorn.io -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/instancemanagers.longhorn.io  -p '{"metadata":{"finalizers":[]}}' --type=merge
kubectl patch crd/backingimagemanagers.longhorn.io  -p '{"metadata":{"finalizers":[]}}' --type=merge

kubectl delete crd/settings.longhorn.io                   
kubectl delete crd/nodes.longhorn.io                                  
kubectl delete crd/recurringjobs.longhorn.io                            
kubectl delete crd/backingimages.longhorn.io                            
kubectl delete crd/engines.longhorn.io                                  
kubectl delete crd/replicas.longhorn.io                                 
kubectl delete crd/sharemanagers.longhorn.io                            
kubectl delete crd/volumes.longhorn.io                                  
kubectl delete crd/backuptargets.longhorn.io                             
kubectl delete crd/engineimages.longhorn.io                          
kubectl delete crd/backups.longhorn.io                                
kubectl delete crd/backingimagedatasources.longhorn.io                 
kubectl delete crd/backupvolumes.longhorn.io                           
kubectl delete crd/instancemanagers.longhorn.io                        
kubectl delete crd/backingimagemanagers.longhorn.io 