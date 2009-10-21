From: veerasena reddy <veeruyours@yahoo.com>
Subject: filtering frames based on destiantion MAC address using ebtables
Date: Wed, 21 Oct 2009 03:41:08 -0700 (PDT)
Message-ID: <638627.72853.qm@web56403.mail.re3.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1256121668; bh=9WPSxbj7GVenUpyLEdgP3wszd1v7rstmv6iveHcMJdw=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=uR1dRYvyrIQUqDifZd1FWclhKOu6F6oDr3wsm99Xaf0QkErZPwXFInpj2mIEeXj8IxD+TIlV2ajUALBvSXd1s46y10Py6Qq/RdHyQr1kU/xxCXhczLbIZj/fF3jWWmqa6qZxMXj7pkSceDHG11heacpd1g5hyo6nVx/pRAC6o5g=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am using 2.6.28.8 kernel and ebtables version v2.0.9-1. I am trying to configure ebtables to filter (DROP) all the frames from LAN to a WAN PC with specific destination MAC address.

My test setup is as below:

LAN_PC <--> eth0--My_bridge--eth1 <--> WAN_PC(MAC addr: 00:0b:db:da:34:0c)

My_bridge with eth0 and eth1 as its ports is configured as below:
/# ifconfig eth0 0.0.0.0 up
/# ifconfig eth1 0.0.0.0 up
/# brctl addbr test
/# brctl addif test eth0
/# brctl addif test eth1
/# ifconfig test 0.0.0.0 up

I have configured below ebtables rule to filter all the packets from LAN_PC to WAN_PC with MAC address 00:0b:db:da:34:0c:

/# ebtables -t filter -A FORWARD -d 00:0b:db:da:34:0c -i eth0 -o eth1 -j DROP

With this configuration, i tried PING from LAN_PC (192.168.10.100) to WAN_PC (192.168.10.200) and the PING is successful; the configured ebtables rule could not DROP ICMP echo requests from LAN to WAN PC.
But at the same time, this rule able to DROP UDP traffic from LAN_PC to WAN_PC.

What I observed in PING case is the LAN PC  is able to resolve IP of WAN through ARP and then the "ICMP echo request" from LAN to WAN doesn't enter ebtables match API ebt_do_table() in net/bridge/netfilter/ebtables.c

Could any one help in understanding why the PING traffic is not DROPped as configured and doesn't enter ebt_do_table() in net/bridge/netfilter/ebtables.c ???

Thanks in advance.

Regards,
Veerasena.


      
