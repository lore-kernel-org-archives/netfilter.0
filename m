From: Andreas Kretschmer <andreas_kretschmer@despammed.com>
Subject: Re: [despammed] trafic info
Date: Tue, 27 Jan 2004 17:23:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040127162305.GA4794@kaufbach.delug.de>
References: <1169375166.20040127185956@internetplustravel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1169375166.20040127185956@internetplustravel.ru>
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

am  Tue, dem 27.01.2004, um 18:59:56 +0300 mailte Oleg Savostyanov folgende=
s:
> Hello netfilter,
>=20
> I am using my LinuxBox as a NAT device for my LAN.
> Debian Woody 2.4.23
> I suspect one of my (or not one) computers infected by virus
> And generating outgoing trafic.
> Is there any way without installing packages to view from my linuxbox
> established connects, any info about
> transferred bytes during this connect, etc..?
> Or maybe someone can suggest good program for that.

You can log in the FORWARD-Chain. (All outgoing with SYN). Now you can
see source, destination and service (port on destination).


Andreas
--=20
Diese Message wurde erstellt mit freundlicher Unterst=FCtzung eines freilau-
fenden Pinguins aus artgerechter Freilandhaltung.   Er ist garantiert frei
von Micro$oft'schen Viren. (#97922 http://counter.li.org)     GPG 7F4584DA
Was, Sie wissen nicht, wo Kaufbach ist? Hier: N 51.05082=B0, E 13.56889=B0 =
;-)

