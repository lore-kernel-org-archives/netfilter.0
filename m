From: Unknown <unknown@unknown.invalid>
Subject: Re: kernel-2.6, iptables-1.2.9, pppd-2.4.2
Date: Sun, 28 Dec 2003 09:01:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <43302.7461906478$1072751618@news.gmane.org>
References: <BAY2-F119GDlAiDZX560002d7de@hotmail.com> <1072565261.14009.11.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <1072565261.14009.11.camel@tarkus>
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
To: Ted Kaczmarek <tedkaz@optonline.net>, zhang ping <dqzhangp@hotmail.com>
Cc: netfilter@lists.netfilter.org


	I agree that the info is thin, but that *sounds like* a=20
	probelm with tcp-ecn ....=20
=09
	cat /proc/sys/net/ipv4/tcp_ecn=20
	if its > 0
	then
	echo "0" > /proc/sys/net/ipv4/tcp_ecn

	Alistair Tonner


On December 27, 2003 05:47 pm, Ted Kaczmarek wrote:
> With the limited info provided going to be difficult to even guess.
> Is ip_forward enabled?
>
> Ethereal/tcpdump are your friends.
>
> Ted
>
> On Wed, 2003-12-24 at 19:11, zhang ping wrote:
> > I use linux box to share a ADSL:
> >
> >   ----ADSL----PPPoE------LAN
> >
> > The linux kernel is 2.6.0
> > The iptables is 1.2.9
> > The pppd is 2.4.2
> >
> > pppd eth2 connect to internet, on linux box, everything is ok.
> >
> > iptables -t nat -A POSTROUTING -j MASQUERADE
> >
> > Within the LAN , i can surf some sites, but can't surf the others,
> >
> > What is the matter??????????
> >
> > Pls help me
> >
> > _________________________________________________________________
> > =E4=BA=AB=E7=94=A8=E4=B8=96=E7=95=8C=E4=B8=8A=E6=9C=80=E5=A4=A7=E7=9A=
=84=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E7=B3=BB=E7=BB=9F=E2=80=95 MSN Hotm=
ail=E3=80=82  http://www.hotmail.com

