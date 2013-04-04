From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: Re: ipv6 rule icmp bug maybe
Date: Thu, 4 Apr 2013 17:16:17 +1000
Message-ID: <CAMD-=VLaF0B2VEts_am-H8hnuLmi=EAjWXO1ninU=_Q+b=TwSg@mail.gmail.com>
References: <CAMD-=VJU3PesmF7P4c0nQuk1Nw_XdoUf559h8tXfbEGXEv=2dQ@mail.gmail.com>
	<5293489.MPThhE2Fke@alaris>
	<CAMD-=VJ7md+MEqtCcAdw9YgzuvoK_cPVy3KFcoPz8RwB_=52pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type:content-transfer-encoding;
        bh=j6G39gVI4dEziy8dzzvwG8PNTZgd0ftBWqEuQaouT7s=;
        b=GjJxjNwVVdz+4JWQPb81fvpuCNcUODDG6W0SL3/H/Ye2mIq/hdw0kbASoO79F23z9/
         dwjPCGR9EH5TQxtFx4X+r7HRLl7yGXztNAt0/rLIBg+jv2rokgk571zGj2yUN+d88y2u
         PwsqVYZ6cPc6eHjPt3L4WBj3mUv+vgOMTuCX18LHSWwS9JbQnxANL+sR7OxHl6+qMn09
         amTKSsOgUc6dPbuz0L673jQH1iGigSmxXjt3Ms4EB1XMywVNZ0RU2ecfBBYkQtKzoCVh
         iHdfElVfGgNYugrza1Z3QXVMeMjNP1rNpRfn7cjfo7uZBJtIIhwW6N7ylwUUnPUoFG/N
         4AYA==
In-Reply-To: <CAMD-=VJ7md+MEqtCcAdw9YgzuvoK_cPVy3KFcoPz8RwB_=52pQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: mkubecek@suse.cz
Cc: netfilter@vger.kernel.org

Darnit, forgot to mention, that if I change policy to accept, I can
ping it on ipv6, so there is no upstream tampering.


On 4/4/13, Nick Edwards <nick.z.edwards@gmail.com> wrote:
> On 4/4/13, Michal Kube=C4=8Dek <mkubecek@suse.cz> wrote:
>>
>>
>> Hard to say unless you tell us what do your rules look like and what
>> packets are dropped (and you think they shouldn't be).
>
> ok, copy and paste with  only minor munging
>
>
> #!/bin/sh
> /usr/sbin/iptables -F
> /usr/sbin/ip6tables -F
>
> /usr/sbin/iptables -P INPUT DROP
> /usr/sbin/ip6tables -P INPUT DROP
>
> /usr/sbin/iptables -P OUTPUT ACCEPT
> /usr/sbin/ip6tables -P OUTPUT ACCEPT
>
> /usr/sbin/iptables -P FORWARD DROP
> /usr/sbin/ip6tables -P FORWARD DROP
>
> /usr/sbin/iptables -A INPUT -i lo -j ACCEPT
> /usr/sbin/ip6tables -A INPUT -i lo -j ACCEPT
> /usr/sbin/ip6tables -A INPUT -s fe80::/10 -j ACCEPT
> /usr/sbin/ip6tables -A INPUT -d ff00::/8 -j ACCEPT
>
> /usr/sbin/iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
> /usr/sbin/iptables -A INPUT -s 178.x.x.x/24 -j ACCEPT
> /usr/sbin/ip6tables -A INPUT -s 2001:c01d:c01d:beef::0/64 -j ACCEPT
>
> /usr/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j A=
CCEPT
> /usr/sbin/ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j =
ACCEPT
>
>
> I can reach this machine from 178.x.x.x as normal. I can ssh in, and =
ping
> it
>
> however, when I come from the ipv6 range, I can ssh in, but I can not=
 ping
> it.
>
> There are no other conditions in play on this remote machine, what yo=
u
> see is what is there
> So I dont get why when  _range_ ACCEPT works for all protocols on
> ipv4, but it doesnt with ipv6
>
