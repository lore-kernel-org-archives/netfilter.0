From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Port forwarding.
Date: Mon, 28 Jun 2004 10:57:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406281057.52955.Antony@Soft-Solutions.co.uk>
References: <001301c45cf0$9f7cf710$6600a8c0@simba>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c45cf0$9f7cf710$6600a8c0@simba>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Monday 28 June 2004 10:16 am, Gunnar Fr=F6din wrote:

> Hi all.
> I'm trying to setup a firewall/port forwarder but can't get things goin=
g.
> Some facts:
> LAN is my internal network and WAN is external.
> I have a static ip# on WAN and LAN.
> Access to SSH on firewall works.
> IP Forwarding and NAT from LAN to WAN works :-)
>
> The problem:
> On my LAN i have another machine with web, mail, ftp-server(192.168.0.1=
00)
> witch have to be accessible from the WAN.
> But I just cant get it working.
>
> Question:
> At http://iptables-tutorial.frozentux.net/iptables-tutorial.html#DNATTA=
RGET
> (Oskar Andreasson) says
> Quote
> "This last rule will seriously harm your logging, so it is really advis=
able
> not to use this method, but the whole example is still a valid one for =
all
> of those who can't afford to set up a specific DMZ or alike. What will
> happen is this, packet comes from the Internet, gets SNAT'ed and DNAT'e=
d,
> and finally hits the HTTP server (for example). The HTTP server now onl=
y
> sees the request as if it was coming from the firewall, and hence logs =
all
> requests from the internet as if they came from the firewall."
> End quote.
> Is there some way to do this so the logging sees the "right" IP# ???

Sure - just don't do the SNAT rule which makes the packets look like they=
 came=20
from the firewall.

The only reason why you would need to add SNAT is to make the server=20
accessible to people both outside and *inside* your network, by using the=
=20
public IP address.

The recommended way to do it (which is far simpler, and results in the co=
rrect=20
IP addresses going into the log files) is to use split DNS, so people on =
the=20
outside see the public IP, and people on the inside see the private IP, t=
hen=20
the routing just works normally.

Regards,

Antony.

--=20
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


