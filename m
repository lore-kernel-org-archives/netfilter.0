From: =?iso-8859-1?Q?Gunnar_Fr=F6din?= <gunnar68@gunfro.com>
Subject: Re: Port forwarding.
Date: Mon, 28 Jun 2004 12:18:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c45cf9$51dbfc00$6600a8c0@simba>
References: <001301c45cf0$9f7cf710$6600a8c0@simba> <200406281057.52955.Antony@Soft-Solutions.co.uk>
Reply-To: =?iso-8859-1?Q?Gunnar_Fr=F6din?= <gunnar68@gunfro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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

Ok about the splitt DNS, i'm new at this(Linux) but I think I know, but if
you have the time, some more info would be god, there is a DNS on
192.168.0.100

The real problem is that the port forwarding dose not work at all !!!

//Gunnar



On Monday 28 June 2004 10:16 am, Gunnar Fr=F6din wrote:

> Hi all.
> I'm trying to setup a firewall/port forwarder but can't get things going.
> Some facts:
> LAN is my internal network and WAN is external.
> I have a static ip# on WAN and LAN.
> Access to SSH on firewall works.
> IP Forwarding and NAT from LAN to WAN works :-)
>
> The problem:
> On my LAN i have another machine with web, mail, ftp-server(192.168.0.100)
> witch have to be accessible from the WAN.
> But I just cant get it working.
>
> Question:
> At
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#DNATTARGET
> (Oskar Andreasson) says
> Quote
> "This last rule will seriously harm your logging, so it is really
advisable
> not to use this method, but the whole example is still a valid one for all
> of those who can't afford to set up a specific DMZ or alike. What will
> happen is this, packet comes from the Internet, gets SNAT'ed and DNAT'ed,
> and finally hits the HTTP server (for example). The HTTP server now only
> sees the request as if it was coming from the firewall, and hence logs all
> requests from the internet as if they came from the firewall."
> End quote.
> Is there some way to do this so the logging sees the "right" IP# ???

Sure - just don't do the SNAT rule which makes the packets look like they
came
from the firewall.

The only reason why you would need to add SNAT is to make the server
accessible to people both outside and *inside* your network, by using the
public IP address.

The recommended way to do it (which is far simpler, and results in the
correct
IP addresses going into the log files) is to use split DNS, so people on the
outside see the public IP, and people on the inside see the private IP, then
the routing just works normally.

Regards,

Antony.

--
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the
list;
                                                           please don't CC
me.




