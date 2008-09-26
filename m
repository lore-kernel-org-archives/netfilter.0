From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: MAC Hash
Date: Fri, 26 Sep 2008 16:22:28 +0200
Message-ID: <48DCF024.7040100@freemail.hu>
References: <604608.25377.qm@web37308.mail.mud.yahoo.com> <48DC332D.5030905@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48DC332D.5030905@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Brian Austin - Standardknit <brian@standarduniversal.com.au>
Cc: sky_jason@yahoo.com, netfilter@vger.kernel.org

What about this?


iptables -t mangle -N PRE_BR1_MAC
cat /etc/firewall/mac_br1 | sort | grep '+' | while read line
 do
 iptables -t mangle -A PRE_BR1_MAC -j CONNMARK -m mac --mac-source `ech=
o=20
$line | awk '{print $1}'` --set-mark $MARK_KNOWN_MAC
 done
iptables -t mangle -A PRE_BR1_MAC -j RETURN -m connmark --mark=20
$MARK_KNOWN_MAC

# UNKNOWN MAC !!!
iptables -A PRE_BR1_MAC -j LOG --log-prefix 'IPT: ***MAC BR1*** '=20
--log-level debug
iptables -A PRE_BR1_MAC -j DROP

# Only on BR1 !!!
iptables -t mangle -N PRE_BR1

# CHECK MAC
iptables -t mangle -A PRE_BR1 -j PRE_BR1_MAC -m connmark ! --mark=20
$MARK_KNOWN_MAC
iptables -t mangle -A PRE_BR1 -j ACCEPT

iptables -t mangle -A PREROUTING -j PRE_BR1 -i br1



Swifty

Brian Austin - Standardknit =EDrta:
>
> -----Original Message -----
> From: Jason Cosby
> Sent: 26/09/2008 8:18 AM
>> All,
>>
>> I have the following running on our server:
>>
>> for m in xx:xx:xx:xx:xx:xx...about 75 MACs
>> do
>>   iptables -t mangle -A PREROUTING -i eth1 -m mac --mac-source $m -j=
=20
>> ACCEPT
>> done
>>
>> iptables -t mangle -A PREROUTING -i eth1 DROP
>>
>> iptables -t mangle -A PREROUTING -i eth1 -m iprange ! --src-range \
>>    192.168.1.1-192.168.1.74 -j DROP
>>
>> and encountered a noticable slowdown when I incorporated the above.=20
>> Can anyone offer suggestions as to how to speed this up? I know that=
=20
>> hash tables are out there, but I am not clear on their use.
>> Thanks,
>> Jason
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>  =20
> I would suggest the problem is your chain of 75 rules...
>
> You may want to make some stubby user chains and branch the tests out=
,=20
> so packets go thru less checks.
>
> ie 7 user chains, with 10 checks in each
>
> so the worst case for chain traversal would be around 17 rules=20
> traversed, not 75, with an average of 8 rules, not 37....
>
> and put your busiest mac addresses at the top of the checks if you ca=
n.
>
> regards
>
> b
>
>
>
>
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

