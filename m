From: "Andrew Good" <netrati@gmail.com>
Subject: Multiple Gateways and SNAT
Date: Thu, 18 Oct 2007 08:15:23 +0900
Message-ID: <9ae240b20710171615s23c4218ds2092061160cbc8ef@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=cvJkB1Jar6N/ABAm0Jk9Y8asv9vlGKZiCRz3fwMrPZk=;
        b=TijTTIRLKX5co//27w8BIIjCCBjREHq4ZP5CRo/86ScX4QaWI4PE57zn3djS1QMiL84Y65n0wDpdkxJDR3kUt7sRVfJaRACjAnVAj3hX9w2Xbr+Wjt3UNm6Apn55EJ6X84wAk1bKuarbjVAe8VZBMSp2imbhzIrpeT5Uyzld4BY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello! I have two interfaces I'm trying to load balancing over with
the gateway box doing SNAT for the LAN. The problem is packets try to
go out on the eth2 interface with the external IP address of eth1 even
though I've definied the routing rule. Any ideas?? Thanks


iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to 12.23.32.15
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 34.36.23.89

ip route add default scope global nexthop via 12.23.32.1 dev eth2
weight 1 nexthop via 34.36.23.1 dev eth1 weight 1

ip rule add from 12.23.32.15 lookup 200
ip rule add from 34.36.23.89 lookup 201

ip rule add default via 12.23.32.1 dev eth2 tab 200
ip rule add default via 34.36.23.1 dev eth1 tab 201
