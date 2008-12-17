From: "Hag Unt" <hagayu.sys@gmail.com>
Subject: using EBTABLES to route traffic to specific VLAN
Date: Wed, 17 Dec 2008 14:48:21 +0200
Message-ID: <5736f2bf0812170448j5e9d54b2v8da0344e4df8d441@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=/f0exixlNP5S3IUoAvT4MrpgMHVMNudYOhgvUWy2rpY=;
        b=HtOu/t1wZ+34tdez/jNtjF9pilYVxD24YNyRGhdYCQs3JXDGEePQB4ED5Zw41xWI3/
         J9l6ZB2Jc+qVAXcOmVUPYm5SCkb/oUc1gQkQjD/sLZ0a+QX7cwHDt4nm2bJc7/3WcIhs
         H6rae71PoVx0yYkG22F3tB9As0wnsWk+NaiWw=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I have the following configuration:
* eth1 connected to the LAN #1
* eth2 connected to the LAN #2 & LAN #3 usinf VLAN Tagging (802.1q) -
this NIC is configured with VLAN Tagging and connected to VLAN 20 &
VLAN 30
* I configured bridge br0 between eth1 and eth2.20 and eth2.30


I would like to use ebtables to do the following:
* All traffic coming from LAN#2 and directed to 192.168.0.0/24 needs
to go through eth2.20 and all the rest through eth2.30

Is there a way to do it with only ebtables?

Do I must use iptables as well?

I am using centos 5.2.

Can someone send me an example how to do it?

Thanks

HU
