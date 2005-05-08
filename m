From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Iptables, php , realtime bandwidth usage
Date: Sun, 08 May 2005 12:26:25 +0200
Message-ID: <1115547987.7556.13.camel@nostromo.bgsecm.com>
References: <000e01c5515e$b0b62570$1701a8c0@info2000256>
	<427A3E1C.3070803@riverviewtech.net>
	<f48e768e050505102175ad27b4@mail.gmail.com>
	<001e01c55248$33d22460$1701a8c0@info2000256>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001e01c55248$33d22460$1701a8c0@info2000256>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 06-05-2005 a las 16:30 +0200, Robert Becskei escribi=C3=B3:
>  at the router I would like to see that at that moment how much bandwit=
hd is=20
> being used.
>  for example I would like to see something like this (example) :
>=20
>  computer1  download 10kbyte/s  upload 1.5kbyte/s
>  computer2 download 0kbyte/s upload 0kbyte/s
>  computer3 download 20kbyte/s upload 2kbyte/s
>=20
>  my problem is (I currently use cacti, and bigsister), that I cannot se=
e how=20
> is my bandwidthd currenly used on a per host basis.
>  I can see graphs about that my current download and upload is this and=
 that=20
> (overall), but I would like to see something as shown
>  above in the example, I wonder if there is some tool for that ?

You could use some SNMP agents on the computers to allow you to
monitor the outer interfaces from a script and use it in Cacti.
The linux SNMP agent gives you that data, and the Windows XP also
gives you the data.

You can use rrdtool to know the aggregated traffic or the instant
traffic at the time points you want.

> Sincerely
> Robert Becskei

Regards.
--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


