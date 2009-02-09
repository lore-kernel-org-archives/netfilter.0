From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Cannot get Netfilter to forward to port 80
Date: Mon, 09 Feb 2009 22:58:57 +0100
Message-ID: <4990A721.80208@plouf.fr.eu.org>
References: <3803f73b0902091315g2425fa11s7174c4f3ca9d4a39@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3803f73b0902091315g2425fa11s7174c4f3ca9d4a39@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

Hello,

David Gowdy a =E9crit :
> I'm using a Linux system running Netfilter a the primary gateway for
> my Internet service.  This includes the use of port forwarding (DNAT)
> for accessing some servers.  Right now the servers include FTP (port
> 21) and HTTP/HTTPS (port 80/443).  It all seems to work nicely with
> one notable exception.  I cannot forward anything to port 80.  I've
> tried using several different external ports (i.e., 21, 60, 81) but
> nothing works.=20

(I reordered the rule listing in the order chains are traversed by a=20
forwarded packet)

> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> DNAT       tcp  --  anywhere
> pool-71-163-168-209.washdc.fios.verizon.nettcp dpt:81 to:10.0.0.12:80

So port 81 is DNATed to port 80.

> Chain FORWARD (policy DROP)
> target     prot opt source               destination
[...]
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:8=
1
> state NEW,RELATED,ESTABLISHED

The FORWARD chains are traversed after the PREROUTING chains, so the=20
port has already been translated and the rule should match the final=20
destination port 80, not the original port 81.

Also, for better security the rule should only match the destination=20
address 10.0.0.12, not any address.

=46inally, the RELATED state is superfluous : an HTTP packet would neve=
r=20
be in that state.

> ACCEPT     all  --  anywhere             anywhere           state
> RELATED,ESTABLISHED

Note : this rule should be at the beginning of the chain instead of the=
=20
end because it matches most of the traffic.
