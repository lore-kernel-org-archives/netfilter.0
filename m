From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: How to view blacklist ip ?
Date: Mon, 07 Sep 2009 13:29:57 +0530
Message-ID: <4AA4BD7D.3080405@infoservices.in>
References: <4AA4A0D4.3080109@infoservices.in> <4AA4B741.7010209@plouf.fr.eu.org> <4AA4B9B3.6020409@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA4B9B3.6020409@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

J. Bakshi wrote:
> Pascal Hambourg wrote:
>  =20
>> Hello,
>>
>> J. Bakshi a =E9crit :
>>  =20
>>    =20
>>> iptables -A INPUT -m recent --name blacklist --rcheck --seconds
>>> $BLACKLIST_INTERVAL -j DROP
>>>
>>> and it is working really well. But is there any way to manage the
>>> blacklisted ip ? Manage means
>>>    =20
>>>      =20
>> man iptables
>>
>>  =20
>>    =20
>>> 1> view the ips which are blacklisted
>>>    =20
>>>      =20
>> Read /proc/net/ipt_recent/<name>.
>>
>>  =20
>>    =20
>
> Great !!!. Thanks a lot. Now I can write a shell script to manage the=
 IPs.
>
>  =20

Though the content of the file consists of much more. =20

``````````
# cat /proc/net/ipt_recent/blacklist

src=3D183.131.207.0 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 42982149=
02
src=3D240.168.95.31 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 42982149=
02
src=3D254.41.0.0 ttl: 0 last_seen: 4298215698 oldest_pkt: 1 4298215698
src=3D255.255.211.0 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 42982149=
02
src=3D135.0.0.0 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 4298214902
src=3D79.0.0.0 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 4298214902
src=3D53.0.0.0 ttl: 0 last_seen: 4298215698 oldest_pkt: 1 4298215698
src=3D31.190.99.0 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 4298214902
src=3D165.0.0.0 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 4298214902
src=3D236.13.207.0 ttl: 0 last_seen: 4298214902 oldest_pkt: 1 429821490=
2
src=3D135.232.168.45 ttl: 0 last_seen: 4298215698 oldest_pkt: 1 4298215=
698
src=3D255.255.255.211 ttl: 0 last_seen: 4298215698 oldest_pkt: 2 429821=
2575
`````````````````````````````````

And If I try to remove a line it reports

```````````````
WARNING: The file has been changed since reading it!!!
Do you really want to write to it (y/n)?
`````````````````

A yes puts me again into the file. and it is recursive.


>
>  =20
>>> 2> manually remove an IP from blacklist
>>>    =20
>>>      =20
>> Write "-a.b.c.d" into /proc/net/ipt_recent/<name> where a.b.c.d is t=
he
>> address to remove. You can also write "clear" to flush the list.
>>
>>  =20
>>    =20
>>> 3> manually insert an IP as blacklist
>>>    =20
>>>      =20
>> Write "+a.b.c.d" or "a.b.c.d" into /proc/net/ipt_recent/<name> where
>> a.b.c.d is the address to add or update.
>>
>> Warning : ipt_recent may have been renamed xt_recent in recent kerne=
ls.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>  =20
>>    =20
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20

