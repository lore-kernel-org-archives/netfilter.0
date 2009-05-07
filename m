From: Elvir Kuric <omasnjak@gmail.com>
Subject: Re: PostgreSQL x iptables
Date: Thu, 7 May 2009 21:27:22 +0200
Message-ID: <1814bfe70905071227qcb2476eue13ce3e83aa11b02@mail.gmail.com>
References: <7F27BA389269BB47A79525510325A35F6F9253@se02.upce.cz>
	 <1814bfe70905061136r1df845b9h7e3f3de816993f80@mail.gmail.com>
	 <7F27BA389269BB47A79525510325A35F6F92E1@se02.upce.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=K14jOO4FV5ej2y2uNZhfWnMh5PS5O9DK4iybjwM+fzo=;
        b=OEY9ry2n/3htQ+e0t257iIGrEKIOj7TbsbTkuT1l6JhEwRl6BBsYSL4F2vSBV4crli
         s3IqhiHAFa/zeA31IB0RprTEFvXArHor0QuXs61ZH/8AoiXlc6bBoxHKQ5xF/EdJ1epz
         oGmXTtQjG5iREk6JvP3UsAkcmx6XaTSceLew4=
In-Reply-To: <7F27BA389269BB47A79525510325A35F6F92E1@se02.upce.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Slansky Lukas <Lukas.Slansky@upce.cz>
Cc: netfilter@vger.kernel.org

Exactly. Because what you want to achieve is not from iptables point
problematic at all. Somethig else must be there what poison
traffic/connection

Nice regards


Elvir Kuric

2009/5/7 Slansky Lukas <Lukas.Slansky@upce.cz>:
> Hello,
> as you maybe see there is rule 2 that accepts new connections. Unfort=
unately we have found that CISCO works really badly with SACK packets a=
nd these are then recognized as INVALID and dropped. We still don't kno=
w what is wrong and why SACKs are produced by I suspect PIX too. The wo=
rkaround is and some explanation is mentioned in LKML: http://lkml.org/=
lkml/2007/7/29/174
>
> Now after turning SACKs off seems connection stabile. But we'll try t=
o figure out why are such packets produced. But it will probably take t=
ime...
>
> Thanks,
> Lukas
>
> -----Original Message-----
> From: Elvir Kuric [mailto:omasnjak@gmail.com]
> Sent: Wednesday, May 06, 2009 8:37 PM
> To: Slansky Lukas
> Cc: netfilter@vger.kernel.org
> Subject: Re: PostgreSQL x iptables
>
> Hi Lukas,
>
> you should accept NEW connection for traffic you need. Rule "1" accep=
t
> only connections which are initiated
> from " original host"---host which already sent NEW.
> You can to receive all trafic on particular port/from particular host
> and I think it will not be problem to make what you want
> Also, please take care that is necessary to reload rules ( do iptable=
s
> -X -F -Z ) after you change something.
>
> Take a look into Cisco PIX, maybe there you have some limit
>
> For iptables reference see man iptables or Oscar Anderson Iptables ma=
nual
>
> Regards/Ahoj
>
> Elvir Kuric
>
> On Wed, May 6, 2009 at 11:13 AM, Slansky Lukas <Lukas.Slansky@upce.cz=
> wrote:
>> Hello,
>> we're using PG and Application Server (JBoss) on separate CentOS ser=
vers
>> with Cisco PIX in between. On DB side is iptable with following rele=
vant
>> rules:
>>
>> 1. -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j AC=
CEPT
>> 2. -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp -s
>> aaa.bbb.ccc.ddd --dport 5432 -j ACCEPT
>> 3. -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibit=
ed
>>
>> I was wondering when these rules are not OK for our environment. It
>> seems that rules 1 and 2 sometimes (probably for complicated queries=
)
>> pass packets and therefore these packets are rejected by rule 3. Suc=
h
>> connection is then in some weird state, doesn't communicate (obvious=
ly -
>> packets are dropped) and psql (or JBoss) connection is blocking for =
a
>> long time (at least few hours).
>>
>> Everything seems to be OK when I have changed rule 2 to =A0"-A
>> RH-Firewall-1-INPUT -m tcp -p tcp -s aaa.bbb.ccc.ddd --dport 5432 -j
>> ACCEPT".
>>
>> I'm really confused - what other states are possible for iptables ex=
cept
>> ESTABLISHED, RELATED or NEW? In iptables manpage is only INVALID, bu=
t
>> why is this state emerging?
>>
>> Any idea?
>>
>> Lukas
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
