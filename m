From: Marco Padovan <evcz@evcz.tk>
Subject: Re: Mysterious string "<4>"  in LOG
Date: Sat, 15 Sep 2012 12:34:27 +0200
Message-ID: <505459B3.8020400@evcz.tk>
References: <k31kov$5me$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evcz.tk; s=google;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:x-enigmail-version:openpgp:content-type
         :content-transfer-encoding;
        bh=p1KjlswKB5pHciuW/jbPsN8JaRyb9WmxeilJmJCl0sI=;
        b=Zrg/Sety2BRWvGwXE+hh1sKYlOqa1FGIjcF33choijw3fv5UZ07YYuzH3DyWfWh8WD
         9hFKM5DGvHtBKmmbXA5ifNLf0j3MiLX6gv+yzX2OuviCGnI09qruVeR2Ki7N2ChoP8Pr
         srOPxG2nS8Wz6aOYXmVyCP9rMLfkxJs+zZRaU=
In-Reply-To: <k31kov$5me$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

http://www.spinics.net/lists/netfilter/msg53327.html

Il 15/09/2012 12:20, U.Mutlu ha scritto:
> Hello,
>
> A mysterious string "<4>" gets prepended in LOG:
> Rule:
>  iptables -A INPUT  -m state --state INVALID -m limit --limit 7200/h
> -j LOG --log-prefix "INPUT INVALID "
>
> Result (sanitized):
> Sep 15 11:46:17 s7 kernel: [227009.792828] <4>INPUT INVALID IN=eth0
> OUT= MAC=00:1b:21:ad:7b:d3:00:0c:db:4e:e8:00:08:00 SRC=**.210.155.237
> DST=**.114.132.147 LEN=40 TOS=0x00 PREC=0x00 TTL=52 ID=49676 PROTO=TCP
> SPT=6667 DPT=46271 WINDOW=0 RES=0x00 ACK SYN URGP=0
>
> Happens with all LOG entries.
> Is the string "<4>" in front of "INPUT INVALID" a new feature, or is
> it garbage due to a bug?
>
>
> My system:
>
> # iptables --version
> iptables v1.4.14
>
> # uname -a
> Linux s7 3.6.0-rc5-my1 #1 SMP Wed Sep 12 19:22:44 CEST 2012 x86_64
> GNU/Linux
>
> # dpkg -l | grep -i iptables
> ii  iptables                              1.4.14-3                  
> amd64        administration tools for packet filtering and NAT
> ii  iptables-dev                          1.4.14-3                  
> amd64        iptables development files
> ii  xtables-addons-common                 1.42-2                    
> amd64        Extensions targets and matches for iptables [tools, libs]
> ii  xtables-addons-dkms                   1.42-2                    
> all          Extensions targets and matches for iptables
> ii  xtables-addons-source                 1.42-2                    
> all          Extensions targets and matches for iptables [modules
> sources]
>
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

