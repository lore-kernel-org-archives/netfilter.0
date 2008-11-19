From: "patrick daures" <patrick.daures@gmail.com>
Subject: DNAT + Bridge ?
Date: Wed, 19 Nov 2008 16:42:55 +0100
Message-ID: <5ed0ca650811190742p16982fd0u6a001d751052135b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=Jc8uwtE9MubH1ou3AnavM0HGKWUY4MEEQeyhsNotuJU=;
        b=JtQwv/vhR+1lfyrNuseLUEIyogi4fGGTowbZS067NnpItrRGAhspXX3UHBqI2uGWs/
         /ewi6cB6qOnIjQduwIJ9qwhT0lYAeuZ3+XfUBykEkCqRuTAs4A/5AxDBNvMIJpTPewli
         Kbp92uD+2RvjWbROxseeVEcWVx5cVrWfmFU9M=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm trying to do DNAT on a bridge.
This is the configuration of my network :

COMPUTER1 eth0 ------------eth0 BRIDGE1 eth1------------ eth0
COMPUTER2 eth1--------eth0 BRIDGE2 eth1--------- eth0 COMPUTER3


|eth2 _ _ _ _ _  eth0 COMPUTER4

@IPs :

192.168.1.1-------bridge1----- 192.168.1.2 |  192.168.2.2--------
bridge2 --------- 192.168.2.1

                    | _ _ _ 199.0.2.1

I try to du DNAT on bridge1 with iptables :
iptables -t nat -A PREROUTING -s 192.168.1.1 -d 192.168.2.1 -j DNAT
--to-destination 199.0.2.1

Without DNAT :
COMPUTER1 can ping COMPUTER 3 & COMPUTER4. So, my bridges look OK.

But, when I activate my little iptables rule, bridge1 seems to do
DNAT, packets are sent to bridge1 eth0 interface, but nothing seems to
be sent to computer2.

What did I do wrong ?
Thank you !
