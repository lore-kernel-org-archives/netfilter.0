From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: redirection trouble
Date: Tue, 4 Nov 2003 17:17:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311041717.07321.Alistair@nerdnet.ca>
References: <004a01c3a282$a1430cc0$de0018ac@admin.monash.edu.my> <oprx3kv6lddpszyy@192.168.2.1>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <oprx3kv6lddpszyy@192.168.2.1>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?q?Mart=C3=ADn?= <martin@familia-fiumara.com.ar>, eturner@monash.edu.my
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On November 4, 2003 12:15 am, Mart=C3=ADn wrote:
> Ok, I think I got it... but does not work. I see the traffic being
> redirected, but the conection gets lost, I got this in the snuiffer:
>
> 02:02:51.640513 192.168.2.1 > 192.168.2.5: icmp: 192.168.2.1 udp port 100=
00
> unrachable [tos 0x40]
>
> Any Idea?


	Ummm what exists between the linux NAT box and the internet itself?

	Do you have another router in there?=20
	what is meant by: ( eth0 192.168.1.10 > adsl ppp0 IP dinamic)
	Typically adsl direct connected routers to ppp daemons should=20
	NOT have an ip on the ethernet interface unless you need to manage
	the router.  However I digress.
=09
	Can you see the packet (after DNATting) on the way out ppp0?
=09
	What if any other rules have you in the FORWARD chain.
=09
	*thunks head on table* You will need to FORWARD the packets through the=20
	box as well as DNATting the packets.
=09
	iptables -I FORWARD -p udp -s 192.168.2.5 -d 200.24.24.200 --dport 10000 -=
j=20
ACCEPT
=09
	And again, depeinding on the presence of ESTABLISHED RELATED rules you may=
=20
need to return them through the FORWARD chain

	Sometimes assumption of anything will get us in trouble.=20


>
>
>
>
> En Tue, 4 Nov 2003 11:20:42 +0800, Edmund Turner <eturner@monash.edu.my>
>
> escribi=C3=B3:
> > Martin, Alistairs explanation and solution is correct.
> > In short 192.168.2.5 will only see traffic thru and fro 192.168.2.1
> > @port 10000. Put a packet analyser or a sniffer on 192.168.2.5 to
> > confirm.
> > In Iptables if you do a prerouting as such :
> >
> > #This will redirect all packets to 192.168.2.1 dport 10000 to
> > 200.24.24.200:10000
> >
> > iptables -t nat -I PREROUTING -i eth1 -d 192.168.2.1 -p udp --dport
> >
> >> 10000 -j DNAT --to 200.45.45.200:10000
> >
> > You don=E2=80=99t have to worry about the packets coming in back from
> > 200.24.24.200. They will be tracked and sent back to 192.168.2.5 as
> > source IP of 192.168.2.1. Im not sure which module is responsible for
> > this, but I think its done by the ip_conntrack module. Maybe someone can
> > enlighten us on this?
> >
> >
> > Regards
> > edmund
> >
> >> -----Original Message-----
> >
> > From: netfilter-admin@lists.netfilter.org
> > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Mart=C3=ADn
> > Sent: Tuesday, November 04, 2003 10:37 AM
> > To: alistair@nerdnet.ca
> > Cc: netfilter@lists.netfilter.org
> > Subject: Re: redirection trouble
> >
> > En Mon, 3 Nov 2003 21:21:09 -0500, Alistair Tonner <Alistair@nerdnet.ca>
> >
> > escribi=C3=B3:
> >> On November 3, 2003 08:53 pm, Mart=C3=ADn wrote:
> >>> This is the situation:
> >>>
> >>>
> >>>
> >>> Internal LAN machine (192.168.2.5)
> >>>
> >>>
> >>>
> >>> (eth1 192.168.2.1) NAT LINUX ( eth0 192.168.1.10 > adsl ppp0 IP
> >
> > dinamic)
> >
> >>> Server 200.45.45.200 (service at port 10000)
> >>>
> >>>
> >>>
> >>> This is what I intend to do:
> >>> For particular reasons, I need that a soft at 192.168.2.5 comunicate
> >>> with a
> >>> server with a service at port 10000 (UDP), but this can=C2=B4t be done
> >>> through
> >>> normal NAT. So i want to establish a link between both (server and
> >>> 192.168.2.5) manually useing the NAT LINUX
> >>> So, 192.168.2.5 comunicates to 192.168.2.1 port 10000, the NAT LINUX
> >>> redirect this traffic to the server 200.45.45.200 port 10000. The
> >
> > server
> >
> >>> will respond to the NAT LINUX who will redirect this traffic to
> >>> 192.168.2.5
> >>> (port 10000 also)
> >>> I try to do all this in this way:
> >>>
> >>>
> >>> iptables -t nat -I PREROUTING 1 -i eth1 -d 192.168.2.1 -p udp --dport
> >>>
> >>> 10000
> >>> -j DNAT --to 200.45.45.200
> >>>
> >>> iptables -t nat -I POSTROUTING 1 -o eth0 -p udp --dport 10000 -j SNAT

=2D-=20

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
=09
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

