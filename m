From: no doubt <hell.no.doubt@gmail.com>
Subject: Re: need help on *nat filter for multiple source IP
Date: Thu, 16 Apr 2009 03:00:52 +0800
Message-ID: <5a7ba2310904151200m29b7c633g5f5326f00bc825b1@mail.gmail.com>
References: <5a7ba2310904122005k6606f6falba0b74b118f42090@mail.gmail.com>
	 <49E2C80C.1030406@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=vD/Ihp8lyHcVAZvyIZJgXYaTiXyCtpJhVfhyxYlWulA=;
        b=m5AOtR5AarV0sZd9TxKs9GmCevFtFHbIrQEfUI1J/TahTjNBRz1M0NEbjKbHJ6z5WE
         sNqpRZ7L8iTKdq1Surkm9VTadpna8rD5hyTB1bJ1aKDcaEQ2lez8vfGCxhCepxz28+MU
         L/KyNiz/mIIWsS2JzSldkb/MxI+iijhnx03/o=
In-Reply-To: <49E2C80C.1030406@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello Mart,

Thanks for the guide. It now works.

-khairul

On Mon, Apr 13, 2009 at 1:05 PM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> no doubt wrote:
>>
>> Hi,
>>
>> Currently Im running a gw firewall for internal soho network.
>>
>> I would like to achieve that for all IP's in 192.168.4.0/24 that are
>> accessing outside internet address port 80, will be directed to
>> 192.168.3.10 port 80 EXCEPT for few IPs namely 192.168.4.10,
>> 192.168.4.100 and 192.168.4.20
>>
>> my rules in nat filter read like this.
>> *nat
>> :PREROUTING ACCEPT [4314:569235]
>> :POSTROUTING ACCEPT [42:12421]
>> :OUTPUT ACCEPT [2807:264498]
>>
>> iptables -A PREROUTING -s ! 192.168.4.10/32 -d ! 192.168.0.0/16 -i
>> eth2 -p tcp -m tcp --dport 80 -j DNAT --to-destination 192.168.3.10
>> iptables -A PREROUTING -s ! 192.168.4.20/32 -d ! 192.168.0.0/16 -i
>> eth2 -p tcp -m tcp --dport 80 -j DNAT --to-destination 192.168.3.10
>> iptables -A PREROUTING -s ! 192.168.4.100/32 -d ! 192.168.0.0/16 -i
>> eth2 -p tcp -m tcp --dport 80 -j DNAT --to-destination 192.168.3.10
>>
>> -A POSTROUTING -o ppp+ -j MASQUERADE
>> COMMIT
>>
>> somehoe it doesnt work. but if I left only 1st line, it works.
>>
>> is there anything i can modify the rules ?
>>
>
> try this:
>
> iptables -t nat -N my_dnat
> iptables -t nat -A PREROUTING -i eth2 -s 192.168.4.10 -p tcp --dport =
80 -j
> my_dnat
> [...]
>
> iptables -t nat -A my_dnat -j DNAT --to-destination 192.168.3.10
>
> -A POSTROUTING -o ppp+ -j MASQUERADE
>
>
>
> greets
>
> Mart
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
