From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: (Ab)using iptables to record byte count per IP?
Date: Sat, 10 Jan 2009 15:55:33 +1300
Message-ID: <49680E25.7030609@treenet.co.nz>
References: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>	 <49673A13.6050807@arturaz.net> <1231502126.24038.15.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1231502126.24038.15.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Thomas Jacob wrote:
> On Fri, 2009-01-09 at 13:50 +0200, Art=C5=ABras =C5=A0lajus wrote:
>> Richard Hartmann wrote:
>>  > Hi all,
>>  >
>>  > I need to log the traffic each local IP in a NAT'ed network gener=
ates
>>  > per day.
>>  >
>>  > Unfortunately, the environment is rather restricted and compiling=
 new
>>  > software is not an option. Thus, I am wondering if I can abuse ip=
tables,
>>  > which is in use anyway, to log for me, as well.
>>  >
>>  > The end result should be a log which contains IP, date and traffi=
c
>>  > generated. I don't really care about the output format as I will =
perl it
>>  > into the format I need, anyway.
>>
>> iptables -N ACCOUNTING
>> iptables -A FORWARD -j ACCOUNTING
>> iptables -A ACCOUNTING -s your_user_ip -j ACCEPT
>> iptables -A ACCOUNTING -d your_user_ip -j ACCEPT
>>
>> bam, with iptables -L ACCOUNTING -n -v you can have packet/byte coun=
ters ;)
>=20
> Or you could use the external extension ipt_ACCOUNT
>=20
> http://www.intra2net.com/de/produkte/opensource/ipt_account/=20
>=20
> which does the same much faster and you don't have to
> specify lots of accounting rules. Unfortunately you need
> to patch your kernel for that, if you want to use it
> as is.

Whats needed and is anyone working towards getting that integrated prop=
erly?

AYJ
