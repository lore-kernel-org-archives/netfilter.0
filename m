From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Mon, 14 Nov 2005 16:03:42 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
References: <4372A919.8020100@rosi-kessel.org>
	<4372A989.5090606@rosi-kessel.org>
	<20051110031834.GB9770@samad.com.au>
	<20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051114145348.GA12841@bostoncoop.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Rosi-Kessel <adam@rosi-kessel.org>
Cc: netfilter@lists.netfilter.org

On Mon, 14 Nov 2005, Adam Rosi-Kessel wrote:

> On Thu, Nov 10, 2005 at 17:44:16 CET, Jozsef Kadlecsik wrote:
>
> > > > Under what conditions would inbound packets not be routing through
> > > > the nat PREROUTING chain?
> > > That's a problem that puzzles me too.
> > Packets which cannot be associated with any existing connection
> > known by the conntrack subsystem will traverse the NAT table.
> > If a packet is related to any connection, which can mean:
> > - the packet belongs to a connection
> > - it is an ICMP error packet about a connection
> > - it is a packet of a channel (like FTP data), which can be
> >   associated to a connection by an appropriate helper module
> > then that packet won't enter the NAT table.
>
> The packets in question:
>
>   - do show up in tcpdump (so they're at least passing by the network card)
>   - do show up if logged in the mangle PREROUTING table (so iptables at
>     least knows about them)

That means they passed conntrack and was not dropped as invalid. Good.

>   - are UDP port 500 packets -- so that rules out the latter two options
>     above, right? They are not ICMP error packets, and they are not
>     packets recognized by a channel like FTP data. I have no conntrack
>     module loaded other than the main one and the FTP one.
>   - do not show up in /proc/net/ip_conntrack. There in fact are no
>     inbound entries at all in /proc/net/ip_conntrack for the IP address of the
>     remote server or for any traffic on port 500 at all.

Double-check it ;-).

> Yet, they do not enter the nat PREROUTING table.
>
> I even added a raw table and a NOTRACK destination to packets travelling
> on port 500 to every chain in the raw table. Still, the packets do not
> show up in nat PREROUTING.

If you add a NOTRACK rule for the packets in the raw table, then conntrack
will skip those packets and in consequence NAT will skip them as well: NAT
is built on top of conntrack.

> Any suggestions for how to figure out why they're not getting to nat
> PREROUTING?  Or are they perhaps being tracked in a way that I am not
> noticing?

Remove the NOTRACK rules from the raw table. Double check the mangle table
for possible matching DROP targets, including the default policies. Do the
same with the nat table as well.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

