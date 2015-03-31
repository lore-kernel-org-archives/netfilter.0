From: Matt Killock <lists@killock.net>
Subject: Routing traffic over two gateways by fwmark
Date: Tue, 31 Mar 2015 23:52:06 +0100
Message-ID: <b2ca7b1036797bf4b84622f88540585d@killock.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=killock.net; s=mail;
	t=1427842326; bh=5tJDBO0R266eMjHJso3nXk3sDCGsNVjmZBnN5ZHR9lY=;
	h=To:Subject:Date:From:From;
	b=lnHoGAH10d3ryoYMPJHEJ7Kpq/6Y55ZkWoKO5xY+QKPoxIt0b1zbZ1XS/OSdFLjRH
	 wyNg3xGbMBTyu8FUpR/nwRrd4x4OEfWJ2cfgmduczylK18eug+BVrJ00mFUMVpu2U1
	 +zXwWnTeeipnFm0lr46e8PjS4Ic7N+iN9QlCO9vU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I am having trouble re-using scripts that worked in kernel 2.6.24 with a 
more recent 3.16.0 series kernel. The essence of what I am trying to do 
is this:

iptables mark all packets arriving from anywhere on interface 1 with 
'10'
iptables mark all packets arriving from anywhere on interface 2 with 
'20'

iptables DNAT incoming traffic on interface 1 on port 1111 to internal 
server via interface 3
iptables DNAT incoming traffic on interface 2 on port 1111 to internal 
server via interface 3

ip rule from all fwmark 10 table T1
ip rule from all fwmark 20 table T2

default gateway in table T1 is through interface 1
default gateway in table T2 is through interface 2

With the view to make everything that arrives on a particular interface 
leave via that interface. The above approach worked fine in kernel 2.6 
but does not seem to work any more. With no default gateway in the main 
routing table, the packets arrive on the external interfaces but do not 
appear on the LAN interface, almost as if DNAT is having no effect at 
all. One of the two DNAT rules works if I add a default gateway to the 
main routing table, but then it appears that the policy routing tables 
or firewall marks are ignored.

Should the above approach be possible still? If not, then could someone 
advise what approach I should use nowadays please?

Matt
