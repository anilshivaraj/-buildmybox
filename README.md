# BuildMyBox - diffcheck

The [Buildmybox App](http://www.buildmy-box.com/) includes various functionalities, one of them is to fetch the changes made in the scratch org and store in the `Request Scratch Org` record in the app related to that scratch org.

This branch includes th logic for the **Difference Check** functionality.

### Check Difference in the Scratch Org

- Open **Buildmybox App** in salesforce and go the `Request Scratch Org` record related to the scratch org where you made changes.

- Go to the `Org Changes` section and click on 'Check Diff' button. This invokes the CI job from `.circleci/config.yml` for checking the changes made in scratch org and the changes will be tracked in the `Org Changes` section of the same record.

![](https://lh3.googleusercontent.com/sX9hQEUm5sGrknwJlCIa09Ogs3H145x1O5f5xKVk6KUwB-Av1jTE5kDMutKQ2xR1Vs2BuhalEj0UGON6dCgPDc7vpph8zk7lNsxpRwJ0qviizvhpPelUqOFcpzoMRtL-zEfLi7kMAC9ycNV4SeqixUucGwY-emGF_Hv5s2oN8Op5oyemS1la9wJ7bVHOXV-d-f6QW3HDyJleclIQ2m-oRya3-UH84-VWJ-mEpF7N_GOLNFGL2CIm5v3mOChN18I-Mk9IfopiSScQF3BocrlCajxO8sFvareNhXVtODIcAqQJ1q1_Pj7JHGcfRpiM79e9EjBwWXRxYQzGbgojRoEwgjhddcf1WfCio8I8gO4m6jPa6DvLJPteHJ9fWeXxy-Bz4zP3FiB-Q7HgbBA3n0t80QVC2fq588vXT-CYFwoFdu8dBBhf1Dma91NOEbui2h_8hKR41JFfkIiwDJuqiiRMmKxDF2MoshmxSP34dtnMlbVz0rVNtYJ5kh_xW_d8Eh121DO23UhJXqUfBLLA8-j5oI5bTGDD2q8UKXb2R5bf5KqTB6fO_1bPe1YUYY_TflQP2vAOwnwUquXhVs-0zbw6u9ar6_9ZjdcwC3sxdz9YWvEdxOQ0WlXLzKSbUSy2wjIQAFcTDW2A-ZrF6ehijD7P9aSIX89FYSrnsARW9phwrSAV9vO4bUAqnOoxbLknBLSR9HapGL6SVAw9nlNT8dV7jzU2nyDONPV6l8dhZ2FL57IzBlrB=w1380-h530-no)

