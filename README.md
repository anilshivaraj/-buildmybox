# BuildMyBox - resetpassword

The [Buildmybox App](http://www.buildmy-box.com/) includes various functionalities, one of them is to reset the password of the created scratch org. This helps the user to change the password anytime with just one button click.

This branch includes th logic for the **Password Reset** functionality.

### Reset the password for Scratch Org

- Open **Buildmybox App** in salesforce and go the `Request Scratch Org` record related to the scratch org for which you want to change the password.

- Go to the `Login Details` section and click on 'Reset Password' button. This invokes the CI job from `.circleci/config.yml` and the job will reset the password and the updated password will be displayed in the same `Login Details` section.

![](https://lh3.googleusercontent.com/oseJqIYbqBdUlV3vjoyBxTS2sPeBAadIN1dtGq7NQgKdUBraHPvbHdbuIPoka6Vkww3ExP69tFLqVr2L3rFWxQiBUPom4yrX4XohAuSw0-JunkgjETuyLOHWYU5Cu8WJR2vH_XTGUyuamcOG7t9qVSN55X0fMiaZP2XvmpaIAdaddD8SH_9HSwn6kmjyJk-fsjplvXBuq2TVo-VsF6z4wc511RCIwX_E9yLBiOpk1PCJYlh2cSh7EicZBt8QII92RweaPYYA-tmmaTAdCVHiwFLP7xmZS9o9fYa0Mut6FV3aiRso7p3DSvFUUB72CjUaYMO5-5vmHLsiwjwogDlja3LQbCQYR3685gVru1kXIl8behemNKTwyFzx8NR2Fc3l2ZTKA0-hFSzyzgwgZPwmom_m2yMwVLNPRzMq7RivtegL43F7G3-Lnm3LwZTbcCZSmF2ZTfBjjLZRCvxiXhrcsM1Maytcueez07fMKfW26lM8GtaNLrb3U0-1UIDymbUpO46myZ2b8YnAfGFSLYucb2YGyD1roN0OzZANmPfQlPcOGHeCPNRFE1XNQbFk50v47J5c7WWcBm_tS3OBz09KE2Qqwmz7RUyF0d_D3rAvUCArsiUHwwBA5Top35wUobBQYwvOt3GMUStcbRTx8i5eTr48wzssWdipI3YIwAubaUulTztT8SGKFgCSjQ4FHJy66rdpgZH2rukNiL8rSzlS9GHyhRHsYE3mkesWl1FHS538_Y64=w1634-h581-no)

