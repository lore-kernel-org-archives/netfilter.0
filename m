From: gapsf@yandex.ru
Subject: Re: Routing the DNS Traffic via specific interface.
Date: Wed, 25 Jan 2012 16:33:50 +0700
Message-ID: <607824512.20120125163350@yandex.ru>
References: <EB822645982FC24F99C33D9513902AFAA877C9@inba-mail02.sonusnet.com>
Reply-To: gapsf@yandex.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1327484014; bh=DqARI0ycdhzmbIrWIr+ts3H4GciV46DQj+finMzykjM=;
	h=Date:From:Reply-To:Message-ID:To:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=H9Yj7OqgrERfvTA2CP6PNxLiE6ad6nGZPpWaEPAgGR9LskbEMvcpi6M6RSqu51QEv
	 GK+ozGHYDG9nORUNcgivQb1AK2k2PYiyOyD5UyBYEaoq3imWglrj1RL4+H2ZTGMS+y
	 H8K1w1xW5cE0gdU+5DysM0CXH4/GAvDj6ZWzvWak=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1327484013; bh=DqARI0ycdhzmbIrWIr+ts3H4GciV46DQj+finMzykjM=;
	h=Date:From:Reply-To:Message-ID:To:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=pRLou4qmdjZREL8xPQ1dRRyQUqX3UHPg2nZg7NAcJI9MTE6sCcW7J8eQfTO/PSuDZ
	 b7OrMJkOvmMIdtyTglOxcqoaYyiwTkiLDgt9Y3Y+VjSnw1LMJVSPPfCs85lvTlCE5v
	 BHvOjTwjSYGlE7Ui/gtV1pjKEPIp6AYzcBe1rk+4=
In-Reply-To: <EB822645982FC24F99C33D9513902AFAA877C9@inba-mail02.sonusnet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, gnetravali@sonusnet.com

No. You should use "Policy routing" with MARK target in iptables.

Mark outgoing DNS packets with iptables in mangle PREOROUTING for example.
# iptables -t mangle -A PREROUTING -p udp --dport 53 -j MARK --set-mark 0x4

Create additional routing table with different routing rules.
Add new entry in /etc/iproute2/rt_tables
=========================================
#
# reserved values
#
255     local
254     main
253     default
0       unspec
#
# local
#
#1     inr.ruhep
1      isp2 # <- new entry
=========================================

Then execute
# ip route flush table isp2
and add defalt route into newly created table
# route add default via <ip_of_your_eth2_gateway> dev eth2 table isp2

Add new policy in RPDB.
# ip rule add from all fwmark 0x4 table isp2

Check RPDB
# ip rule show
You should view somthing like this:
0:      from all lookup local
32763:  from all fwmark 0x4 lookup isp2
32766:  from all lookup main
32767:  from all lookup default

In result: all traffic routed with main routing table, except marked DNS traffic routed
via "isp2" routing table via its default route and iface.
View picture http://postimage.org/image/nn9owf5x7/ for example.

NG> Hi ..

NG> I have 2 interfaces eth0 and eth1 on the system connected to different subnets. I need to route all the outgoing DNS traffic of the system via eth1 interface. Pls let me know if below IPTABLES rules is proper way ?

NG> Block the output DNS traffic on eth0 interface.

NG> iptables -A FORWARD -p udp -o eth0 --dport 53 -j DROP

NG> Forward output DNS traffic from eth1 interface

NG> iptables -A FORWARD -p udp -o eth1 --dport 53 -j ACCEPT


NG> Thanks
NG> Ganesh


NG> --
NG> To unsubscribe from this list: send the line "unsubscribe netfilter" in
NG> the body of a message to majordomo@vger.kernel.org
NG> More majordomo info at  http://vger.kernel.org/majordomo-info.html

