From: =?windows-1251?Q?=22=DF=F6=EA=EE_=DD=EB=EB=E0=E4_=C3=E5=ED=ED=E0?=
	 =?windows-1251?Q?=E4=FC=E5=E2=E8=F7_=28ngs=29=22?= 
	<eyatsko@ngs.ru>
Subject: How to make bi-directional NAT'ting?
Date: Tue, 23 Aug 2011 12:26:15 +0400
Message-ID: <4E536427.2040503@ngs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello!

I have some specific problem with Cisco CP7961G IP phone.
It sends packets to external Softswitch using one UDP port
which differs from 5060 (voipControlPort in its .XML), but
it waits answers on 5060!
And I can't do anything with it! I have tried Firmware from
8.0.x up to 8.5.x - all the same!

One thing I think is make corresponding translation on IPTables.
SNAT in direct path (from 79161 to Softswitch) and DNAT
in backward direction (from outside Softswitch to 7961).

BUT IT DOESN'T WORK! :-)

$IPTABLES -t nat -A PREROUTING          -p udp -s 80.251.x.x 
                         -d 80.251.y.y --dport 5060 -j DNAT 
--to-destination 172.16.128.200:5060
$IPTABLES -t nat -A POSTROUTING -o eth0 -p udp -s 172.16.128.0/24 
--sport 1024:65535 -d 80.251.x.x --dport 5060 -j SNAT --to-source      
80.251.y.y:5060

What do I do wrong?

Kind regards,
Ellad Yatsko
