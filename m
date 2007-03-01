From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Re: Blocking direct private IP address
Date: Wed, 28 Feb 2007 20:49:58 -0800
Message-ID: <BAY119-F39A4E5F3A07FF3275AC4E0D6800@phx.gbl>
References: <Pine.LNX.4.61.0703010449120.23355@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0703010449120.23355@yvahk01.tjqt.qr>
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: jengelh@linux01.gwdg.de
Cc: netfilter@lists.netfilter.org

>From: Jan Engelhardt <jengelh@linux01.gwdg.de>
>To: Andrew Kraslavsky <andykras@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: Blocking direct private IP address
>Date: Thu, 1 Mar 2007 04:52:48 +0100 (MET)
>
>
>On Feb 28 2007 19:12, Andrew Kraslavsky wrote:
>
>[recap
> > external 10.0.0.1/24
> > internal 192.168.0.1/24
>]
>
> >
> > Thanks for the pointer but the question here is about the destination IP
> > address, not the source.
> >
> > When I create the DNAT rule, the private IP address to which I want my
> > public address to map suddenly becomes directly accessible to hosts on
> > the public network.
>
>Then don't add a DNAT rule.
>
> > I.e. I want hosts on the public network to _have_to_ send traffic to
> > the public IP of 10.0.0.1 but, after adding that rule, they can
> > actually send traffic to that address _AND_ also directly to the
> > private IP address of the Web server at 192.168.0.99.
>
>Your DNAT rule is broken:
>
> >iptables -t nat -A PREROUTING -d 10.0.0.1 -j DNAT --to-destination
> >192.168.0.99
>
>You are forwarding _ALL_ traffic, _ALL_ ports. (And you can never reach
>the real 10.0.0.1 from the outside using 10.0.0.1.)
>
>
>Jan
>--

I appreciate your advice (so keep it comin'!).

I was trying to keep the problem description as simple as possible but I=20
guess that caused some confusion of its own (sorry about that).  The actual=
=20
rule I use is specific to TCP port 80; it is not for all traffic and all=20
ports.  It looks more like this:

iptables -t nat -A PREROUTING -d 10.0.0.1 -p tcp --dport 80 -j DNAT=20
--to-destination 192.168.0.99

The DNAT rule is wokring as I expect it to -- it exposes the private Web=20
server at 192.168.0.99 to the public network as if its address was 10.0.0.1=
.=20
  Meaning, folks surfing to http://10.0.0.1 are actually being serviced by =

the Web server at 192.168.0.0.99.

My focus here is really on how to differentiate traffic that gets DNATted=20
from 10.0.0.1 to 192.168.0.99 from traffic that was actually directly=20
addressed to 192.168.0.99.

In both cases, by the time the packet arrives in the filter table FORWARD=20
chain, the destination is simply 192.168.0.99, there is no trace of the=20
original pre-DNAT IP address, if any....at least, that is where I got stuck=
=20
anyway.

I hope that explains it a bit more clearly.

The approach I am playing with at the moment is to add a rule in the mangle=
=20
table PREROUTING chain that marks any packets that show up from eth0 that=20
are not addressed to 10.0.0.1.  Then, in the filter table FORWARD chain, I =

added rules to test for that mark and log and drop any packets that match.

I know I could simply put the logging and drop rules directly in the mangle=
=20
table PREROUTING chain but, based on various guidelines for iptables I have=
=20
read, I am trying to keep all filtering activities within the filter table.

_________________________________________________________________
Find what you need at prices you=92ll love. Compare products and save at MS=
N=AE=20
Shopping.=20
http://shopping.msn.com/default/shp/?ptnrid=3D37,ptnrdata=3D24102&tcode=3DT=
001MSN20A0701


