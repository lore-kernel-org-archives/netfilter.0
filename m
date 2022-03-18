From: Francisco Albani <francisco.albani@protonmail.com>
Subject: json_cmd not working as intended
Date: Fri, 18 Mar 2022 14:21:11 +0000
Message-ID: <uHSFrk1rZGQ1Q18XE415Rn-mCIl3BfZ8Gafuz8KTHku5GOGqGrX_1p4mZV6qSArpk5qFNrHuLh91XkgZUcS2F8bk14M1_2Pr2VIwjgtGpHs=@protonmail.com>
References: <rzuZZzgYS-alXXtKqSijqGY4qzRePPZDzK2WhOHyf9XM7VFftiTeOdCsLqlX9-H38XkwHr9x9RP2hgY4L1SKTx6KPSXLqoOrMGBggu7IzCw=@protonmail.com>
Reply-To: Francisco Albani <francisco.albani@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1647613273;
        bh=P7pGcHyUuu73HyPOSQqK7KkZMOttD+LSZn6Fbc0CopA=;
        h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
         From:To:Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=SVayS2ATSepNk3RUpfIBrYQRmzzlP+w+BjGJDK98S4ok8eHHD+Pgdgp0EZ7hbiRiM
         0alV3GojPmXh/gSOesGPEGPgXjKF0BdWt1iU9sTcMn3jaEVBaYyy6+cLgfl3rNBWBM
         KSE/+h6ys3kZLhlNhymltcrHbjtTmgLpsbs+TzWgRtIWpgcjfKavLC6nt4JTjgrXtI
         p5bTVp9owGSljtb7kS4ydiRHKOjaxHW6OIPBxM63jdY9csLKjvE9eSEoxKSPSs3LFF
         z3IBPQ6PlUN4ZVwZjt4PeTkEXYKQ6/4lN2kTFxUEwW5w9XdRWHSLjR2AW6WMfzxFbk
         3Bgom1EJonW+A==
In-Reply-To: <rzuZZzgYS-alXXtKqSijqGY4qzRePPZDzK2WhOHyf9XM7VFftiTeOdCsLqlX9-H38XkwHr9x9RP2hgY4L1SKTx6KPSXLqoOrMGBggu7IzCw=@protonmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi!

I was translating some nft cli bash scripts to python and tried to apply wh=
at I learned in https://man.archlinux.org/man/extra/nftables/libnftables-js=
on.5.en , but I could not make it work.

I made a repo with the minimal example that shows the difference: https://g=
ithub.com/franalbani/nftableson

I hope you can help me.

Thanks for your time.
Bye!

Francisco.
