| Resource                  | Field                 | Default Value            |
| ------------------------- | --------------------- | ------------------------ |
| **hw_resource_base**      |                       |                          |
|                           | enabled: boolean      | true                     |
|                           | connected: boolean    | TODO(TimS) Init Prcess   |
|                           | resource_slug: text   | 'ps'                     |
| **alarm_configuration**   |                       |                          |
|                           | critical_high         | 245                      |
|                           | warning_high          | 240                      |
|                           | warning_low           | 20                       |
|                           | critical_low          | 10                       |
|                           | alarm_mature_to       | 15                       |
| **sampling_config**       |                       |                          |
|                           | sampling_interval     | 15                       |
|                           | logging_period        | 3600                     |
| **transient_config**      |                       |                          |
|                           | trans_si              | 5                        |
|                           | tolerance             | 30                       |
| **calibration**           |                       |                          |
|                           | raw_low               | at assembly              |
|                           | raw_high              | at assembly              |
|                           | high                  | at assembly              |
|                           | low                   | at assembly              |


| Resource                | Field               | Default Value          |
|-------------------------|---------------------|------------------------|
| **hw_resource_base**    |                     |                        |
|                         | enabled: boolean    | true                   |
|                         | connected: boolean  | TODO(TimS) Init Prcess |
|                         | resource_slug: text | 'tm'                   |
| **alarm_configuration** |                     |                        |
|                         | critical_high       | 60                     |
|                         | warning_high        | 55                     |
|                         | warning_low         | 38                     |
|                         | critical_low        | 32                     |
|                         | alarm_mature_to     | 15                     |
| **sampling_config**     |                     |                        |
|                         | sampling_interval   | 15                     |
|                         | logging_period      | 3600                   |
| **calibration**         |                     |                        |
|                         | raw_low             | at assembly            |
|                         | raw_high            | at assembly            |
|                         | high                | at assembly            |
|                         | low                 | at assembly            |
