From: =?iso-8859-1?B?SOVrYW4gRW5nYmxvbQ==?= <cynic_0@hotmail.com>
Subject: Re: source-mac filtering
Date: Sun, 11 Jan 2004 18:39:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea1-F167vrztUmdyB400051e33@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Yes, I've come to realize that.

Is it technically necessary for the dhcp-server to do so, or could it be=20
that some other dhcpd behaves different ?

A work with test normally, so I don't know very much about the internal=20
structure in Linux.

br H=E5kan E.


>From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
>To: H=E5kan Engblom <cynic_0@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: source-mac filtering
>Date: Sun, 11 Jan 2004 11:37:56 -0500
>
>dhcpd takes and puts packets by netlink sockets which bypass the whole
>IP stack. So in short, you cannot filter the requests nor the response.
>
>Ramin
>
>On Sun, Jan 11, 2004 at 12:20:06AM +0100, H=E5kan Engblom wrote:
>
> > Hi,
> >
> > I've run in to a strange problem. I have a dhcp-server on a 2.4.22=20
>kernel
> > with a 1.2.8 iptables. The dhcp-server is configured only to offer
> > IP-addresses to one single mac-address (it is a single host on a private
> > network)
> >
> > However I'd like to block all other mac-addresses on this interface=20
>since I
> > plan to have a W-LAN here as well. (to prevent attackers from using
> > potential exploits in the dhcp-server)
> >
> > The mac-filter works fine for http, telnet, ssh aso, I can see the
> > drop-counter increasing and no traffic is let through (when I change the
> > mac-address in the iptables-config to something else than what I have o=
n=20
>my
> > "dhcp-client-host"). BUT the dhcp-server keeps sending offers and ack's
> > evethough the incoming discover/request is blocked by iptables.
> >
> > What makes this even more strange is that the "DROP-counters" when using
> > "iptables -L -v" increases, and at the same time the dhcp server=20
>responds
> > to the requests.
> >
> > I'm using Internet Software Consortium DHCP Server V3.0.1rc11
> >
> > The machine has only one physical interface whith two IP's one private =

>and
> > one for public. The IP-address offered by the dhcp-server is private (as
> > seen below)
> >
> > Does anyone have a clue ?
> >
> > br H=E5kan Engblom
> >
> > Some "logs" :
> >
> > 00:30:88:00:63:10 is my DSL-connection (having to accepted packets=20
>during
> > this test)
> >
> > X.X.X.X is my public IP.
> >
> > (This is not the complete iptables, but it is teh interesting part for =

>this
> > matter)
> >
> > 00:08:29.540872      0.0.0.0 -> 255.255.255.255 DHCP DHCP Discover -
> > Transaction ID 0xae749e48
> > 00:08:29.541303 X.X.X.X -> 10.0.0.217   DHCP DHCP Offer    - Transactio=
n=20
>ID
> > 0xae749e48
> > 00:08:29.542117      0.0.0.0 -> 255.255.255.255 DHCP DHCP Request  -
> > Transaction ID 0xae749e48
> > 00:08:29.542299 X.X.X.X -> 10.0.0.217   DHCP DHCP ACK      - Transactio=
n=20
>ID
> > 0xae749e48
> >
> >
> >
> > # date
> > Sun Jan 11 00:08:08 CET 2004
> > # iptables -L -v
> > Chain INPUT (policy DROP 0 packets, 0 bytes)
> > pkts bytes target     prot opt in     out     source
> > destination
> >    0     0 mactable   all  --  eth0   any     anywhere            =20
>anywhere
> >    0     0 ACCEPT     all  --  lo     any     anywhere            =20
>anywhere
> >    0     0 DROP      !icmp --  any    any     anywhere            =20
>anywhere
> >           state INVALID
> >    0     0 eth0_in    all  --  eth0   any    !10.0.0.0/24         =20
>anywhere
> >    0     0 eth0_1_in  all  --  eth0   any     anywhere            =20
>anywhere
> >    0     0 common     all  --  any    any     anywhere            =20
>anywhere
> >
> > Chain mactable (2 references)
> > pkts bytes target     prot opt in     out     source
> > destination
> >    0     0 ACCEPT     all  --  any    any     anywhere            =20
>anywhere
> >           MAC 01:01:01:01:01:01
> >    0     0 RETURN     all  --  any    any     anywhere            =20
>anywhere
> >           MAC 00:30:88:00:63:10
> >    0     0 RETURN     all  --  any    any     anywhere            =20
>anywhere
> >           MAC 00:90:D0:AF:A3:F1
> >    0     0 LOG        all  --  any    any     anywhere            =20
>anywhere
> >           LOG level info prefix `Shorewall:mac:DROP:'
> >    0     0 DROP       all  --  any    any     anywhere            =20
>anywhere
> >
> > # date
> > Sun Jan 11 00:08:36 CET 2004
> > # iptables -L -v
> > Chain INPUT (policy DROP 0 packets, 0 bytes)
> > pkts bytes target     prot opt in     out     source
> > destination
> >    4   948 mactable   all  --  eth0   any     anywhere            =20
>anywhere
> >    0     0 ACCEPT     all  --  lo     any     anywhere            =20
>anywhere
> >    0     0 DROP      !icmp --  any    any     anywhere            =20
>anywhere
> >           state INVALID
> >    2   288 eth0_in    all  --  eth0   any    !10.0.0.0/24         =20
>anywhere
> >    0     0 eth0_1_in  all  --  eth0   any     anywhere            =20
>anywhere
> >    0     0 common     all  --  any    any     anywhere            =20
>anywhere
> >
> > Chain mactable (2 references)
> > pkts bytes target     prot opt in     out     source
> > destination
> >    0     0 ACCEPT     all  --  any    any     anywhere            =20
>anywhere
> >           MAC 01:01:01:01:01:01
> >    2   288 RETURN     all  --  any    any     anywhere            =20
>anywhere
> >           MAC 00:30:88:00:63:10
> >    0     0 RETURN     all  --  any    any     anywhere            =20
>anywhere
> >           MAC 00:90:D0:AF:A3:F1
> >    2   660 LOG        all  --  any    any     anywhere            =20
>anywhere
> >           LOG level info prefix `Shorewall:mac:DROP:'
> >    2   660 DROP       all  --  any    any     anywhere            =20
>anywhere
> > #
> >
> > _________________________________________________________________
> > L=E4ttare att hitta dr=F6mresan med MSN Resor http://www.msn.se/resor/
> >

_________________________________________________________________
L=E4ttare att hitta dr=F6mresan med MSN Resor http://www.msn.se/resor/


