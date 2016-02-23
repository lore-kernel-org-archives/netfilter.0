From: Ricardo Felipe Klein <klein.rfk@gmail.com>
Subject: IPSET spec/rpm for CentOS7
Date: Tue, 23 Feb 2016 09:44:32 -0300
Message-ID: <56CC5430.2060102@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=JQTXH0F7P14SQe1UDtBaGGBvK7kWdRqnEIrm7R+ere4=;
        b=nH0YS4dXAXWymjk8XwyccuDgMJ0X4BG2y/44F5HUEwZ0CrKF7xWC4rF5ZSGjbYAsNj
         iRo9AEshQVuuk9WZt/vAQgwKRQ/yRgmR73RkyGeEehvUTaAf/jI02TNyR9K7pZedezR4
         RdLg9E1Wc/fRv9GA9I1eEQzOL/WMxAUALgyUtP2XXWQIvNG/eWIkVgUu8Z+s1t99/sax
         FHTZAUke+v61s2YFS5n9MA0u3bsESGzRo/FYZHpGLJ5iTekAhM6WPGWBe7pnlGaYmncP
         DgnrKmlwLnKo+B7a+QAbS6ipwZ+6yF+9rLzxYXQrNYgzSrz257/Ox2FwSSWOydpJP3d3
         pr2g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi there,

I am trying to (re)build a CentOS 7 rpm package of ipset with the kernel 
modules, my work is based on the default CentOS7 ipset.spec file.
I am now able to build ipset 6.27 rpm package, but, not with the kernel 
modules.
Can someone help me?

The spec file is here:
https://github.com/kleinstuff/ipset_centos_spec/blob/master/ipset.spec

And the build logs:
https://drive.google.com/file/d/0B_MZOa-MiS6iZC03Mm9iOU5aSU0/view?usp=sharing
https://drive.google.com/file/d/0B_MZOa-MiS6iZnRGTEt0WVA3TGc/view?usp=sharing

Yes, I can build it with ./configure / make / make modules... But I dont 
want to build it in every of my firewalls and I need the newer version 
of the kernel modules because I use hash:mac on my firewall scripts.
