From: FiloSottile <filosottile.wiki@gmail.com>
Subject: Re: Iptables without ipt_state using xt_state
Date: Tue, 12 Jan 2010 21:42:38 +0100
Message-ID: <4B4CDEBE.2040304@gmail.com>
References: <4B4CB29D.9000506@gmail.com> <4B4CC130.40204@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :x-enigmail-version:content-type:content-transfer-encoding;
        bh=NAer9r6hbFUkSqlw7iWoGR5H4+v/O12DSLQsXaAJ1Ss=;
        b=YHRHb4BMjk5Hx6hKoPaqByNscWbHFgKpg7h3GhVvtIpmOyTf2eS+UJeUssJxar6kep
         o/7xYKJ/vRt9LyaNqPMtpt55rh+s5CRi2Thw6SM5u4NaJedIR4yuJsshHMZH6chpGRAL
         7PIS50z595VPrBuLfcEq+OwQh2gQmxBqrY2Io=
In-Reply-To: <4B4CC130.40204@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Mart Frauenlob ha scritto:
> On 12.01.2010 18:34, FiloSottile wrote:
>   
>> I am running on a OpenVZ box with static unmodifiable kernel.
>> I have no ipt_state and ipt_connmark but i have xt_state and xt_connmark.
>> I want to build a simple firewall, but when i run that:
>>
>> # iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> iptables: No chain/target/match by that name
>>
>> How to use xt_state instead ipt_state? Or there is an alternative way to
>> build firewall?
>> Thank you
>>     
> eris:~# modinfo xt_state
> filename:
> /lib/modules/2.6.24-etchnhalf.1-686/kernel/net/netfilter/xt_state.ko
> license:        GPL
> author:         Rusty Russell <rusty@rustcorp.com.au>
> description:    ip[6]_tables connection tracking state match module
> alias:          ipt_state
> alias:          ip6t_state
> vermagic:       2.6.24-etchnhalf.1-686 SMP mod_unload 686
> depends:        x_tables,nf_conntrack
>   
modinfo: could not open
/lib/modules/2.6.18-128.1.1.el5.028stab062.3PAE/modules.dep
> eris:~# grep -w xt_state /lib/modules/$(uname -r)/modules.alias
> alias ipt_state xt_state
> alias ip6t_state xt_state
>   
root@vps:~# ls /lib/modules/*
root@vps:~#
> xt_state is the successor of ipt_state.
>
> what does modprobe -v xt_state say?
>   
WARNING: Deprecated config file /etc/modprobe.conf, all config files
belong into /etc/modprobe.d/.
FATAL: Could not load
/lib/modules/2.6.18-128.1.1.el5.028stab062.3PAE/modules.dep: No such
file or directory
> uname -a?
>   
Linux vps.fvnetwork.it 2.6.18-128.1.1.el5.028stab062.3PAE #1 SMP Tue May
5 17:50:37 MSD 2009 i686 GNU/Linux
> regards
>
> Mart
>
>   
As i said, i am on a OpenVZ VPS, and i cannot modify kernel and modules.
The only info that i have is that:

root@vps:~# ls /lib/xtables/ | grep state
libxt_state.so

Does it assure that i have the xt_state module loaded? In case how can i
verify if it works?
And in case it doesn't work, how can i get a simple one-host firewall?

Thank you

-- 
Filippo Valsorda                             FiloSottile@WikiMedia
Linux registered user #492189        Ubuntu registered user #27865
PADI Rescue Diver #0907EL9205    DAN ADV O2 Provider + BLS #281664
www.filosottile.info                      GPG 01A82A13@pgp.mit.edu
Key fingerprint 94B6 85B2 AE48 1C47 BD4D  DC5B 16F3 ADA6 01A8 2A13

