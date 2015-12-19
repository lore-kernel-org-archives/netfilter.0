From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Packet disappears after DNAT?
Date: Sat, 19 Dec 2015 17:38:31 +0100
Message-ID: <56758807.90402@plouf.fr.eu.org>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>	<5662BD03.60004@plouf.fr.eu.org>	<CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com>	<56653CCC.6020603@plouf.fr.eu.org>	<CAKmUPx7UQD0zE4ngHanfid4BN8aMFLdJ284peiW0_d8=EFW_JQ@mail.gmail.com>	<56706DC5.8010206@plouf.fr.eu.org> <CAKmUPx7ST01XPj+cXSWhyksFJw77xeXf-WouaQkCxZ0QG1_aWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx7ST01XPj+cXSWhyksFJw77xeXf-WouaQkCxZ0QG1_aWQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter <netfilter@vger.kernel.org>

Scott Bronson a =E9crit :
>=20
> Good question.  Editing mistake.  I'm actually forwarding different
> ports to different guests depending on port number:
>=20
> iptables -t nat -A POSTROUTING -s 192.168.122.10/32 -d
> 192.168.122.10/32 -p udp --dport 53 -j MASQUERADE
> iptables -t nat -A POSTROUTING -s 192.168.122.10/32 -d
> 192.168.122.10/32 -p tcp --dport 53 -j MASQUERADE
> iptables -t nat -A POSTROUTING -s 192.168.122.12/32 -d
> 192.168.122.12/32 -p tcp --dport 25 -j MASQUERADE

I don't think you need a separate rule for each forwarded port. One
global rule would do the job, as only forwarded packets would match the
source/destination address.


iptables -t nat -A POSTROUTING -s 192.168.122.10/32 -d 192.168.122.10/3=
2
  -j MASQUERADE
