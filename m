From: Bart De Schuymer <bart.de.schuymer@pandora.be>
Subject: Re: I can't vpn ! - ebtables can forward GRE?
Date: Thu, 30 May 2002 05:21:50 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <aeambk$rn9$2@main.gmane.org>
References: <200205291810.53634.jorge@kernel-panik.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200205291810.53634.jorge@kernel-panik.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Jorge# ./S" <jorge@kernel-panik.org>, bridge@math.leidenuniv.nl
Cc: Antony@Soft-Solutions.co.uk, netfilter@lists.samba.org

On Thursday 30 May 2002 00:10, Jorge# ./S wrote:
> Any ebtables expert can help us solve this:
>
> Can GRE packets be forwarded on a linux box using ebtables?
>
> ----------  Forwarded Message  ----------
>
> Subject: Re: I can't vpn ! - ebtables can forward GRE?
> Date: Thu, 30 May 2002 00:09:11 +0100
> From: Antony Stone <Antony@Soft-Solutions.co.uk>
> To: netfilter@lists.samba.org
>
> On Wednesday 29 May 2002 11:00 pm, Jorge Sarmiento wrote:
> > With ebtables you can block protocols that are not TCP, and let pass =
TCP,
> > ICMP and UDP to your network... you can also redirect TCP packets to =
do
> > an "invisible transparent proxy", mixing bridging and ebtables... the=
n
> > why couldn't GRE packets be forwarded??

If you know the protocol number of these GRE packets you can filter on th=
e=20
protocol number. ebtables -p IPv4 --ip-protocol 47. There is only support=
 for=20
ip header filtering. E.g. no TCP port filtering, certainly no GRE specifi=
c=20
filtering. These things belong in iptables.
With ebtables you can only change the MAC source and destination address.=
 A=20
redirect in ebtables only means the MAC destination of the frame is chang=
ed=20
to that of the bridge, causing the frame to be routed or delivered to the=
=20
bridge itself. You can also make a brouter with ebtables. IP redirects=20
obviously belong in iptables.
I'm not subscribed to the netfilter users list. For ebtables questions th=
ere=20
is a mailing list too. See the ebtables hp.

cheers,
Bart


