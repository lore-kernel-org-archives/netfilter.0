From: Mark Mitchell <mmitchell@riccagroup.com>
Subject: RE: Help on how to limit a NAT port forward to just a range of IP
 addresses
Date: Fri, 24 Jun 2011 15:46:06 -0400
Message-ID: <d07c93be-d98f-4854-8785-9f7d8156d3f9@riccagroup.com>
References: <3afccf8e-e575-4203-962a-0079da9fae75@riccagroup.com>
	<ec9c4a4d-00e6-4ff2-b81d-7b88c1d128c1@riccagroup.com>
	<alpine.LNX.2.01.1106242030440.2226@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1106242030440.2226@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 'Jan Engelhardt' <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Yes good point about privacy,

Based on your answer should the rule work if I moved it to the end afte=
r the other NAT rules? Is this the correct way to do it?



-----Original Message-----
=46rom: Jan Engelhardt [mailto:jengelh@medozas.de]=20
Sent: Friday, June 24, 2011 2:39 PM
To: Mark Mitchell
Cc: netfilter@vger.kernel.org
Subject: Re: Help on how to limit a NAT port forward to just a range of=
 IP addresses

On Friday 2011-06-24 19:45, Mark Mitchell wrote:

>Outside IP : 173.49.xx.xxx=C2=A0 (xx for privacy reasons)

Privacy, what privacy? Your network addresses are contained in=20
both your mail headers and the WHOIS db. (173.49.38.128-143)

>Internal IP : 192.168.1.22
>
>iptables -I FORWARD 10 -i eth1 -d 192.168.1.22 -p tcp --dport 11211 -j=
 ACCEPT
>iptables -A PREROUTING -t nat -p tcp --dport 11211 -d 173.49.xx.xxx -j=
=20
>DNAT --to 192.168.1.22:11211
>iptables -A POSTROUTING -t nat -p tcp -s 192.168.1.22 --dport 11211 -j=
=20
>SNAT --to 173.49.xx.xxx
>iptables -t nat -A POSTROUTING -p tcp -d 192.168.1.22 --dport 11211 -s=
=20
>192.168.1.0/24 -j SNAT --to 192.168.1.1
>
>What I am trying to figure out is how to limit this port forward to=20
>just a couple ranges of IP addresses.
>
>I tried adding the rule after the FORWARD command but it did not chang=
e=20
>anything. I could still hit the port from any IP address.

Because you still have the other three nat rules.

>iptables -A INPUT -p tcp --dport 11211 -d 173.49.xx.xxx -m iprange=20
>--src-range 74.205.xx.x-74.205.xx.x -j ACCEPT=C2=A0

