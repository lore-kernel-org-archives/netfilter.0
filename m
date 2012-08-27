From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: ssh configuration issue / doubt
Date: Mon, 27 Aug 2012 13:41:29 -0700
Message-ID: <CAJygYd37hOmdidvpyxFpuPJ0TqKjE_wrDS9gMYhgM_sV4FDtkQ@mail.gmail.com>
References: <CAP7y58OmPxEPRR=73BFwChc2t=08VFuqNffTJzmqnON4yRoajQ@mail.gmail.com>
 <CAJygYd3GoRsBcnsaFF5zetwap+fRyU=O+bUwuPr=6mcj7KNsqw@mail.gmail.com>
 <CAP7y58NdZtxxce_QW4VmMYi8v7hYfYANFjutW9VuJ2a23DW8Kw@mail.gmail.com> <CAP7y58PAourPYnGrL5pETcE+zfFFZ8S07-qoJEvSFJXKCf4=KA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=JGIiybd9lgr8L87oi698pmWgdsP1deohuqlRyMo57ik=;
        b=zthXvTHGZTV8yyfbh59o0GbQqzWaBu2d2V2ab619zbzLmjv+cZlk/MNORZAhHdP2AQ
         /hJmCA4o/je+6eh78wQqBNMQ+SoAzxRx5yjyhsT54YJia+OQZC1+Wvo8Q0CJwQEJcLFG
         kuBcMUzrEYVzmX/j9AGfYfV0owgQEbMcL5bAjMvCTNACDPhdwijqBXCtHr8YrlASri9K
         76HCEXvHWHqIMTq6k3UT+QA2S6TQjuAsI08rZ20sgPW0wY2Zzryl6VgHAP+WU6xmPudY
         xU3Ojr5yDd8mI81CdsLpVJsUmOVH5zEksg7WeSjO96MUV9iz9W/Fjgjh0ELU++tJaq5o
         eMKQ==
In-Reply-To: <CAP7y58PAourPYnGrL5pETcE+zfFFZ8S07-qoJEvSFJXKCf4=KA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Net Warrior <netwarrior863@gmail.com>
Cc: netfilter@vger.kernel.org

Ah, I see what's the problem, you are basically confusing two different=
 issue.

1) for allowing ssh into this machine, your first rule is correct and
only one needed.

2) for allowing ssh out to other machine on that machine (it doesn't
matter you have sshed in, it's the same), you should have following
  2.a) in chain OUTPUT , either have policy ALLOW or specificly allow
dport=3D22 state=3DNEW
  2.b) in chain INPUT, either allow everything -m ESTABLISHED or allow
 -spt 22 -m ESTABLISHED.

because when reply  packet hit your INPUT chain,  it would have
spt=3D22, dpt=3D(whatever local port your ssh choose), state=3DESTABLIS=
HED ,
and you can see without your second rule your policy just DROP this
packet.

So, usually this is what I do on input

POLICY: DROP

iptables -A INPUT -i lo0 -j ACCEPT
iptables -A INPUT -m state --state ESTABILISHED,RELATED -j ACCEPT
<.... your other inbound rules>



On Mon, Aug 27, 2012 at 1:21 PM, Net Warrior <netwarrior863@gmail.com> =
wrote:
> The rule is used as  can see when I ssh to another host, as long as I
> do not connect to another host the rule is not used.
>
> 107  8396 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0           tcp dpt:22 state NEW,ESTABLISHED
>    13  2569 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0           tcp spt:22 state NEW,ESTABLISHED
>
> Thanks for your time and support
> Regards
>
>
> 2012/8/27 Net Warrior <netwarrior863@gmail.com>:
>> This is what I-ve got
>>
>> Chain INPUT (policy DROP)
>> target     prot opt source               destination
>> ACCEPT     all  --  127.0.0.1            0.0.0.0/0
>> ACCEPT     icmp --  0.0.0.0/0            xxx        icmp type 8 stat=
e
>> NEW,RELATED,ESTABLISHED
>> ACCEPT     icmp --  0.0.0.0/0            xxx        icmp type 0 stat=
e
>> RELATED,ESTABLISHED
>> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
>> spts:1024:65535 dpt:22 state NEW,RELATED,ESTABLISHED
>> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
>> spts:1024:65535 dpts:2370:2371 state NEW,RELATED,ESTABLISHED
>> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
>> spts:1024:65535 dpt:1521 state NEW,RELATED,ESTABLISHED
>> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
>> spts:1024:65535 dpt:5901 state NEW,RELATED,ESTABLISHED
>> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
>> spts:1024:65535 dpts:9006:9007 state NEW,RELATED,ESTABLISHED
>> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
>> spts:1024:65535 dpt:21 state NEW,RELATED,ESTABLISHED
>> ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
>> spts:1024:65535 dpt:20 state NEW,RELATED,ESTABLISHED
>> ACCEPT     udp  --  0.0.0.0/0            xxx        udp
>> spts:1024:65535 dpts:67:68
>> ACCEPT     udp  --  0.0.0.0/0            xxx        udp spt:53 dpts:=
1024:65535
>> ACCEPT     udp  --  0.0.0.0/0            xxx        udp spt:53 dpt:5=
3
>>
>> Chain FORWARD (policy DROP)
>> target     prot opt source               destination
>>
>> Chain OUTPUT (policy ACCEPT)
>> target     prot opt source               destination
>> ACCEPT     all  --  127.0.0.1            0.0.0.0/0
>> ACCEPT     icmp --  xxx         0.0.0.0/0           icmp type 0 stat=
e
>> RELATED,ESTABLISHED
>> ACCEPT     icmp --  xxx         0.0.0.0/0           icmp type 8 stat=
e
>> NEW,RELATED,ESTABLISHED
>> ACCEPT     udp  --  xxx         0.0.0.0/0           udp spts:1024:65=
535 dpt:53
>> ACCEPT     udp  --  xxx         0.0.0.0/0           udp spt:53 dpt:5=
3
>>
>> I create the rules like this
>>
>>   $IPTABLES -F
>>   $IPTABLES -Z
>>   $IPTABLES -X
>>
>> $IPTABLES -P INPUT DROP
>> $IPTABLES -P OUTPUT  ACCEPT
>> $IPTABLES -P FORWARD DROP
>>
>> Then something like this
>>
>> for puerto in $TCP
>>    do
>>      $IPTABLES -A INPUT -p tcp -s $LAN  -d $D_IN \
>>         --dport $puerto -m state --state NEW,ESTABLISHED -j ACCEPT
>>
>>    done
>>
>>
>> for puerto in $UDP
>>    do
>>      $IPTABLES -A INPUT -p udp -s $LAN -d $D_IN \
>>         --dport $puerto -m state --state NEW,ESTABLISHED -j ACCEPT
>>
>>    done
>>
>>
>> }
>>
>> Thanks for your help
>> Best Regards
>> 2012/8/27 =E5=8F=B6=E9=9B=A8=E9=A3=9E <sunyucong@gmail.com>:
>>> the second rule is not needed, it's being shown that it has matched=
 0
>>> packet anyway.
>>>
>>> Do you have anything else in other table? like raw/nat ?
>>>
>>> On Mon, Aug 27, 2012 at 12:51 PM, Net Warrior <netwarrior863@gmail.=
com> wrote:
>>>> Hi there.
>>>> I've got a simple question regarding ssh configuration.
>>>> Reading the documentation and googling, It seems that to enable ss=
h is
>>>> the simple thing in the world, I've got this.
>>>>
>>>>  $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp -s $ANY_MACHINE\
>>>>         --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
>>>>
>>>> With this rule I can connec to the machine, so far so good, now if=
 I
>>>> want to do scp or to scp to another machine I get blocked,
>>>> I permit ALL the output chain.
>>>>
>>>> The only way I'm able to do ssh to another host or do scp is by ad=
ding this
>>>>
>>>>  $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp -s $ANY_MACHINE\
>>>>         --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
>>>>
>>>> So I've got this
>>>>  8   560 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
>>>> 0.0.0.0/0           tcp dpt:22 state NEW,ESTABLISHED
>>>>     0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
>>>> 0.0.0.0/0           tcp spt:22 state NEW,ESTABLISHED
>>>> With this two rules I can ssh to another host and do scp, I'm conf=
used
>>>> cuz all the examples I've been reading do not
>>>> talk to enable both, only destination port.
>>>>
>>>> Chain OUTPUT (policy ACCEPT)
>>>> target     prot opt source               destination
>>>>
>>>>
>>>> Is this the  right way or I'm missing reading something?
>>>>
>>>> Thanks in advance
>>>> Best Regards
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
