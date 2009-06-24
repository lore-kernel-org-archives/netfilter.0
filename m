From: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 12:10:34 -0600
Message-ID: <bf0e93a30906241110g3f6ab35al583c451c2ca2b777@mail.gmail.com>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
	 <200906241320.13779.christoph.paasch@gmail.com>
	 <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
	 <200906241347.41841.christoph.paasch@gmail.com>
	 <2108.192.168.1.3.1245856012.squirrel@webmail.decimal.pt>
	 <56378e320906240826w146d9f1cnd443a5997137e281@mail.gmail.com>
	 <2989.192.168.1.3.1245858328.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=1T3l6k6ArhHXdWOFyI1wQrQBjBjJ3z7a6NNjweej2l8=;
        b=i1MSYDZyHDf2Km9IXv6QHmUvO5FLfSkNqIotUEVmpxxe6ZtDpXrhoPPEBDzLvxBOWd
         MmtskLc/NyBNkQ1YCBt2jaTYceFs1p7Yi2O6CzwHV/FPiH6bVAfXwUsukNXlWoGPdU7L
         r80oKca/vi5kGowNn6dmHiNLILw+6qXc1NeME=
In-Reply-To: <2989.192.168.1.3.1245858328.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: Richard Horton <arimus.uk@googlemail.com>, netfilter@vger.kernel.org

Hi Jorge,

Well, the scenary is that you want to allow outgoing traffic to tcp
port number 22 from your internal LAN.

The rules suggested


1) $ipt -P FORWARD DROP
2) $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
3) $ipt -A FORWARD -m state --state NEW -p tcp --dport 22 -j ACCEPT


are for:

1) Apply a POLICY to DROP any packet that does not match any rule in
the chain (in this case, the FORWARD chain)

2) Allow incoming traffic in response to traffic generated from your
internal network or from the GNU/Linux router itself. If you does not
use that rule (the second rule) you will not able to "speak" with the
world

3) Allow packets marked with the SYN flag to travel to the world, but
if the second rule does not exists, the traffic in response to the
initial request to initiate a ssh sesion will not receive an answer
from the world.

I suggest you try to understand the mechanics to establish a tcp sesion=
=2E

Best regards,

Jorge D=E1vila.

On Wed, Jun 24, 2009 at 9:45 AM, Jorge Bastos<mysql.jorge@decimal.pt> w=
rote:
>> You are always advised to make the default rule (Ie policy) drop wit=
h
>> any firewall then only explicitly allow traffic you wish allow:
>>
>> (I am assuming here you want to allow connections *to* port 22 on th=
e
>> external network from your internal network, for my example the
>> internal network has an ip address of 192.168.0.0/24)
>> iptables -t filter -F FORWARD =A0# Clear out what exists already
>> iptables -t filter -P FORWARD -j drop # Set default to drop
>> iptables -t filter -A FORWARD -s 192.168.0.0/24 -d ! 192.168.0.0/24 =
-p
>> tcp --dport 22 -j ACCEPT
>
>
> cisne:/etc/rc.d# iptables -t filter -P FORWARD -j DROP
> iptables v1.4.4: -P requires a chain and a policy
> Try `iptables -h' or 'iptables --help' for more information.
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Jorge Isaac D=E1vila L=F3pez
+505 8430 5462
jorgedavilalopez@gmail.com
---
Esta tierra es Linux. En las noches calladas puede escucharse a las
m=E1quinas Windows re-inici=E1ndose...
