From: V Kurien <kurien.varugis@gmail.com>
Subject: Re: Ulogd and conntrack issues
Date: Mon, 13 Mar 2017 15:29:33 -0700
Message-ID: <CACmTqUmG9tVd2T7E0YWt+idBMXp4mn-ZYJAZ2L0fYFJz8SEH2Q@mail.gmail.com>
References: <CACmTqUmdOmY7jdr3eg6D17bPjipdc1bRrd6K4A6Z5n1_4i4d9g@mail.gmail.com>
 <CAAzdDtMMVjuKkH51GTUD6RdpAkGTP36huXOm4v_KB2JNX8+dTw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=UgE2cf6RDPLVO24CnktjtAMqGpgmrsFps21cdii3ZY4=;
        b=bc+Iorfos59ORmNzuu1pvVBXi72CDBTtB+3ZAXQ3RzDC95DnL1j3n0bVOEpgYIpW6S
         XVHiQa1GeaNMYxbG76GdDCdlmKzCFYV7RimXVWVdQTYPvCORdQhRHcPKgauFrxSANu2t
         eIyOzkbG/4xDPEDIG1hdWXiemvATZK1afUi56wDuSsJC9LD8NFC5Y/01qR4xebQALuBU
         /yL0zaGJ6zTDuvwQgN8O0BllnLlnqKO++qExkwZ6YhCAOX+2iHnIu+dI15+TIbqKs6pe
         t4rkF52IjcS7kuwQ9Te994G8lOXL3fa6DZPoEuCizkpjMbF8BVJj9ACplzYot20KsT+i
         taFw==
In-Reply-To: <CAAzdDtMMVjuKkH51GTUD6RdpAkGTP36huXOm4v_KB2JNX8+dTw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Muhammad Faisal <faisalusuf@gmail.com>
Cc: netfilter@vger.kernel.org

Thanks Muhammad
The ulogd2 modules are all loading without error. What is confusing to
me is that I am seeing flow entries in conntrack but nothing out of
ulogd2. I am running on a host with bridged mode and trying to track
VM to VM flows, so I am not sure if that has something to do with it.
However since the output of conntrack -L makes sense, I just don't
understand why ulogd2 doesn't print the same information.

On Mon, Mar 13, 2017 at 11:39 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
> When starting ulogd2, all the modules are loading without error? If you have
> flow entries as shown in conntrack -L output ulogd2 should print the flows.
>
>
> On Mar 13, 2017 23:09, "V Kurien" <kurien.varugis@gmail.com> wrote:
>>
>> Hi guys,
>> I've been trying to get conntrack logging working with ulogd2 on a
>> Ubuntu 4.4.0-59 generic kernel with no avail by following instructions
>> gleaned from google searches. I'm hoping that someone here can set me
>> on the right path:
>>
>> Here is what I have done:
>>
>> a) modprobe'd: nf_conntrack_ipv4, nf_conntrack_ipv6, modprobe
>> nf_conntrack_netlink,xt_connmark, xt_NFLOG,xt_conntrack
>> b) Iptables rules: -A INPUT -p tcp -j CONNMARK --set-xmark 0x10/0x10,
>> -A OUTPUT -p tcp -j CONNMARK --set-xmark 0x10/0x10
>> c) The stack section of ulogd.conf looks like:
>> stack=log:NFCT,mark:MARK,ip2str:IP2STR,print:PRINTFLOW,out:GPRINT
>>
>> Where the sections here look like:
>> [log]
>> accept_proto_filter=tcp
>> [mark]
>> mark=0x10
>> mask=0x10
>> [out]
>> file="/var/log/ulog/ulogd_tcp.log"
>> sync=1
>>
>>
>> However I get nothing at all in the log even though there are flows
>> transitioning this host:
>>
>> conntrack -L|grep tcp
>> conntrack v1.4.3 (conntrack-tools): 47 flow entries have been shown.
>> tcp      6 431999 ESTABLISHED src=10.0.100.248 dst=10.0.33.244
>> sport=51890 dport=6666 src=10.0.33.244 dst=10.0.100.248 sport=6666
>> dport=51890 [ASSURED] mark=16 use=1
>> tcp      6 431999 ESTABLISHED src=10.0.100.248 dst=10.0.138.44
>> sport=22 dport=56405 src=10.0.138.44 dst=10.0.100.248 sport=56405
>> dport=22 [ASSURED] mark=16 use=1
>> tcp      6 431985 ESTABLISHED src=10.0.100.248 dst=173.225.26.234
>> sport=52066 dport=443 src=173.225.26.234 dst=10.0.100.248 sport=443
>> dport=52066 [ASSURED] mark=16 use=1
>>
>> What could I be doing wrong? Are there better ways to do this? Note
>> that ULOG has been removed in recent kernels.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
