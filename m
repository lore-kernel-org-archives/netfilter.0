From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Sat, 29 Apr 2023 13:44:18 +0800
Message-ID: <A7DA2776-4665-48DD-979D-41B4DCB31D7E@gmail.com>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
 <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
 <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
 <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
 <4F769A3B-272B-44A2-81A0-4B9AF437FA80@gmail.com>
 <388bf505-89e7-a4c8-29c9-af7b784a3dd1@at.encryp.ch>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682747062; x=1685339062;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7YV0wDxrpr5HpPtt1h8AsUrWeu8ELGKTaZcSzMmqOcI=;
        b=ojwl2h6oXS8VdW4tk5P3X4StkBZymyZFGz4jjIYF7CmiyBJmFXH15avMPQa5s85B6i
         jPAiwfjFaD6LtpZf4ebVDbYIPRU3W7MnNTVOWW2Y5+KJlXCIUKXp0U43DgQ+9Xh7NQhj
         rdkV/LXNe+KVtbOY80gHoofwJePollX9D4oR/C023I2HpDA5b2vkLTkPDEzEiaOzHtVr
         deqqPQs6MAGBhYlhF2xsA1jDcZGHjYYWHAD2ppBVHUmh2/s7x9TjPIsMWAjJAfzsdPEY
         nKeMPb1xa0rdzq6VVqxToQTbyX7GJlqzgWpITg3M7/IuJEn0Th0kZpuanX8LxOtbt9PZ
         wtjg==
Sender: Glen Huang <hey.hgl@gmail.com>
In-Reply-To: <388bf505-89e7-a4c8-29c9-af7b784a3dd1@at.encryp.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Serg <seentr@at.encryp.ch>
Cc: netfilter@vger.kernel.org

> Basically, what it does is lookup at "local" routing table

I checked my =E2=80=9Clocal=E2=80=9D routing table, and my wan IP was =
there. But somehow, given the following rule, packets with wan IP as the =
destination still got tproxied:

chain foo {
  type filter hook prerouting priority mangle; policy accept;
  fib daddr . iif type { local, broadcast, multicast } return
  meta nfproto ipv4 meta l4proto { tcp, udp } tproxy ip to 127.0.0.1:123 =
meta mark set 1
}

I also tried "type =3D=3D { =E2=80=A6 }", didn=E2=80=99t help.

The official wiki mentioned:
# only accept packets to addresses configured in the *same* interface, =
eg
nft add rule x prerouting fib daddr . iif type local accept

and the man gave this example:
# drop packets to address not configured on *incoming* interface
filter prerouting fib daddr . iif type !=3D { local, broadcast, =
multicast } drop

Which seems to suggest =E2=80=9Clocal=E2=80=9D only matches packets =
whose destination interface must be the same one they originate from? In =
the lan -> wan case, that=E2=80=99s not the case so I guess it doesn=E2=80=
=99t match?

I wonder if there is a fib type or some other kind of rules that can =
match packets destine to local interfaces?

> On Apr 28, 2023, at 6:05 PM, Serg <seentr@at.encryp.ch> wrote:
>=20
> On 4/28/23 11:59, Glen Huang wrote:
>>> nft add rule x prerouting fib daddr . iif type local accept
>> =E2=80=9Clocal" is very close to what I=E2=80=99m after, but from my =
test, it doesn=E2=80=99t match. The linked wiki seems to suggest that =
=E2=80=9Clocal=E2=80=9D means the same interface a packet originates =
from?
>> I wonder if there is an address type that denotes any IP that is =
hosted on local interfaces.
>=20
> I am using the following ruleset to bypass nf_conntrack for traffic =
which neither originating from local IP nor destined to a locally =
configured IP addresses:
>=20
>> table inet nftables_svc {
>>  chain untrack_in {
>>    type filter hook prerouting priority raw - 10; policy accept;
>>      fib daddr . iif type !=3D local notrack
>>  }
>>  chain untrack_out {
>>    type filter hook output priority raw + 10; policy accept;
>>    fib saddr . oif type !=3D local notrack
>>  }
>> }
> Basically, what it does is lookup at "local" routing table - you may =
inspect it yourself using this command:
>> ip route list table local

