From: Tomofumi Hayashi <s1061123@gmail.com>
Subject: [Call for testing!] miniupnpd with nftables!
Date: Tue, 31 Mar 2015 17:50:38 +0900
Message-ID: <CAOUi3w+J1t+6N7RiOKw36EYxbLiKw23pNBx_SFaf+_YaNx5KBg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=aj/vfqEOhtTWqTG6G0MXWSSgDruN0jZgarh45uZaPwg=;
        b=JsQUEHMGE1hbTIhbuM3iEyPD26s9pzZdvuFvv1L1VkWqIscFEJ57xqGJWg2J8/j9DP
         MHmlG3e6Dko7e7hnDnrIm0CoJnaiC7rdtNLmlIKKmC4/N+PCNI861PAquqdSipc1Ondg
         YF7PWWFerdus4tc4LfexHEskKn02tnhC9TlKjSVDhQYtawnTslBLsgsZke5NZ3Tbg9Du
         l+o6d9MUc9d9lM7mr3KY7DiRKdXXHF4xQyek4PM2i/8RlYYcD3H9+DGlEoFGc7XKC8eQ
         s2ryh2gASQtttIBDZS0VuG77UxED/3k5ED0c6vyZ8dpoLh/T5HacFhLEPWrfdwECKlDv
         KInw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi folks,

I am interested in nftables and currently working miniupnpd to support
nftables in following github.
https://github.com/s1061123/miniupnp

Currently simple functions (SNAT/port forwarding) are ready so I decide
to start to call for testing.

Here is the wiki which contains generic info, including "how to build".
https://github.com/s1061123/miniupnp/wiki/miniupnp-nftables-support

I appreciate if you are interested in miniupnpd as well as nftables
and you start to test it!
Comments, fixes, and some testing reports are very welcome.


Cheers,
Tomofumi
