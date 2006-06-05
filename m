From: "Alberto Ferrer" <albertoferrer@gmail.com>
Subject: Re: How stop DoS and SYN attack..
Date: Mon, 5 Jun 2006 11:10:53 -0300
Message-ID: <e32f231c0606050710xee283dei3b82dcbbbf76ad@mail.gmail.com>
References: <e32f231c0606031333s7ab57702y9a75cc62a3f96da0@mail.gmail.com>
	<4482052D.8090409@vip.cybercity.dk>
	<e32f231c0606042021t2a80a4det5ed2beeed11e19c5@mail.gmail.com>
	<44841859.2060209@vip.cybercity.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44841859.2060209@vip.cybercity.dk>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: mogensv@vip.cybercity.dk
Cc: netfilter@lists.netfilter.org

Solved at moment, some bad boy its doing a syn flood to my webserver
with 38.000 ips, i want die :) , for now, iptables and mod_evasive its
winning.

2006/6/5, Mogens Valentin <mogensv@vip.cybercity.dk>:
> Alberto Ferrer wrote:
> > i got a lot of:
> >
> > Jun  5 00:19:29 lnx1 kernel: [4322108.323000] fp=3Dbad_packets:1 a=3DDR=
OP
> > IN=3Deth0 OUT=3D MAC=3D00:08:54:2f:8a:ac:00:0b:46:e2:04:00:08:00
> > SRC=3D201.231.52.141 DST=3D200.68.95.25 LEN=3D40 TOS=3D0x00 PREC=3D0x00=
 TTL=3D248
> > ID=3D0 PROTO=3DTCP SPT=3D53176 DPT=3D80 WINDOW=3D0 RES=3D0x00 RST URGP=
=3D0
> >
> > Jun  5 00:19:34 lnx1 kernel: [4322112.926000] fp=3DINPUT:99 a=3DDROP
> > IN=3Deth0 OUT=3D MAC=3D00:08:54:2f:8a:ac:00:0b:46:e2:04:00:08:00
> > SRC=3D200.68.126.88 DST=3D200.68.95.27 LEN=3D48 TOS=3D0x00 PREC=3D0x00 =
TTL=3D119
> > ID=3D44694 DF PROTO=3DTCP SPT=3D1196 DPT=3D445 WINDOW=3D8760 RES=3D0x00=
 SYN URGP=3D0
> >
> > Jun  5 00:19:35 lnx1 kernel: [4322113.710000] fp=3DINPUT:99 a=3DDROP
> > IN=3Deth0 OUT=3D MAC=3D00:08:54:2f:8a:ac:00:0b:46:e2:04:00:08:00
> > SRC=3D200.68.126.88 DST=3D200.68.95.28 LEN=3D48 TOS=3D0x00 PREC=3D0x00 =
TTL=3D119
> > ID=3D44762 DF PROTO=3DTCP SPT=3D1134 DPT=3D445 WINDOW=3D8760 RES=3D0x00=
 SYN URGP=3D0
> >
> > Jun  5 00:19:36 lnx1 kernel: [4322114.558000] fp=3DINPUT:99 a=3DDROP
> > IN=3Deth0 OUT=3D MAC=3D00:08:54:2f:8a:ac:00:0b:46:e2:04:00:08:00
> > SRC=3D200.68.126.88 DST=3D200.68.95.27 LEN=3D48 TOS=3D0x00 PREC=3D0x00 =
TTL=3D119
> > ID=3D44873 DF PROTO=3DTCP SPT=3D1196 DPT=3D445 WINDOW=3D8760 RES=3D0x00=
 SYN URGP=3D0
> >
> > Jun  5 00:19:39 lnx1 kernel: [4322117.587000] fp=3Dbad_packets:1 a=3DDR=
OP
> > IN=3Deth0 OUT=3D MAC=3D00:08:54:2f:8a:ac:00:0b:46:e2:04:00:08:00
> > SRC=3D201.254.155.13 DST=3D200.68.95.25 LEN=3D40 TOS=3D0x00 PREC=3D0x00=
 TTL=3D244
> > ID=3D0 PROTO=3DTCP SPT=3D28837 DPT=3D80 WINDOW=3D0 RES=3D0x00 RST URGP=
=3D0
> >
> > My website its working a bit slow now ^^ and my ISP says: "you can
> > block that by your self" .
>
> And rightfully so; this is your own problem. No pun intended :)
>
> Looking at your presended dumps, you see DPT=3D445:
>    grep 445 /etc/services
>    microsoft-ds    445/tcp
>    microsoft-ds    445/udp
>
> Those are requests to MS directory services, coming in on your internet
> interface (so it looks), and correctly being blocked.
> Your only problem may be the number of those, which you may do something
> about using iptables limit targets.
>
> The DTP=3D80 are requests to either your webserver (do you have one
> running?), or to a assumed running webserver.
> You may wanna have a look at which services are running behind, or at,
> the firewall, whether or not those are secured by themselves.
>
> > =BFWhat distro is most prepared for this?
>
> The one you know the best ;) No, seriously, I don't know. Thay can all
> be used. It's not a that much a matter of which distro, but go through
> the kernel setup, read in /usr/src/linux/Documentation about what you
> can do with in /proc or with sysctl, and read about iptables.
> For a distro, I'd suggest Slackware, partly because I know ot well,
> partly because it doesn't have all those wrapper mechanisms other
> distros have, so it's simple to find out how things works, plus per
> default it's setup quite safe.
> However, no distros I know of, can do anything about your specific kind
> of traffic. It's up to you to define measures against such.
>
> > 2006/6/3, Mogens Valentin <mogensv@vip.cybercity.dk>:
> >
> >> Alberto Ferrer wrote:
> >> > =BFany know a way to stop via Linux with iptables or related a SYN
> >> attack ?
> >> > =BFwhere i can read something related to this?
> >>
> >>    # Enable syn-cookies (prevent syn-flood attacks):
> >>      echo "1" >/proc/sys/net/ipv4/tcp_syncookies
> >>
> >>    # Reduce number of possible SYN Floods:
> >>      echo "1024" >/proc/sys/net/ipv4/tcp_max_syn_backlog
> >>
> >> Helps somewhat. Can also be set via sysctl.
> >> You may wan't to look into iptables docs for the 'limit' module:
> >>
> >>    -m limit --limit X/sec
>
> Again, take a look a the limits target in iptables.
>
> --
> Kind regards,
> Mogens Valentin
>
>


--=20
bet0x

