From: Robin Wood <robin@digininja.org>
Subject: Re: transparent proxy and iptables failing
Date: Wed, 7 Oct 2009 14:12:10 +0100
Message-ID: <7de411230910070612u55050aa5mae98dfd0e32032d@mail.gmail.com>
References: <7de411230910070245s23552d36v66496187db666440@mail.gmail.com> 
	<7de411230910070444u50e7c638m968350c6da1ce6e1@mail.gmail.com> 
	<4ACC83EC.9040801@gulfsat.mg> <4ACC8A26.1050709@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACC8A26.1050709@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Cc: netfilter@vger.kernel.org

2009/10/7 Brian Austin - Standard Universal <brian@standarduniversal.co=
m.au>:
> you could list your rules to prove that they look ok.
>
> iptables -t nat --list -V
>

I've tried changing br-lan to br0 and enclosing it in quotes but neithe=
r work.

Here is the output from the above

# iptables -L -v -t nat
Chain PREROUTING (policy ACCEPT 4 packets, 532 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 REDIRECT   tcp  --  br0    any     anywhere
anywhere            tcp dpt:80 redir ports 3128

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination

And again, testing DROPing instead

# iptables -L -v -t nat
Chain PREROUTING (policy ACCEPT 4 packets, 532 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination
    0     0 DROP       tcp  --  br0    any     anywhere
anywhere            tcp dpt:80

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               des=
tination


With both these rules in place I've ran tcpdump and watched traffic go
over br0 on port 80.

What does the 4 packets and 532 bytes mean? That doesn't seem to be
increasing as I do anything and isn't reset when I do a flush.

Robin

>
>
> Rakotomandimby Mihamina wrote:
>>
>> 10/07/2009 02:44 PM, Robin Wood::
>>>
>>> br-lan
>>> What am I doing wrong?
>>
>> IMHO, the "-" in br-lan is wrong.
>> escape/protect it with "br-lan" or something like that.
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
