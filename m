From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: tcpdump and iptables ..
Date: Sat, 6 Mar 2004 23:44:13 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403062344.13831.Antony@Soft-Solutions.co.uk>
References: <FD1B6DC5FFF43C4888DCC155FE8C1FFE70CC74@7xch10ka.sevenspace.local> <200403061812.31256.Antony@Soft-Solutions.co.uk> <1078598785.3118.10.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078598785.3118.10.camel@anduril.intranet.cartel-securite.net>
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

On Saturday 06 March 2004 6:46 pm, Cedric Blancher wrote:

> Le sam 06/03/2004 =E0 19:12, Antony Stone a =E9crit :
>
> > tcpdump sees ethernet frames,
> > IPX and similar traffic which are not even IP based, as well as
> > completely different media types such as 802.11b headers.=20
>
> Just a notice about 802.11 stuff.
>
> The way tcpdump will see traffic coming from a wireless link depends on
> the wifi interface state. If the interface is in normal operation mode
> (managed, ad-hoc or master), it will see frames as usual ethernet ones,
> just as it was sniffing a wired link. If the interface is in monitor
> mode, then it will see the frames will full 802.11 header.

True - I guess I'm just used to always doing my 802.11 sniffing in monito=
r=20
mode, so I get the maximum information out of the exercise :)

> BTW, I can confirm tcpdump will see outgoing traffic as it is after
> POSTROUTING chain, and incoming one as it is before PREROUTING. I've
> just checked playing with TTL on pings.

Thanks.

Antony.

--=20
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of t=
hese
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


