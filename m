From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Packet disappears after DNAT?
Date: Sat, 19 Dec 2015 17:34:56 +0100
Message-ID: <56758730.4020901@plouf.fr.eu.org>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>	<5662BD03.60004@plouf.fr.eu.org>	<CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com>	<56653CCC.6020603@plouf.fr.eu.org>	<CAKmUPx7UQD0zE4ngHanfid4BN8aMFLdJ284peiW0_d8=EFW_JQ@mail.gmail.com>	<20151215130638.GA6295@salvia> <CAKmUPx4xc3nAzXsgCH+EPxC218V5FUhvR4nCCcDCEVRqbMUPwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx4xc3nAzXsgCH+EPxC218V5FUhvR4nCCcDCEVRqbMUPwQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Bronson <bronson@rinspin.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter <netfilter@vger.kernel.org>

Scott Bronson a =E9crit :
> On Tue, Dec 15, 2015 at 5:06 AM, Pablo Neira Ayuso <pablo@netfilter.o=
rg> wrote:
>>
>> JFYI: The br-nf thing was moved to a separated module since 3.18. So
>> now this finally requires explicit modprobing.
>=20
> Thanks Pablo.  Is this the right logic to use for all kernels?
>=20
> - if /proc/sys/net/bridge/bridge-nf-call-iptables doesn't exist
>   - modprobe br_netfilter
> - echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables

Why load br_netfilter if it is not needed ?

I would do the following :

modprobe bridge
if /proc/sys/net/bridge/bridge-nf-call-iptables exists
  echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables
