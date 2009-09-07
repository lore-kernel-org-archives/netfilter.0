From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: How to view blacklist ip ?
Date: Mon, 07 Sep 2009 13:13:47 +0530
Message-ID: <4AA4B9B3.6020409@infoservices.in>
References: <4AA4A0D4.3080109@infoservices.in> <4AA4B741.7010209@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA4B741.7010209@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Pascal Hambourg wrote:
> Hello,
>
> J. Bakshi a =E9crit :
>  =20
>> iptables -A INPUT -m recent --name blacklist --rcheck --seconds
>> $BLACKLIST_INTERVAL -j DROP
>>
>> and it is working really well. But is there any way to manage the
>> blacklisted ip ? Manage means
>>    =20
>
> man iptables
>
>  =20
>> 1> view the ips which are blacklisted
>>    =20
>
> Read /proc/net/ipt_recent/<name>.
>
>  =20

Great !!!. Thanks a lot. Now I can write a shell script to manage the I=
Ps.



>> 2> manually remove an IP from blacklist
>>    =20
>
> Write "-a.b.c.d" into /proc/net/ipt_recent/<name> where a.b.c.d is th=
e
> address to remove. You can also write "clear" to flush the list.
>
>  =20
>> 3> manually insert an IP as blacklist
>>    =20
>
> Write "+a.b.c.d" or "a.b.c.d" into /proc/net/ipt_recent/<name> where
> a.b.c.d is the address to add or update.
>
> Warning : ipt_recent may have been renamed xt_recent in recent kernel=
s.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20

