From: Net Warrior <netwarrior863@gmail.com>
Subject: Re: ssh configuration issue / doubt
Date: Mon, 27 Aug 2012 17:05:28 -0300
Message-ID: <CAP7y58NdZtxxce_QW4VmMYi8v7hYfYANFjutW9VuJ2a23DW8Kw@mail.gmail.com>
References: <CAP7y58OmPxEPRR=73BFwChc2t=08VFuqNffTJzmqnON4yRoajQ@mail.gmail.com>
	<CAJygYd3GoRsBcnsaFF5zetwap+fRyU=O+bUwuPr=6mcj7KNsqw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=07A9NoDqd6c/ttjn7JvRgFOsxma6pDrwFoQxIptaL0I=;
        b=iDDkuguXhQpre379lfUtIu/d8W3rnZ+rJgmH24m3QhI92o368QnCmKupU9qiWzQEoZ
         r33MedlqZ+JmfN5bfn73Ky5sijnD9GzaCPiMkFsedYWlZRapjo0L5qxnBBO5kbs/Hur0
         qahub/Z8RV9k/XcsrRDY/L8PGzYJ2Yx6Lfs29I0SAU2iE8uy1KvXAYlVn3WEK1uwppTL
         PhpKNIesuE/Etzes43VuEzkkupzJPYzBBa5cGKYJotkrBULJJ4WfZAwaUfsQBsDEp16K
         fZ/UwHC6aNSF0qvx7tFNG0yNe+3FzsegBNQ/mrgB/qqURlVlFBGyQ6J3BjHy9tKc0cro
         Dxgg==
In-Reply-To: <CAJygYd3GoRsBcnsaFF5zetwap+fRyU=O+bUwuPr=6mcj7KNsqw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Cc: netfilter@vger.kernel.org

This is what I-ve got

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  127.0.0.1            0.0.0.0/0
ACCEPT     icmp --  0.0.0.0/0            xxx        icmp type 8 state
NEW,RELATED,ESTABLISHED
ACCEPT     icmp --  0.0.0.0/0            xxx        icmp type 0 state
RELATED,ESTABLISHED
ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
spts:1024:65535 dpt:22 state NEW,RELATED,ESTABLISHED
ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
spts:1024:65535 dpts:2370:2371 state NEW,RELATED,ESTABLISHED
ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
spts:1024:65535 dpt:1521 state NEW,RELATED,ESTABLISHED
ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
spts:1024:65535 dpt:5901 state NEW,RELATED,ESTABLISHED
ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
spts:1024:65535 dpts:9006:9007 state NEW,RELATED,ESTABLISHED
ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
spts:1024:65535 dpt:21 state NEW,RELATED,ESTABLISHED
ACCEPT     tcp  --  0.0.0.0/0            xxx        tcp
spts:1024:65535 dpt:20 state NEW,RELATED,ESTABLISHED
ACCEPT     udp  --  0.0.0.0/0            xxx        udp
spts:1024:65535 dpts:67:68
ACCEPT     udp  --  0.0.0.0/0            xxx        udp spt:53 dpts:102=
4:65535
ACCEPT     udp  --  0.0.0.0/0            xxx        udp spt:53 dpt:53

Chain FORWARD (policy DROP)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  127.0.0.1            0.0.0.0/0
ACCEPT     icmp --  xxx         0.0.0.0/0           icmp type 0 state
RELATED,ESTABLISHED
ACCEPT     icmp --  xxx         0.0.0.0/0           icmp type 8 state
NEW,RELATED,ESTABLISHED
ACCEPT     udp  --  xxx         0.0.0.0/0           udp spts:1024:65535=
 dpt:53
ACCEPT     udp  --  xxx         0.0.0.0/0           udp spt:53 dpt:53

I create the rules like this

  $IPTABLES -F
  $IPTABLES -Z
  $IPTABLES -X

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT  ACCEPT
$IPTABLES -P FORWARD DROP

Then something like this

for puerto in $TCP
   do
     $IPTABLES -A INPUT -p tcp -s $LAN  -d $D_IN \
        --dport $puerto -m state --state NEW,ESTABLISHED -j ACCEPT

   done


for puerto in $UDP
   do
     $IPTABLES -A INPUT -p udp -s $LAN -d $D_IN \
        --dport $puerto -m state --state NEW,ESTABLISHED -j ACCEPT

   done


}

Thanks for your help
Best Regards
2012/8/27 =E5=8F=B6=E9=9B=A8=E9=A3=9E <sunyucong@gmail.com>:
> the second rule is not needed, it's being shown that it has matched 0
> packet anyway.
>
> Do you have anything else in other table? like raw/nat ?
>
> On Mon, Aug 27, 2012 at 12:51 PM, Net Warrior <netwarrior863@gmail.co=
m> wrote:
>> Hi there.
>> I've got a simple question regarding ssh configuration.
>> Reading the documentation and googling, It seems that to enable ssh =
is
>> the simple thing in the world, I've got this.
>>
>>  $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp -s $ANY_MACHINE\
>>         --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
>>
>> With this rule I can connec to the machine, so far so good, now if I
>> want to do scp or to scp to another machine I get blocked,
>> I permit ALL the output chain.
>>
>> The only way I'm able to do ssh to another host or do scp is by addi=
ng this
>>
>>  $IPTABLES -A INPUT -i $ETH_PRIMARY -p tcp -s $ANY_MACHINE\
>>         --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
>>
>> So I've got this
>>  8   560 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
>> 0.0.0.0/0           tcp dpt:22 state NEW,ESTABLISHED
>>     0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
>> 0.0.0.0/0           tcp spt:22 state NEW,ESTABLISHED
>> With this two rules I can ssh to another host and do scp, I'm confus=
ed
>> cuz all the examples I've been reading do not
>> talk to enable both, only destination port.
>>
>> Chain OUTPUT (policy ACCEPT)
>> target     prot opt source               destination
>>
>>
>> Is this the  right way or I'm missing reading something?
>>
>> Thanks in advance
>> Best Regards
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
