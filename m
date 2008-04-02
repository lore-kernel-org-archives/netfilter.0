From: "nir m" <nirm003@gmail.com>
Subject: ARP proxy without iptables
Date: Wed, 2 Apr 2008 14:40:59 +0300
Message-ID: <e99c12ee0804020440h41f87b92tb7486616b86bc7bc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=hpz81LBC+ycHFJhBAKXNn0XSECvC0HeEYlIkypDk3js=;
        b=esg7CTjDMc2bQCekhM1eJ7yvUglapAI9L5UweIsMxsyeHvViQTeUQELpOLuMGFfgtu34vWYl3Vg+N30AKoS3BvBqGUrhinbFrtCE286dsW92ekG061KiyFZvqRblwbP6jRg+6PTJLf2No0siOtCTeu+AmD/RnSz23MW7AIhmLlo=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I would like to set up an ARP proxy on my machine.
meaning, monitor arp replies as they pass through the machine,
save them in some database and use them to reply for arp requests.
I saw that there is a proxy_arp file in /proc which as I understand
configures just that but the problem is that my machine is not a router
so It cannot forward ip traffic and actually, installing iptables is not
an option for me..
I searched for an ebtables solution and found that it almost does what I want.
 It has the arpreply feature which does what I want but for one specific MAC
address which need to be supplied so I'd need one rule per MAC address I know
which is too much...
So I'm thinking that maybe I overlooked something in ebtables or maybe
I'm missing
an absolutely different, yet simple solution to my problem.
Does anyone have any suggestions?
Thanks
