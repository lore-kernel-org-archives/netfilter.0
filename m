From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Blocking HTTP source port from an IP
Date: Wed, 24 May 2006 18:35:57 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49C6D@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Marcelus Trojahn <trojahn@alternativa.com.br>, Feris Thia <feris.tia@gmail.com>
Cc: netfilter@lists.netfilter.org

The difference is in the source and destination ports.

A http request has destination port 80. The source port is picked from a
random range, but always above 1024. The reply would then be with source
port of 80 and the destination port that was randomly chosen.

This rule:
Iptables -A INPUT -s 192.168.0.30 -p tcp --sport http -j REJECT

Will actually block http reply packets coming from 192.168.0.30

For more info, go read the documentation, take an IP course and educate
yourself.

-Sietse

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Marcelus
Trojahn
Sent: Wednesday, May 24, 2006 6:31 PM
To: Feris Thia
Cc: netfilter@lists.netfilter.org
Subject: Re: Blocking HTTP source port from an IP

Hello,

  It's the opposite... The request goes to the tcp port 80 of your
server, not
  the other way around...

  iptables -A INPUT -s 192.168.0.30 -p tcp --dport http -j REJECT

  means

  Reject tcp packets coming from 192.168.0.30 destined to port 80 of
this box.

--=20
Marcelus Trojahn

Wednesday, May 24, 2006, 1:18:25 PM, voce escreveu:

> Hi All,

> I'm quite new to iptables and actually.. how it works. I set up
> firewall on a server with IP 192.168.0.40/24 (with an Apache web
> server running) and then I have a windows client with IP
> 192.168.0.30/24 and then I try to block HTTP port request from this
> client using this command :

> iptables -A INPUT -s 192.168.0.30 -p tcp --sport http -j REJECT

> but it fails.... then I try this one :

> iptables -A INPUT -s 192.168.0.30 -p tcp --dport http -j REJECT

> why is it so ?? As my logic say the request come from http port, so I
> specify the -p tcp --sport http, but it doesn't work at all :(






