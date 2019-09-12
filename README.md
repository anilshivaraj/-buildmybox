# BuildMyBox - deletescratchorg

The [Buildmybox App](http://www.buildmy-box.com/) includes various functionalities, one of them is to delete the scratch org once the changes are done and migrated. This is required to avoid reaching the limit for active scratch orgs.

This branch includes th logic for the **Scratch Org Deletion** functionality.

### Delete Scratch Org

- Open **Buildmybox App** in salesforce and go the `Request Scratch Org` record related to the scratch org which you no longer require.

- Go to the `Login Details` section and click on 'Delete Org' button. This invokes the CI job from `.circleci/config.yml` and the job will delete the specific scratch org.

![](https://lh3.googleusercontent.com/aO9v9lN3py64oIkS_bjcFxWRu_0x2qIbl95k8tVzdFz7YGTpnjnmxMyeQb7B6lcrM4PemBXUDPZq9tGf4qztWAWCRMkQtgrQ3O1b3BMPuhmAdicGy2W6xvq-Y3h_JI6HA1nAxNKkxDnoCgBJG5C15SrA2fpvGM6GruudFcyflQLTlxN_kTiJo5TrHCvGvfkRyIGqv2jlLi_xuk-eZljn_4mcJweXwdHPbFREi0uCLD1h86fxvbEyXQkUyRtX-mRCD3MamMDNXUO5GBho0bx3i-MpAeWnWqn-iREFUouHkxaE4xm0bystSZaSYeZY8AoQuoCdXNHJx1jPFUccL4L16-kDD-7X-QYsgsuwXydvrPC-lojPxOzinFUlW_U4Bazzx8MO3vunRVHsOhQmGbbiobNxxPcfBFopxnGkJuvrd8GpyrScBX-HaClBeQwTU0lL-tGgzJ7z9RWffmnpizqmDL4bSofbiKPP5HlXVTfDJlehSY7Hnef8ec3ycyRBLf62TY0Y8_N9wJfHm75w-vJh4VPkRGg0R1RQZ3GL2SbJ7y_foQolalN81vcKdmhmMdNUcq2HOJZ3pAcLO-kZZSn892c7W7ePyleipX4c6vEN0fTNbkfgiPFpvLYvATf6K704coeOSZt85KC7KuNJEIS41dvP9rUEoanPA8aKwNpq5sYJQkUwWZvAHCXDDow23iVWJUq6fH8MRTOqITrtpUDCm8THcFJIlc1VnihyGu2-VLp48Uh6=w1644-h577-no)

