# BuildMyBox - createscratchorg

This contains the components and data that will be deployed to the scratch Orgs while creation through [Buildmybox App](http://www.buildmy-box.com/).

Make sure to complete all the manual steps mentioned in the [Buildmybox site](http://www.buildmy-box.com/) for this repository to work.

## Getting Started

1) [Fork](http://help.github.com/fork-a-repo/) this repo into your github account using the fork link at the top of the page.

2) Clone your forked repo locally: `git clone https://github.com/<git_username>/sfdx-circleci.git`

3) Encrypt and store the server.key generated above using the instructions below.

    - First, we will generate a key and initializtion vector (iv) to encrypt your server.key file locally.  The key and iv will be used by Circleci to decrypt your server key in the build environment.

    ```bash
    $ openssl enc -aes-256-cbc -k <passphrase here> -P -md sha1 -nosalt
      key=E5E9FA1BA31ECD1AE84F75CAAA474F3A663F05F412028F81DA65D26EE56424B2
      iv =E93DA465B309C53FEC5FF93C9637DA58
    ```

> Make note of the `key` and `iv` values output to the screen. You will use the values following `key=` and `iv =` to encrypt your `server.key` in the next step.

  - Encrypt the `server.key` using the newly generated `key` and `iv` values.  The `key` and `iv` values *should* only be used once, don't use them to encrypt more than the `server.key`.  While you can re-use this pair to encrypt other things, it is considered a security violation to do so.  Every time you run the command above, a new `key` and `iv` value will be generated.  IE, you can not regenerated the same pair, so if you lose these values you will need to generated new ones and encrypt again.

    ```bash
    openssl enc -nosalt -aes-256-cbc -in assets/server.key -out assets/server.key.enc -base64 -K <key from above> -iv <iv from above>
    ```
 
  - Store the `key`, `iv` and contents of `server.key.enc` as protected environment variables in the Circleci UI. These valus are considered *secret* so please treat them as such.

4) From you JWT-Based connected app on Salesforce, retrieve the generated `Consumer Key` and store in a Circleci environment variable named `HUB_CONSUMER_KEY` using the Circleci UI.

5) Store the user name that you use to access your Dev Hub in a Circleci environment variable named `HUB_SFDX_USER` using the Circleci UI. Note that this username is the username that you use to access your Dev Hub.

6) Store the `key` and `iv` values used above in Circleci environment variables named `DECRYPTION_KEY` and `DECRYPTION_IV` respectively.  When finished setting environment variables you environment variables setup screen should look like the one below.

![alt text](assets/images/screenshot-194.png)

7) IMPORTANT! Remove your `server.key`: `rm assets/server.key`, you should never store keys or certificates in a public place.

Now when you commit and push a change, your change will kick off a Circle CI build.

## Contributing to the Repository ###

If you find any issues or opportunities for improving this repository, fix them!  Feel free to contribute to this project by [forking](http://help.github.com/fork-a-repo/) this repository and make changes to the content.  Once you've made your changes, share them back with the community by sending a pull request. Please see [How to send pull requests](http://help.github.com/send-pull-requests/) for more information about contributing to Github projects.

## Reporting Issues ###

If you find any issues with this demo that you can't fix, feel free to report them in the [issues](https://github.com/forcedotcom/sfdx-circleci/issues) section of this repository.
