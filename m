From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Re: iptables help
Date: Thu, 29 Jul 2004 17:41:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905120E@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Ashley M. Kirchner" <ashley@pcraft.com>, netfilter@lists.netfilter.org

>     Heh, I just realized this won't help a whole helluva lot because
> www.yahoo.com's round-robin setup isn't contiguous:
>
>     66.94.230.35
>              .39
>              .41
>              .45
>              .48
>              .49
>              .51
>              .52

$ i=3D35; while [ $i -le 52 ]; do echo -n "$i:"; lynx -dump 66.94.230.$i =
| head -3; let "i =3D $i + 1"; done

gives me nuthin' but "[1]Yahoo!"  so i'd say you're safe in blocking the =
range 66.94.230.35 - 66.94.230.52.

$ i=3D34; while [ $i -ge 1 ]; do echo -n "$i:"; lynx -dump 66.94.230.$i =
| head -3; let "i =3D $i - 1"; done

gives me Yahoo's down to .16 so i'd say you'd be safe blocking =
66.94.230.16 - 66.94.230.52.

"-d 66.94.230.16/28" will block .16 - .31
"-d 66.94.230.32/28" will block .32 - .47
"-d 66.94.230.48/30" will block .48 - .51
"-d 66.94.230.52" will block .52

i'll leave hotmail as an excercise for the user...

someone already mentioned this--but this is *not* the "best" way to do =
this.  a transparent redirect to a squid server with a "dstdomain =
.yahoo.com" will block access to anything.yahoo.com regardless of IP =
address.

-j

