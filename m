From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: Transparent http filtering VLAN traffic without being a member of 
	tagged VLANs
Date: Wed, 17 Feb 2010 22:16:38 +0200
Message-ID: <c4ada2161002171216v202474a0obd2ca5c1f22511f1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=ZiU17b3rikiXtn8dcGfMA3d7B4kGI6t3gaSRb64MXnU=;
        b=sZZuuW0PI6mjEPhu1Rlvz08v1qfNDGFu94ilqcRb1Edx1wKARkjjh83TtDqE7nVoRP
         MFHupACDKw1CHLgZiSabcn2i7W55R0C8AyY5rCHPSscpDqMqNYG2xpYkg0nFcX1Lasgc
         Bc2OXW0itUajpwoy7xJ67jCtnpNEH0AiJXdj8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On a bridge setup, I want to filter http traffic transparently through
Squid. br0 bridge is between eth0 and eth1.
In the bridged traffic there are some tagged VLANs.

When I run tcpdump on br0 I see all the traffic from VLANs. At this
point a DNAT (VLAN10Subnet - Any - http => Original - LocalIP -
8080) does not work.

iptables -t nat -I PREROUTING -p tcp --dport 80 -j DNAT
--to-destination 10.0.0.1:8080


When enabled VLANs by vconfig:

vconfig add br0 26

I see br0.26 interface in ifconfig output.

And DNAT started to working. When I DNAT the traffic into port 8080 on
localhost to Squid, I see that Squid gets the traffic and logs it into
the log file. However, proxying will not happen. Reply can not be
delivered to the original requester. We broke the connection. On the
user side, HTTP traffic is cut.

I think the problem is not having any IP on br0.26 from VLAN10Subnet.
Because the whole C class is divided into subnets of 255.252 having 2
usable IP address and both are used. Do you have any other idea on
identifiying the problem?

If you think the problem is what I see, how can I overcome this? Is it
possible to nat in another way to include vlan information. Marking
maybe?

Best Regards,
Oguz.
