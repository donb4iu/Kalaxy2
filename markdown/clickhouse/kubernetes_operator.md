# ClickHouse Kubernetes Operator


## References

- [Quick Start Guides](https://github.com/Altinity/clickhouse-operator/blob/master/docs/quick_start.md)

- [Effortlessly Deploying ClickHouse on Kubernetes: A Comprehensive Guide](https://medium.com/@luciferutkarsh/effortlessly-deploying-clickhouse-on-kubernetes-a-comprehensive-guide-b54dbd6cdf22)


## Setup 

### Quick Start

#### Setup

##### #( 02/18/24@10:18PM )( donbuddenbaum@donbs-imac ):~/Documents/clickhouse-operator/deploy/operator@master✔
   kubectl apply -f https://raw.githubusercontent.com/Altinity/clickhouse-operator/master/deploy/operator/clickhouse-operator-install-bundle.yaml
```   
customresourcedefinition.apiextensions.k8s.io/clickhouseinstallations.clickhouse.altinity.com unchanged
customresourcedefinition.apiextensions.k8s.io/clickhouseinstallationtemplates.clickhouse.altinity.com unchanged
customresourcedefinition.apiextensions.k8s.io/clickhouseoperatorconfigurations.clickhouse.altinity.com unchanged
customresourcedefinition.apiextensions.k8s.io/clickhousekeeperinstallations.clickhouse-keeper.altinity.com unchanged
serviceaccount/clickhouse-operator unchanged
clusterrole.rbac.authorization.k8s.io/clickhouse-operator-kube-system unchanged
clusterrolebinding.rbac.authorization.k8s.io/clickhouse-operator-kube-system unchanged
configmap/etc-clickhouse-operator-files unchanged
configmap/etc-clickhouse-operator-confd-files configured
configmap/etc-clickhouse-operator-configd-files unchanged
configmap/etc-clickhouse-operator-templatesd-files unchanged
configmap/etc-clickhouse-operator-usersd-files unchanged
secret/clickhouse-operator configured
deployment.apps/clickhouse-operator unchanged
service/clickhouse-operator-metrics unchanged
```
#### #( 02/18/24@11:22PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2@main✔
   kubectl get all -n demo

```
NAME                            READY   STATUS    RESTARTS   AGE
pod/chi-demo-01-demo-01-0-0-0   1/1     Running   0          56m

NAME                              TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)                         AGE
service/chi-demo-01-demo-01-0-0   ClusterIP      None             <none>         9000/TCP,8123/TCP,9009/TCP      56m
service/clickhouse-demo-01        LoadBalancer   10.152.183.114   192.168.2.21   8123:31182/TCP,9000:31455/TCP   56m

NAME                                       READY   AGE
statefulset.apps/chi-demo-01-demo-01-0-0   1/1     56m
```

#### Tests

##### #( 02/18/24@10:22PM )( donbuddenbaum@donbs-imac ):~/Documents/clickhouse-operator/deploy/operator@master✔
   kubectl create  namespace       demo

      namespace/demo created

##### #( 02/18/24@10:31PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/clickhouse@main✗✗✗
   kubectl apply -f demo.yaml -n demo

      clickhouseinstallation.clickhouse.altinity.com/demo-01 created


##### #( 02/18/24@10:32PM )( donbuddenbaum@donbs-imac ):~/Documents/Kalaxy2/yaml/clickhouse@main✗✗✗
   kubectl exec -it chi-demo-01-demo-01-0-0-0 -n demo -- clickhouse-client

```
ClickHouse client version 24.1.5.6 (official build).
Connecting to localhost:9000 as user default.
Connected to ClickHouse server version 24.1.5.
```

##### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :)

CREATE TABLE trips
(
    `trip_id` UInt32,
    `vendor_id` Enum8('1' = 1, '2' = 2, '3' = 3, '4' = 4, 'CMT' = 5, 'VTS' = 6, 'DDS' = 7, 'B02512' = 10, 'B02598' = 11, 'B02617' = 12, 'B02682' = 13, 'B02764' = 14, '' = 15),
    `pickup_date` Date,
    `pickup_datetime` DateTime,
    `dropoff_date` Date,
    `dropoff_datetime` DateTime,
    `store_and_fwd_flag` UInt8,
    `rate_code_id` UInt8,
    `pickup_longitude` Float64,
    `pickup_latitude` Float64,
    `dropoff_longitude` Float64,
    `dropoff_latitude` Float64,
    `passenger_count` UInt8,
    `trip_distance` Float64,
    `fare_amount` Float32,
    `extra` Float32,
    `mta_tax` Float32,
    `tip_amount` Float32,
    `tolls_amount` Float32,
    `ehail_fee` Float32,
    `improvement_surcharge` Float32,
    `total_amount` Float32,
    `payment_type` Enum8('UNK' = 0, 'CSH' = 1, 'CRE' = 2, 'NOC' = 3, 'DIS' = 4),
    `trip_type` UInt8,
    `pickup` FixedString(25),
    `dropoff` FixedString(25),
    `cab_type` Enum8('yellow' = 1, 'green' = 2, 'uber' = 3),
    `pickup_nyct2010_gid` Int8,
    `pickup_ctlabel` Float32,
    `pickup_borocode` Int8,
    `pickup_ct2010` String,
    `pickup_boroct2010` String,
    `pickup_cdeligibil` String,
    `pickup_ntacode` FixedString(4),
    `pickup_ntaname` String,
    `pickup_puma` UInt16,
    `dropoff_nyct2010_gid` UInt8,
    `dropoff_ctlabel` Float32,
    `dropoff_borocode` UInt8,
    `dropoff_ct2010` String,
    `dropoff_boroct2010` String,
    `dropoff_cdeligibil` String,
    `dropoff_ntacode` FixedString(4),
    `dropoff_ntaname` String,
    `dropoff_puma` UInt16
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(pickup_date)
ORDER BY pickup_datetime
```
Query id: 58068e7f-c033-434f-a6e6-d3022a6265d4

Ok.

0 rows in set. Elapsed: 0.015 sec.
```
##### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :) 

INSERT INTO trips
SELECT * FROM s3(
    'https://datasets-documentation.s3.eu-west-3.amazonaws.com/nyc-taxi/trips_{1..2}.gz',
    'TabSeparatedWithNames', "
    `trip_id` UInt32,
    `vendor_id` Enum8('1' = 1, '2' = 2, '3' = 3, '4' = 4, 'CMT' = 5, 'VTS' = 6, 'DDS' = 7, 'B02512' = 10, 'B02598' = 11, 'B02617' = 12, 'B02682' = 13, 'B02764' = 14, '' = 15),
    `pickup_date` Date,
    `pickup_datetime` DateTime,
    `dropoff_date` Date,
    `dropoff_datetime` DateTime,
    `store_and_fwd_flag` UInt8,
    `rate_code_id` UInt8,
    `pickup_longitude` Float64,
    `pickup_latitude` Float64,
    `dropoff_longitude` Float64,
    `dropoff_latitude` Float64,
    `passenger_count` UInt8,
    `trip_distance` Float64,
    `fare_amount` Float32,
    `extra` Float32,
    `mta_tax` Float32,
    `tip_amount` Float32,
    `tolls_amount` Float32,
    `ehail_fee` Float32,
    `improvement_surcharge` Float32,
    `total_amount` Float32,
    `payment_type` Enum8('UNK' = 0, 'CSH' = 1, 'CRE' = 2, 'NOC' = 3, 'DIS' = 4),
    `trip_type` UInt8,
    `pickup` FixedString(25),
    `dropoff` FixedString(25),
    `cab_type` Enum8('yellow' = 1, 'green' = 2, 'uber' = 3),
    `pickup_nyct2010_gid` Int8,
    `pickup_ctlabel` Float32,
    `pickup_borocode` Int8,
    `pickup_ct2010` String,
    `pickup_boroct2010` String,
    `pickup_cdeligibil` String,
    `pickup_ntacode` FixedString(4),
    `pickup_ntaname` String,
    `pickup_puma` UInt16,
    `dropoff_nyct2010_gid` UInt8,
    `dropoff_ctlabel` Float32,
    `dropoff_borocode` UInt8,
    `dropoff_ct2010` String,
    `dropoff_boroct2010` String,
    `dropoff_cdeligibil` String,
    `dropoff_ntacode` FixedString(4),
    `dropoff_ntaname` String,
    `dropoff_puma` UInt16
") SETTINGS input_format_try_infer_datetimes = 0

INSERT INTO trips
SETTINGS input_format_try_infer_datetimes = 0
SELECT *
FROM s3('https://datasets-documentation.s3.eu-west-3.amazonaws.com/nyc-taxi/trips_{1..2}.gz', 'TabSeparatedWithNames', `\n    \`trip_id\` UInt32,\n    \`vendor_id\` Enum8('1' = 1, '2' = 2, '3' = 3, '4' = 4, 'CMT' = 5, 'VTS' = 6, 'DDS' = 7, 'B02512' = 10, 'B02598' = 11, 'B02617' = 12, 'B02682' = 13, 'B02764' = 14, '' = 15),\n    \`pickup_date\` Date,\n    \`pickup_datetime\` DateTime,\n    \`dropoff_date\` Date,\n    \`dropoff_datetime\` DateTime,\n    \`store_and_fwd_flag\` UInt8,\n    \`rate_code_id\` UInt8,\n    \`pickup_longitude\` Float64,\n    \`pickup_latitude\` Float64,\n    \`dropoff_longitude\` Float64,\n    \`dropoff_latitude\` Float64,\n    \`passenger_count\` UInt8,\n    \`trip_distance\` Float64,\n    \`fare_amount\` Float32,\n    \`extra\` Float32,\n    \`mta_tax\` Float32,\n    \`tip_amount\` Float32,\n    \`tolls_amount\` Float32,\n    \`ehail_fee\` Float32,\n    \`improvement_surcharge\` Float32,\n    \`total_amount\` Float32,\n    \`payment_type\` Enum8('UNK' = 0, 'CSH' = 1, 'CRE' = 2, 'NOC' = 3, 'DIS' = 4),\n    \`trip_type\` UInt8,\n    \`pickup\` FixedString(25),\n    \`dropoff\` FixedString(25),\n    \`cab_type\` Enum8('yellow' = 1, 'green' = 2, 'uber' = 3),\n    \`pickup_nyct2010_gid\` Int8,\n    \`pickup_ctlabel\` Float32,\n    \`pickup_borocode\` Int8,\n    \`pickup_ct2010\` String,\n    \`pickup_boroct2010\` String,\n    \`pickup_cdeligibil\` String,\n    \`pickup_ntacode\` FixedString(4),\n    \`pickup_ntaname\` String,\n    \`pickup_puma\` UInt16,\n    \`dropoff_nyct2010_gid\` UInt8,\n    \`dropoff_ctlabel\` Float32,\n    \`dropoff_borocode\` UInt8,\n    \`dropoff_ct2010\` String,\n    \`dropoff_boroct2010\` String,\n    \`dropoff_cdeligibil\` String,\n    \`dropoff_ntacode\` FixedString(4),\n    \`dropoff_ntaname\` String,\n    \`dropoff_puma\` UInt16\n`)
SETTINGS input_format_try_infer_datetimes = 0

```
Query id: 99d6ebed-032e-4138-8edc-342f5db144f6

Ok.

0 rows in set. Elapsed: 30.854 sec. Processed 2.00 million rows, 163.07 MB (64.81 thousand rows/s., 5.29 MB/s.)
Peak memory usage: 1.20 GiB.
```

##### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :) 


SELECT count()
FROM trips

```
Query id: be0ab8c1-dd68-4f8a-9e25-3468c44566a9

┌─count()─┐
│ 1999657 │
└─────────┘

1 row in set. Elapsed: 0.003 sec.
```

##### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :) SELECT DISTINCT(pickup_ntaname) FROM trips

```
SELECT DISTINCT pickup_ntaname
FROM trips

Query id: ec13863e-cc72-4495-9faf-60d86e5084d9

┌─pickup_ntaname───────────────────────────────────┐
│ Upper East Side-Carnegie Hill                    │
│ East Village                                     │
│ SoHo-TriBeCa-Civic Center-Little Italy           │
│ Lincoln Square                                   │
│ Battery Park City-Lower Manhattan                │
│ Midtown-Midtown South                            │
│ North Side-South Side                            │
│ Gramercy                                         │
│ Murray Hill-Kips Bay                             │
│ Airport                                          │
│ Clinton                                          │
│ Central Harlem South                             │
│ Hudson Yards-Chelsea-Flatiron-Union Square       │
│ West Village                                     │
│ West Concourse                                   │
│ Lenox Hill-Roosevelt Island                      │
│ Woodlawn-Wakefield                               │
│ Lower East Side                                  │
│ Chinatown                                        │
│ Upper West Side                                  │
│ DUMBO-Vinegar Hill-Downtown Brooklyn-Boerum Hill │
│                                                  │
│ Fort Greene                                      │
│ Park Slope-Gowanus                               │
│ East Harlem North                                │
│ Turtle Bay-East Midtown                          │
│ Greenpoint                                       │
│ East Williamsburg                                │
│ East Concourse-Concourse Village                 │
│ Astoria                                          │
│ North Corona                                     │
│ South Ozone Park                                 │
│ Yorkville                                        │
│ Crown Heights South                              │
│ Manhattanville                                   │
│ Jackson Heights                                  │
│ Kensington-Ocean Parkway                         │
│ Queensbridge-Ravenswood-Long Island City         │
│ Elmhurst                                         │
│ Carroll Gardens-Columbia Street-Red Hook         │
│ Morningside Heights                              │
│ Bedford                                          │
│ Woodside                                         │
│ Old Astoria                                      │
│ Ocean Hill                                       │
│ Central Harlem North-Polo Grounds                │
│ Hunters Point-Sunnyside-West Maspeth             │
│ Rego Park                                        │
│ Steinway                                         │
│ Stuyvesant Town-Cooper Village                   │
│ Hamilton Heights                                 │
│ East Harlem South                                │
│ park-cemetery-etc-Manhattan                      │
│ Kew Gardens                                      │
│ Jamaica                                          │
│ Sunset Park West                                 │
│ Washington Heights South                         │
│ park-cemetery-etc-Queens                         │
│ Windsor Terrace                                  │
│ Williamsburg                                     │
│ Arden Heights                                    │
│ Mott Haven-Port Morris                           │
│ Elmhurst-Maspeth                                 │
│ Clinton Hill                                     │
│ Newark Airport                                   │
│ Hunts Point                                      │
│ Brooklyn Heights-Cobble Hill                     │
│ Stuyvesant Heights                               │
│ Richmond Hill                                    │
│ East Elmhurst                                    │
│ Flushing                                         │
│ Briarwood-Jamaica Hills                          │
│ Melrose South-Mott Haven North                   │
│ Glendale                                         │
│ Spuyten Duyvil-Kingsbridge                       │
│ Crown Heights North                              │
│ South Jamaica                                    │
│ Prospect Heights                                 │
│ Kingsbridge Heights                              │
│ Prospect Lefferts Gardens-Wingate                │
│ Bushwick South                                   │
│ Kew Gardens Hills                                │
│ East New York                                    │
│ Bay Ridge                                        │
│ Sheepshead Bay-Gerritsen Beach-Manhattan Beach   │
│ Forest Hills                                     │
│ Baisley Park                                     │
│ Marble Hill-Inwood                               │
│ park-cemetery-etc-Brooklyn                       │
│ Ozone Park                                       │
│ Bushwick North                                   │
│ Brownsville                                      │
│ Jamaica Estates-Holliswood                       │
│ Flatbush                                         │
│ University Heights-Morris Heights                │
│ Murray Hill                                      │
│ Springfield Gardens South-Brookville             │
│ Bedford Park-Fordham North                       │
│ Ocean Parkway South                              │
│ Rosedale                                         │
│ Corona                                           │
│ Mount Hope                                       │
│ Belmont                                          │
│ Maspeth                                          │
│ Ridgewood                                        │
│ Woodhaven                                        │
│ park-cemetery-etc-Bronx                          │
│ Pelham Bay-Country Club-City Island              │
│ Borough Park                                     │
│ Bensonhurst East                                 │
│ Highbridge                                       │
│ Washington Heights North                         │
│ Middle Village                                   │
│ Homecrest                                        │
│ Midwood                                          │
│ Hammels-Arverne-Edgemere                         │
│ East New York (Pennsylvania Ave)                 │
└──────────────────────────────────────────────────┘
┌─pickup_ntaname─────────────────────┐
│ Bellerose                          │
│ Rugby-Remsen Village               │
│ Dyker Heights                      │
│ Norwood                            │
│ Brighton Beach                     │
│ Canarsie                           │
│ Flatlands                          │
│ Cypress Hills-City Line            │
│ Claremont-Bathgate                 │
│ Sunset Park East                   │
│ Fresh Meadows-Utopia               │
│ Pomonok-Flushing Heights-Hillcrest │
│ East Flatbush-Farragut             │
│ Great Kills                        │
└────────────────────────────────────┘
┌─pickup_ntaname──────────────────────────────────┐
│ Gravesend                                       │
│ Soundview-Castle Hill-Clason Point-Harding Park │
│ Georgetown-Marine Park-Bergen Beach-Mill Basin  │
│ Springfield Gardens North                       │
│ Queensboro Hill                                 │
│ Erasmus                                         │
│ Van Cortlandt Village                           │
│ Bayside-Bayside Hills                           │
│ West Farms-Bronx River                          │
│ Morrisania-Melrose                              │
│ West New Brighton-New Brighton-St. George       │
│ East Tremont                                    │
│ Queens Village                                  │
│ Soundview-Bruckner                              │
└─────────────────────────────────────────────────┘
┌─pickup_ntaname──────────────────────────┐
│ Eastchester-Edenwald-Baychester         │
│ Bronxdale                               │
│ Westchester-Unionport                   │
│ College Point                           │
│ Laurelton                               │
│ Williamsbridge-Olinville                │
│ Old Town-Dongan Hills-South Beach       │
│ Van Nest-Morris Park-Westchester Square │
└─────────────────────────────────────────┘
┌─pickup_ntaname───────────────────────────┐
│ Seagate-Coney Island                     │
│ Stapleton-Rosebank                       │
│ Schuylerville-Throgs Neck-Edgewater Park │
│ Bensonhurst West                         │
│ Parkchester                              │
│ Madison                                  │
│ Crotona Park East                        │
│ St. Albans                               │
│ Fordham South                            │
│ East Flushing                            │
└──────────────────────────────────────────┘
┌─pickup_ntaname────────────────────────────────────────┐
│ Breezy Point-Belle Harbor-Rockaway Park-Broad Channel │
│ Bath Beach                                            │
│ Pelham Parkway                                        │
│ Co-op City                                            │
│ Longwood                                              │
│ North Riverdale-Fieldston-Riverdale                   │
└───────────────────────────────────────────────────────┘
┌─pickup_ntaname──────────────────┐
│ Auburndale                      │
│ Grasmere-Arrochar-Ft. Wadsworth │
└─────────────────────────────────┘
┌─pickup_ntaname──────────┐
│ Allerton-Pelham Gardens │
│ West Brighton           │
└─────────────────────────┘
┌─pickup_ntaname──────────┐
│ Whitestone              │
│ Lindenwood-Howard Beach │
└─────────────────────────┘
┌─pickup_ntaname──────────────────────┐
│ New Dorp-Midland Beach              │
│ Ft. Totten-Bay Terrace-Clearview    │
│ Glen Oaks-Floral Park-New Hyde Park │
└─────────────────────────────────────┘
┌─pickup_ntaname────────────────────┐
│ New Springville-Bloomfield-Travis │
└───────────────────────────────────┘
┌─pickup_ntaname───────────────────────┐
│ Douglas Manor-Douglaston-Little Neck │
└──────────────────────────────────────┘
┌─pickup_ntaname─┐
│ Hollis         │
└────────────────┘
┌─pickup_ntaname─────────────────────────────┐
│ Annadale-Huguenot-Prince's Bay-Eltingville │
│ Cambria Heights                            │
└────────────────────────────────────────────┘
┌─pickup_ntaname─────────────────────────────────────┐
│ Mariner's Harbor-Arlington-Port Ivory-Graniteville │
└────────────────────────────────────────────────────┘
┌─pickup_ntaname──┐
│ Oakland Gardens │
└─────────────────┘
┌─pickup_ntaname─┐
│ Starrett City  │
└────────────────┘
┌─pickup_ntaname───────────────────────────────────────────┐
│ Todt Hill-Emerson Hill-Heartland Village-Lighthouse Hill │
└──────────────────────────────────────────────────────────┘
┌─pickup_ntaname─────────┐
│ Far Rockaway-Bayswater │
└────────────────────────┘
┌─pickup_ntaname───────────┐
│ New Brighton-Silver Lake │
└──────────────────────────┘
┌─pickup_ntaname────────────────┐
│ Grymes Hill-Clifton-Fox Hills │
└───────────────────────────────┘

190 rows in set. Elapsed: 0.039 sec. Processed 2.00 million rows, 60.32 MB (51.59 million rows/s., 1.56 GB/s.)
Peak memory usage: 12.67 MiB.
```
##### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :) SELECT round(avg(tip_amount), 2) FROM trips

```
SELECT round(avg(tip_amount), 2)
FROM trips

Query id: 483688f5-7c70-4fde-ae8e-5fcd7c99a179

┌─round(avg(tip_amount), 2)─┐
│                      1.68 │
└───────────────────────────┘

1 row in set. Elapsed: 0.018 sec. Processed 2.00 million rows, 8.00 MB (113.75 million rows/s., 455.00 MB/s.)
Peak memory usage: 129.33 KiB.
```
#### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :) SELECT passenger_count, ceil(avg(total_amount),2) AS average_total_amount FROM trips GROUP BY passenger_count
```
SELECT
    passenger_count,
    ceil(avg(total_amount), 2) AS average_total_amount
FROM trips
GROUP BY passenger_count

Query id: c60c9f21-c370-4c11-bd34-ae4a53008010

┌─passenger_count─┬─average_total_amount─┐
│               0 │                22.69 │
│               1 │                15.97 │
│               2 │                17.15 │
│               3 │                16.76 │
│               4 │                17.33 │
│               5 │                16.35 │
│               6 │                16.04 │
│               7 │                 59.8 │
│               8 │                36.41 │
│               9 │                 9.81 │
└─────────────────┴──────────────────────┘

10 rows in set. Elapsed: 0.021 sec. Processed 2.00 million rows, 10.00 MB (97.00 million rows/s., 484.98 MB/s.)
Peak memory usage: 1.06 MiB.
```
##### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :) CREATE DICTIONARY taxi_zone_dictionary(`LocationID` UInt16 DEFAULT 0,`Borough` String,`Zone` String,`service_zone` String) PRIMARY KEY LocationID SOURCE(HTTP(URL 'https://datasets-documentation.s3.eu-west-3.amazonaws.com/nyc-taxi/taxi_zone_lookup.csv' FORMAT 'CSVWithNames')) LIFETIME(MIN 0 MAX 0) LAYOUT(HASHED_ARRAY())

```
CREATE DICTIONARY taxi_zone_dictionary
(
    `LocationID` UInt16 DEFAULT 0,
    `Borough` String,
    `Zone` String,
    `service_zone` String
)
PRIMARY KEY LocationID
SOURCE(HTTP(URL 'https://datasets-documentation.s3.eu-west-3.amazonaws.com/nyc-taxi/taxi_zone_lookup.csv' FORMAT 'CSVWithNames'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(HASHED_ARRAY())

Query id: 95f77c45-6815-4a5c-b17b-8fb1d318b9c2

Ok.

0 rows in set. Elapsed: 0.005 sec.
```
##### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :) SELECT dictGet('taxi_zone_dictionary', 'Borough', 132)

```
SELECT dictGet('taxi_zone_dictionary', 'Borough', 132)

Query id: 4497c71a-9bd5-4a1d-b189-2a0f637a54d0

┌─dictGet('taxi_zone_dictionary', 'Borough', 132)─┐
│ Queens                                          │
└─────────────────────────────────────────────────┘

1 row in set. Elapsed: 0.002 sec.
```
##### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :) SELECT dictGet('taxi_zone_dictionary', 'Borough', 132)

```
SELECT dictGet('taxi_zone_dictionary', 'Borough', 132)

Query id: 4fee18cd-3c94-4288-9234-48607279f482

┌─dictGet('taxi_zone_dictionary', 'Borough', 132)─┐
│ Queens                                          │
└─────────────────────────────────────────────────┘

1 row in set. Elapsed: 0.002 sec.
```
##### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :) SELECT count(1) AS total, dictGetOrDefault('taxi_zone_dictionary','Borough', toUInt64(pickup_nyct2010_gid), 'Unknown') AS borough_name FROM trips WHERE dropoff_nyct2010_gid = 132 OR dropoff_nyct2010_gid = 138 GROUP BY borough_name ORDER BY total DESC

```
SELECT
    count(1) AS total,
    dictGetOrDefault('taxi_zone_dictionary', 'Borough', toUInt64(pickup_nyct2010_gid), 'Unknown') AS borough_name
FROM trips
WHERE (dropoff_nyct2010_gid = 132) OR (dropoff_nyct2010_gid = 138)
GROUP BY borough_name
ORDER BY total DESC

Query id: 91476f58-cd09-45cb-bb7a-11806edbe6bf

┌─total─┬─borough_name──┐
│ 23683 │ Unknown       │
│  7053 │ Manhattan     │
│  6828 │ Brooklyn      │
│  4458 │ Queens        │
│  2670 │ Bronx         │
│   554 │ Staten Island │
│    53 │ EWR           │
└───────┴───────────────┘

7 rows in set. Elapsed: 0.015 sec. Processed 2.00 million rows, 4.00 MB (130.46 million rows/s., 260.91 MB/s.)
Peak memory usage: 804.58 KiB.
```
##### chi-demo-01-demo-01-0-0-0.chi-demo-01-demo-01-0-0.demo.svc.cluster.local :) SELECT count(1) AS total, Borough FROM trips JOIN taxi_zone_dictionary ON toUInt64(trips.pickup_nyct2010_gid) = taxi_zone_dictionary.LocationID WHERE dropoff_nyct2010_gid = 132 OR dropoff_nyct2010_gid = 138 GROUP BY Borough ORDER BY total DESC

```
SELECT
    count(1) AS total,
    Borough
FROM trips
INNER JOIN taxi_zone_dictionary ON toUInt64(trips.pickup_nyct2010_gid) = taxi_zone_dictionary.LocationID
WHERE (dropoff_nyct2010_gid = 132) OR (dropoff_nyct2010_gid = 138)
GROUP BY Borough
ORDER BY total DESC

Query id: 0c387dd7-c25e-4b62-a9d3-71981c21f2c0

┌─total─┬─Borough───────┐
│  7053 │ Manhattan     │
│  6828 │ Brooklyn      │
│  4458 │ Queens        │
│  2670 │ Bronx         │
│   554 │ Staten Island │
│    53 │ EWR           │
└───────┴───────────────┘

6 rows in set. Elapsed: 0.049 sec. Processed 2.00 million rows, 4.00 MB (41.12 million rows/s., 82.25 MB/s.)
Peak memory usage: 496.75 KiB.
```