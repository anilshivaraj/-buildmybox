# BuildMyBox - createscratchorg

This contains the components and data that will be deployed to the scratch Orgs while creation through [Buildmybox App](http://www.buildmy-box.com/).

Make sure to complete all the manual steps mentioned in the [Buildmybox site](http://www.buildmy-box.com/) for this repository to work.

![](https://lh3.googleusercontent.com/jSfc1btj4PCOJMyJv1M9low7mK4yVW-69t6UI2yHWuDV0kZ5eLDwa6vummy7-ix9WTxa-Qlmpq8NIVrbYV08kgD8jybKdpRzjzPq0SC8mFK1U_R0mTjgRMmssABUH8pi2sYmYDe2xcZP_kEtKX_r90rFqQvv9hFIxD_aCKKY8cV3jS8rFuk2-_2BYb-aRyHx6b5IHpK-Vmy_mQ9N9Lk1YqAZ6CUwQcK0uRZZL6tsIDxeIRej5_4dy7CBxMQpAzvMPv86SZeGERGGCNw3C45Xhn82JcwcBm-IC7lFTGn2reBJODasiIp4r9NfzM7aAxrD9fMZXXZsaW0be9C8cp3bM9yv8kdX5ohjOj6axINSCO9L-OZj-BHe5u8zxhDTQtdxI3sEkQl6WMJshgxD-Ki5LNI3YajVBH7LDEolrlhJGFnTTz8lq0jyBCrE-Bja6Z32T4U6Ve7HwCp-ZkJoycUkvvIMlOuV3cvde3LXxPhFeMXAaYOJs2g5X_ncnoqznMlEWNoAObd-luwA9A26ad3eKD7FKfmrzNiXszC5VwdlBFb4tEV0iLppv8-kV9GfVGsGbRfPPRu0gsr_PUw-5T03RToXxq41bKsocWIzSY3Sc7zMABKlxpVp0DmadJ8nG3Pba-h-TsvohmnUiuJpWTzEk-tzO25Kd-7ZkFsixW3efI6cuFlDXqsjjg2Z=w1655-h903-no)

## Getting Started

1) [Fork](http://help.github.com/fork-a-repo/) this repo into your github account using the fork link at the top of the page.

2) Clone your forked repo locally: `git clone https://github.com/<git_username>/sfdx-circleci.git`

3) From you JWT-Based connected app on Salesforce, retrieve the generated `Consumer Key` and store in a Circleci environment variable named `HUB_CONSUMER_KEY` using the Circleci UI.

4) Store the user name that you use to access your Dev Hub in a Circleci environment variable named `HUB_SFDX_USER` using the Circleci UI. Note that this username is the username that you use to access your Dev Hub.

5) Store the `key` and `iv` values used above in Circleci environment variables named `DECRYPTION_KEY` and `DECRYPTION_IV` respectively.  When finished setting environment variables you environment variables setup screen should look like the one below.

![alt text](assets/images/screenshot-194.png)

6) IMPORTANT! Remove your `server.key`: `rm assets/server.key`, you should never store keys or certificates in a public place.

Now when you commit and push a change, your change will kick off a Circle CI build.

## Team ###

<table border="0">
    <tr>
        <td width="200px"><img src="https://lh3.googleusercontent.com/mljlcYpi4qFYdVnEjRwqW-gm48ikcnOgCKAP9i8L2NK7HZgdS_muRhMhrelyRAW1LD7Cjj8KczhG-KCwc5hTGxxIYhezgYy16Z4DZBDlgCjyvJdPDuky8XGBSHJSn4v5lenI3LGtG-m8JqJYWQcwpA3ClJI5LcqZIJcdKM5Q6VL_FB5YRmDkThlfXx-o_UhzqBx46FcPE2ccvRmQvLNYunXPnzElh5o8jDTQTV081_PHhfmzxRsykNWXowBJsBLL1Vee-Nu1gzF5qdlEdP_9Yfl2NobMbFf06dyqt-iddEjnN6CRIr7kjunkhPdi3_GcYsPAQRNL7kn5bDeOJ_dVvfmRUfI6ytNhpsMqtVWtb1tFq4l2FJTJTRkoT_H-WPokqqTySEzSU7qYYoxEgHx0gEwSWT8ywBFDm_FRGeLcAQpQe3FLqMUJDk_btTGg4kcW9GCGNCicNlgZdRbvfbRfA9E88SSw7rfsDO6tMN0dUKk46kcJWMCqtGaPPRfqqF0XFt3RaxI2o_3BsJ82oijiDKPfUFyCRR0F6oJtDLCmaOM5TqDsZt2Tal4kmiLl-BYZV4tLj0a-F_w-4QP_UkIWDnOoaH7RWp_vlaGgjWiKFZhJh1g4GvDieKzjYGoqrECWQtAvVXB8A_BKz0QQ4uTUtgFYmfCNFrE-PX85IPy6MsHvvx1EIK7-u5vMOz_Qj4cduwdDKpGLSbm4agP7bIJ7gwXPv7c7etwWzZNXZkwVKL2lbm2T=w159-h152-no" width="180" height="180"/> </td>
        <td> <b>Anil Shivaraj</b><code> Specialist Master (Customer & M, NY office) </code> <br> Salesforce certified architect with 17+ salesforce certifications and extensive background in analytics and mobile platform. Worked with leading clients in Pharma and Insurance sector, leading multiple salesforce projects involving Devops and Agile delivery <br> Email : <a target="_top" href="mailto:ashivaraj@deloitte.com"><code>ashivaraj@deloitte.com</code></a></td>
    <tr>
        <td width="200px"><img src="https://lh3.googleusercontent.com/wwtE2FDueAHepwKBF97BcLLC4IR-_TfJAf6LVCZ5KL9eimEZvqqA0B4wHDZLnOa4-wQ3O64I-7y4OB0vXMpdHxOHeTbWUWfQxI_JU22SJ1WwuqezEfEB1Vmrtfpx4MSKMPSX-7oRRGU6qurb32lnkbBFoilXu1OfubGBoV2BqPdFNSRbdqFJ1qluJCobx86IO1clmKIsrPpZ8AJEpUKX1biaeSX8-a3QtPZPj-knbrueJG7y-LGWbx-cJMMMtu5yfhUyg_mLi3mdhD7lLFdcK3DS61JbKllbx1-BffQrM9UAMMJPPh5H6ingHvfGCl0I8vcxUXdU3-R2OQ0J6ae333_h7dwa2yE39P6EC-3crf_nXvoANWLlHLeWP7xf4AyGBbin9NMhKg3yow773OTBz-NeKAMkiOt894h6j43J4_ZDyVVODVF6YE6U4xZllw7xaR2K1JjS9TJI9nbwvly5RQReV_bN5sfmjYUsA-zyWNzIy1f-GY4MlJqleWiPqSKTjlgqqSs-IsUikDoxWYtybnVGjKQ9QVke5uE-zk21Hw3QKesnoQXh60jBtwt8slllnTT502zDd5J8rhigaCOCLnkma1zb0DzltdAp46Ib97PHFZCYsRD8269nHNjbV8jXWzEeAwebEqmdhR49XlSCsPppgNQDsQPbNzSu67eIbi-cnYC9xCKxpnUq3FSpdq7WsDuqURwFu1-mu6JmYmEBzpLDb-bKNXufsJSGQ-c8imYBpXaN=w252-h250-no" width="180" height="180" /></td>
        <td><b>Jaswinder Singh</b><code> Consultant (Customer & M, Bengaluru office) </code><br> Salesforce certified developer with 4.5 years of IT experience in salesforce. Worked extensively on Agile based sales and service cloud projects involving complex integrations. Experienced in both classic and Lightning development. <br> Email : <a target="_top" href="mailto:jaswinsingh@deloitte.com"><code>jaswinsingh@deloitte.com</code></a></td>
    </tr>
</table>
