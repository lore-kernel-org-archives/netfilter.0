From: BERTRAND =?iso-8859-1?Q?Jo=EBl?= <mt@systella.fr>
Subject: Re: Linux 2.6.14-rc3 and masquerading
Date: Mon, 10 Oct 2005 13:13:55 +0200
Message-ID: <20051010111355.GB32524@rayleigh.systella.fr>
References: <20051010090213.GB30565@rayleigh.systella.fr>
	<200510100604.26274.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200510100604.26274.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Mon, Oct 10, 2005 at 06:04:25AM -0500, /dev/rob0 wrote:
> On Monday 2005-October-10 04:02, BERTRAND Jo=EBl wrote:
> > but it is blocked by the U60 ! I don't understand. I use NAT for a
> > long time without any trouble. Any idea ? I have tried 2.6.11.6,
>=20
> echo 1 > /proc/sys/net/ipv4/ip_forward
> ?

	I have verified before I have sent my message.

zebigbos:[~] > cat /proc/sys/net/ipv4/ip_forward=20
1

	My U1 (UltraSPARC I/170 MHz) works fine as NAT gateway with a patched 2.=
6.10
	linux kernel (to obtain ROUTE support). I don't understand why my U60-SM=
P (2
	UltraSPARC II) doesn't work. It worked with a 2.4 linux kernel.

	Regards,

	JKB

