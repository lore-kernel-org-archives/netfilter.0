From: Martin Gignac <martin.gignac@gmail.com>
Subject: 'Did not kill' written out when redirecting 'nft list ruleset' in 0.9.8
Date: Wed, 24 Feb 2021 18:00:23 -0500
Message-ID: <CANf9dFOxZ9VyjyruHuU3OJu0+-1-Bsnhaw2u8XfqyDpmK26mRg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=KTPKEiZDbdRVtfH0i4Tq8MGrTMILtM9xhHRR6wFHWus=;
        b=fdMUjYaJf2wm84wuYOpHIrgLVdW146Wq0R3OY9lZStnsFUYUggPgR2f+vAof5dPCh2
         aXanZXrA5LeV29JqjEs8/GXN2s2cTKxuH/7JMYnQux/57ATHUevL50FOAATU1TIXPNDs
         QauOd8BNBfld/wU6QKdgPxIqyqcPGT/O/whANE5Ie5b0MGngAGxxwYSin0SIZ42OdtEz
         zwHZ1hFXsudps7N6NFMaVR79sbUJK1x8biKJx8yPOmNHrkfalKCroYmoF6sQwLiSqDb0
         kNpP6NeSOHfPCJsITvC7J8ZO67yBwi6TfXq2OmLKaHxnBRdtC5Ky6ZJh3ztCbcs/amb9
         cH1g==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

With nft 0.9.8, if I run 'nft list ruleset' and redirect to a file, it
prints out "Did not kill":

    [root@s116r2l1fw01b magi]# nft -v
    nftables v0.9.8 (E.D.S.)
    [root@s116r2l1fw01b magi]# nft list ruleset > /dev/null
    Did not kill
    [root@s116r2l1fw01b magi]#

On 0.9.7, it does not:

    [root@s116r2l1fw01b magi]# nft -v
    nftables v0.9.7 (Anyface)
    [root@s116r2l1fw01b magi]# nft list ruleset > /dev/null
    [root@s116r2l1fw01b magi]#

Does anyone else see this behavior? If so, do you know what "Did not
kill" is/means?

I am on Fedora 33 (5.10.16-200.fc33.x86_64).

Thanks,
-Martin
