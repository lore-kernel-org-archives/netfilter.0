From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Packet disappears after DNAT?
Date: Tue, 15 Dec 2015 20:49:29 +0100
Message-ID: <56706EC9.2040300@plouf.fr.eu.org>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com> <5662BD03.60004@plouf.fr.eu.org> <CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com> <56653CCC.6020603@plouf.fr.eu.org> <CAKmUPx7UQD0zE4ngHanfid4BN8aMFLdJ284peiW0_d8=EFW_JQ@mail.gmail.com> <20151215130638.GA6295@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20151215130638.GA6295@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Scott Bronson <bronson@rinspin.com>, netfilter <netfilter@vger.kernel.org>

Pablo Neira Ayuso a =E9crit :
> On Tue, Dec 15, 2015 at 04:21:30AM -0800, Scott Bronson wrote:
>>
>> Gotta say, unning `echo 0 > /proc/sys/net/bridge/bridge-nf-call-ipta=
bles` in my
>> script makes me a little queasy...  but this page suggests that no o=
ther option
>> will work cross-distro:
>>
>>      http://wiki.libvirt.org/page/Net.bridge-nf-call_and_sysctl.conf
>=20
> JFYI: The br-nf thing was moved to a separated module since 3.18. So
> now this finally requires explicit modprobing.

I didn't know about this change, thanks. Being rather conservative, my
most recent kernel is still older than 3.18.

=46or the record, the new module name is br_netfilter.
