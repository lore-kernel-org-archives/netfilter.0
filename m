From: Ryo Fujita <rfujita@redhat.com>
Subject: Re: nftables, after adding a rule without any action, nft doesn't return correctly
Date: Fri, 18 Jul 2014 09:49:31 +0900
Message-ID: <84A2702C-15DF-4236-86B9-A4219727179A@redhat.com>
References: <DA2F5FF8-CA37-48D0-BEFC-F1D78A0C8415@redhat.com> <20140716160716.GA7906@salvia> <9D590D9F-92DE-4832-8382-54E3C42BA881@redhat.com> <20140717141428.GA4063@salvia>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140717141428.GA4063@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi,

> Not a good idea to stick to old versions. We're still changing syntax
> in some aspects and resolving bugs at this stage. The user document
> aims to be in sync with latest. You should recommend people to stick
> to latest until 1.0 comes out.

Yes, I know.
Actually I wrote an article based on Fedora rawhide and it=E2=80=99s ch=
asing nftables git tree with several days behind. Considering the devel=
opment pace of nftables, it doesn=E2=80=99t matter for readers to use F=
edora rawhide. Of course, I=E2=80=99m checking the latest tree in order=
 to advise my readers to recognize the possibilities of changing syntax=
 and so on.

Anyway, thank you for kindly advice!

Best Rio.

2014/07/17 23:14=E3=80=81Pablo Neira Ayuso <pablo@netfilter.org> =E3=81=
=AE=E3=83=A1=E3=83=BC=E3=83=AB=EF=BC=9A

> On Thu, Jul 17, 2014 at 08:13:12AM +0900, Ryo Fujita wrote:
>> Hi Pablo-san and all,
>>=20
>> Thank you so much!
>> You made me clear.
>>=20
>>> You can add rules without any action.
>>=20
>> I understand it=E2=80=99s the spec not a bug.
>>=20
>>> Try -n to disabling name resolution:
>>>=20
>>> # nft -n list table inet filter
>>=20
>>=20
>> Yes, I check that reverse lookup fails as you pointed out.
>>=20
>>>> My environment was as followings.
>>>> nftables-0.100-3.20140704git.fc21.x86_64
>>>=20
>>> Please, use latest when testing.
>>>=20
>>> http://www.netfilter.org/projects/nftables/downloads.html
>>=20
>>=20
>> The reason why I=E2=80=99m using the slight old version is to write =
a
>> magazine article introducing nftables. It=E2=80=99s easy for readers=
 to
>> install the version I checked with RPM or archive like
>> 'nftables-0.3=E2=80=99.  Anyway, I=E2=80=99ll test the latest before=
 sending a
>> report to this ML.
>=20
> Not a good idea to stick to old versions. We're still changing syntax
> in some aspects and resolving bugs at this stage. The user document
> aims to be in sync with latest. You should recommend people to stick
> to latest until 1.0 comes out.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

#######################################################################=
#
Ryo Fujita <rfujita@redhat.com>
Supervisor, Solution Architects, RHCE
Red Hat K.K.
TEL +81-3-5798-8500 FAX +81-3-5798-8599
Ebisu Neonato 8F, 4-1-18 Ebisu, Shibuya-ku, Tokyo Japan 1500013

=E3=83=AC=E3=83=83=E3=83=89=E3=83=8F=E3=83=83=E3=83=88=E6=A0=AA=E5=BC=8F=
=E4=BC=9A=E7=A4=BE
=E3=82=B0=E3=83=AD=E3=83=BC=E3=83=90=E3=83=AB=E3=82=B5=E3=83=BC=E3=83=93=
=E3=82=B9=E6=9C=AC=E9=83=A8=E3=83=97=E3=83=A9=E3=83=83=E3=83=88=E3=83=95=
=E3=82=A9=E3=83=BC=E3=83=A0=E3=82=BD=E3=83=AA=E3=83=A5=E3=83=BC=E3=82=B7=
=E3=83=A7=E3=83=B3=E7=B5=B1=E6=8B=AC=E9=83=A8
=E3=82=BD=E3=83=AA=E3=83=A5=E3=83=BC=E3=82=B7=E3=83=A7=E3=83=B3=E3=82=A2=
=E3=83=BC=E3=82=AD=E3=83=86=E3=82=AF=E3=83=88=E9=83=A8=E9=95=B7
=E8=97=A4=E7=94=B0=E3=80=80=E7=A8=9C
=E3=80=92150-0013
=E6=9D=B1=E4=BA=AC=E9=83=BD=E6=B8=8B=E8=B0=B7=E5=8C=BA=E6=81=B5=E6=AF=94=
=E5=AF=BF4-1-18 =E6=81=B5=E6=AF=94=E5=AF=BF=E3=83=8D=E3=82=AA=E3=83=8A=E3=
=83=BC=E3=83=888=E9=9A=8E
Tel 03-5798-8500
http://www.jp.redhat.com/

Please consider the environment before printing this e-mail.
#######################################################################=
#

