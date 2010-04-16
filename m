From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: How to block particular port based on src IP ?
Date: Fri, 16 Apr 2010 16:07:23 +0530
Message-ID: <4BC83DE3.5020506@infoservices.in>
References: <4BC4147D.1060802@infoservices.in> <r2h56378e321004160246rd9958653p7fa5605e8240589a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <r2h56378e321004160246rd9958653p7fa5605e8240589a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

On 04/16/2010 03:16 PM, Richard Horton wrote:
> On 13 April 2010 07:51, J. Bakshi <joydeep@infoservices.in> wrote:
>
>
>  =20
>> I am trying to make an arrangement that rather blocking the IP,; onl=
y
>> the access to the ssh port will be blocked from that IP. So the othe=
r
>> services i.e. imap, apache will be still accessible from the IP
>> excluding ssh. Is it possible ?
>>    =20
>
> Yes. All you need do is change your drop rule to the following:
> iptables -A INPUT -p tcp --dport ssh -m mark --mark 0x1 -m recent
> --set --name sshoverflow
> --rsource -j DROP
>
> The way the rule works is effectively a logical and so its say if the
> destination is the ssh port and the ip address is in the recent list
> then drop the packet. This way only ssh is denied to the bad guy
> rather than everything... might be better to use, for instance,
> iptables -A INPUT -p tcp -m multiport  --dports ssh -m mark --mark 0x=
1
> -m recent --set --name sshoverflow
> --rsource -j DROP
>
> You can then add other services prone to brute force attacks to the d=
rop list...
>
> (Taken me a while to reply as I've been preoccupied with work and
> broken cheekbone thanks to some drunk chavs :()
>
>
>  =20


GREAT !!!
AWESOME !!!
SWEET !!

Exactly what I'm looking since long. Now the overflow connection attemp=
t
droped but the other services are still available. Though the blacklist
interval is taking more than what is defined in the config. here is the
codes

```````````````````````````
iptables -A INPUT -p tcp -m hashlimit --hashlimit-above 2/min
--hashlimit-burst 2 \
--hashlimit-name hashlimit -m state --state NEW -m tcp --dport $SSH_POR=
T
-j \
MARK --set-xmark 0x1/0xffffffff


iptables -A INPUT -p tcp --dport $SSH_PORT -m recent --rcheck --seconds
60 --name sshoverflow --rsource -j DROP

iptables -A INPUT -p tcp --dport $SSH_PORT -m mark --mark 0x1 -m recent=
 \
--set --name sshoverflow --rsource -j DROP

iptables -A INPUT -p tcp -m state --state NEW --dport $SSH_PORT -j ACCE=
PT

`````````````````````````

the interval is set to 60 sec as above. but practically it is taking

``````````````
real 1m52.044s
``````````

measured by *time*

Except the interval ; everything else is running well.

many many thanks..

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

