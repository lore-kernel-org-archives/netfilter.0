From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: Port forwarding
Date: Sun, 19 Sep 2004 13:06:21 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a04091903066f329dc0@mail.gmail.com>
References: <1095429469.1886.41.camel@wolfpack.ljm.dom>
	<-4718906956710508172@unknownmsgid>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <-4718906956710508172@unknownmsgid>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?KUCKAERTZ_R=E9gis_-_NVISION?= <regis@nvision.lu>, Netfilter Mailing List <netfilter@lists.netfilter.org>

you can set it in /etc/sysctl.conf


On Fri, 17 Sep 2004 16:09:59 +0200, KUCKAERTZ R=E9gis - NVISION
<regis@nvision.lu> wrote:
> > stupid question:  is IP forwarding enabled (sysctl
> > net.ipv4.ip_forward)?
>=20
> argh, last week there was a maintenance cycle in our datacenter and every
> machine was rebooted. I thought
>=20
> echo "1" > /proc/sys/net/ipv4/ip_forward
>=20
> would be persistant but I was wrong. Also I forgot to check if it was sti=
ll
> there after the reboot. Really sorry, this is time lost!
>=20
> Thank you very much, good job!
>=20
> R=E9gis
>=20
>=20



--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

