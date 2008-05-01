From: "Diego Lacerda" <diegolacerda@gmail.com>
Subject: Re: does -p udp --dport 5060 not work with -j LOG?
Date: Thu, 1 May 2008 00:23:57 -0300
Message-ID: <cc86d0010804302023n2b2dbbeu9b7c5f7d80a308cb@mail.gmail.com>
References: <fvarov$iq2$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=dfrml6+flDPHKBEMKKUQ5rmeM+fOiDyka3HgshPYELg=;
        b=h6Meo4jOoIr1g4GwkfgMQvOXQBg/ZBmiXYrd0/iCpRsDd/YBxWkKY8+lzELACKN9foWi6A7owfRT6WdgYddxJdPnMXHoPCacXnAIIsNMPx9yklCw8o4g48ATzHsdZ3oJzhyKK7Ur+V3lNccM/NAmzQJVzBh7l89sqyTvrwh9Dtc=
In-Reply-To: <fvarov$iq2$1@ger.gmane.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sean darcy <seandarcy2@gmail.com>
Cc: netfilter@vger.kernel.org

Hi, Sean,

I used to put -j LOG on the end of my filter scripts to debug this
king of problems, because all packets that didn't match with any rule
will be logged (and then dropped, of course).
Do you have any other rule in PREROUTING chain about the same IP address?

Could you please show the results of "iptables -L -n -v -t nat", and
show what rules do you have in filter mathing the "SIP-BEFORE" target
log (something like "iptables -L -n -v |grep SIP-BEFORE")?

I think that this king of information will help us to help you. :-)

Regards,
Diego Lacerda.

On Wed, Apr 30, 2008 at 7:27 PM, sean darcy <seandarcy2@gmail.com> wrote:
> I'm trying to figure out why my sip port forwarding doesn't work.
>
> $IPT -t nat -A PREROUTING -i external -p udp --dport 5060 -j DNAT --to 10.10.10.180:5060
> $IPT -A FORWARD -p udp -m state --state NEW -d 10.10.10.180 --dport 5060 -j ACCEPT
>
> So before everything I put:
>
> $IPT -t nat -A PREROUTING -i external -p udp --sport 5060 --dport 5060 -j LOG --log-prefix "SIP-BEFORE:  "
>
> (I also tried it without --sport.)
>
> But in syslog I get packets both from "lan" my internal interface:
>
> SIP-BEFORE:  IN=lan OUT= MAC=01:00:5e:7f:ff:fa:00:15:99:25:e1:32:08:00 SRC=10.10.10.102 DST=239.255.255.250 LEN=364 TOS=0x00 PREC=0x00 TTL=1 ID=33785 PROTO=UDP SPT=1024 DPT=1900 LEN=344
> SIP-BEFORE:  IN=lan OUT= MAC=01:00:5e:7f:ff:fa:00:15:99:25:e1:32:08:00 SRC=10.10.10.102 DST=239.255.255.250 LEN=372 TOS=0x00 PREC=0x00 TTL=1 ID=33795 PROTO=UDP SPT=1024 DPT=1900 LEN=352
>
> And, from the external interface, it logs all udp ports:
>
> SIP-BEFORE:  IN=external OUT= MAC=00:48:54:8b:ab:29:00:1a:e2:84:bf:3b:08:00 SRC=xxx.yyy.113.22 DST=xxx.yyy.167.178 LEN=126 TOS=0x04 PREC=0x00 TTL=112 ID=56357 PROTO=UDP SPT=17214 DPT=32375 LEN=106
> SIP-BEFORE:  IN=external OUT= MAC=00:48:54:8b:ab:29:00:1a:e2:84:bf:3b:08:00 SRC=xxx.yyy.113.22 DST=xx.yy.167.178 LEN=126 TOS=0x04 PREC=0x00 TTL=112 ID=56357 PROTO=UDP SPT=17214 DPT=32375 LEN=106
>
> So any suggestions on port forwarding sip appreciated. I'm disappointed I can't figure this out myself using -j LOG (:
>
> sean
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilte r" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
