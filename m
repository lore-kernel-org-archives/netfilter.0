From: azurit@pobox.sk
Subject: Re: nftables cgroup accounting problem
Date: Mon, 05 Oct 2020 08:16:12 +0200
Message-ID: <20201005081612.Horde.YsdRRhtDnYTfTD85w2p4wRt@webmail.inetadmin.eu>
References: <20200930192755.Horde.ZHlzJB9_OgMvaVsNNXoPYcf@webmail.inetadmin.eu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.sk; s=dkiminetadmin;
        t=1601878572;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=2MJQNKGooxAIi0X5Tteb9/iv7OfDgA1G0IPrpiXGKy8=;
        b=AyBl+o+3109kEb32NTe1E9G/Fgom74Dc7aYwI3PTCSlRcPBRA+qTm3BONwKs4iILVNCKqm
        PMD7FpmrOPV5mIKaCD+gmjNz/+z2S3IBAZAUqE8NP4JmH+cnB+6LumM6PEtASYtA3SV8JQ
        /lwip9Tlh5ptSAFCyKtiKu61UdrMSX4=
In-Reply-To: <20200930192755.Horde.ZHlzJB9_OgMvaVsNNXoPYcf@webmail.inetadmin.eu>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="Yes"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Anyone?




> Hi,
>
> i'm migrating from iptables to nftables and i'm having problem with  
> accounting using cgroups. Everything was working on iptables but is  
> printing weird errors with nftables (chain 'accounting' exists):
>
> # mkdir /sys/fs/cgroup/net_cls,net_prio/12345
> # echo 0x000112345 > /sys/fs/cgroup/net_cls,net_prio/12345/net_cls.classid
> # nfacct add 12345
> # iptables -I accounting -m cgroup --cgroup 0x000112345 -m nfacct  
> --nfacct-name 12345
> iptables: No space left on device.
>
> # uname -a
> Linux server 4.9.236 #2 SMP Thu Sep 17 16:32:19 CEST 2020 x86_64 GNU/Linux
> # iptables --version
> iptables v1.8.2 (nf_tables)
>
>
> What am i doing wrong?
>
> azur



