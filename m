From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: www.adobe.com
Date: Thu, 13 Nov 2008 01:15:28 -0800
Message-ID: <491bf03a.29578c0a.78e9.ffffb12c@mx.google.com>
References: <20081113075231.50345b2c@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language
         :message-id;
        bh=fdzzuZj/NqsPV0wD1EII04VKcFvwuPNRxxfwFAzNK6E=;
        b=dDBKN9FfHg8rAD5LklkTisBldva1D8ezboxjxsoes8iGbqXp1WjmQ95wRPcjWNUWZC
         CEfCM9IPiXwQQxurs1Q7r3IkQY0DNzpTLqMt7Gf1z5QQWaLmfdp4fxgoN/f/hD2v/NP8
         BQoMnRpW76ijRiKvga5yZ+KSVNkHNbsenSqyE=
In-Reply-To: <20081113075231.50345b2c@gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'TheOldFellow' <theoldfellow@gmail.com>, netfilter@vger.kernel.org

The dropped packets are 44 bytes long, which is suspicious.
I would guess that fragmentation is involved.

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of TheOldFellow
> Sent: Wednesday, November 12, 2008 11:53 PM
> To: netfilter@vger.kernel.org
> Subject: www.adobe.com
> 
> My firewall works well, except that I can't get any kind of access to
> www.adobe.com.
> 
> This is typical:
> 
> # ping www.adobe.com
> PING www.wip3.adobe.com (192.150.18.101): 56 data bytes
> 64 bytes from 192.150.18.101: icmp_seq=0 ttl=243 time=194.939 ms
> 64 bytes from 192.150.18.101: icmp_seq=1 ttl=243 time=193.576 ms
> 64 bytes from 192.150.18.101: icmp_seq=2 ttl=243 time=194.612 ms
> 64 bytes from 192.150.18.101: icmp_seq=3 ttl=243 time=194.844 ms
> --- www.wip3.adobe.com ping statistics ---
> 4 packets transmitted, 4 packets received, 0% packet loss
> round-trip min/avg/max/stddev = 193.576/194.493/194.939/0.542 ms
> 
> so far so good...
> 
> # wget http://www.adobe.com/index.html
> --07:45:04--  http://www.adobe.com/index.html
>            => `index.html'
> Resolving www.adobe.com... 192.150.18.101
> Connecting to www.adobe.com|192.150.18.101|:80...
> 
> it just times out - browsers are the same.
> 
> Looking at the log shows the following warnings:
> 
> IPTABLES:INPUT IN=net OUT=
> MAC=00:a0:c9:43:8f:77:00:90:96:f7:74:42:08:00 SRC=192.150.18.101
> DST=192.168.1.2 LEN=44 TOS=0x00 PREC=0x00 TTL=53 ID=9637 PROTO=TCP
> SPT=80 DPT=3723 WINDOW=20498 RES=0x00 URGP=0
> IPTABLES:INPUT IN=net OUT=
> MAC=00:a0:c9:43:8f:77:00:90:96:f7:74:42:08:00 SRC=192.150.18.101
> DST=192.168.1.2 LEN=44 TOS=0x00 PREC=0x00 TTL=53 ID=45688 PROTO=TCP
> SPT=80 DPT=3723 WINDOW=20498 RES=0x00 URGP=0
> IPTABLES:INPUT IN=net OUT=
> MAC=00:a0:c9:43:8f:77:00:90:96:f7:74:42:08:00 SRC=192.150.18.101
> DST=192.168.1.2 LEN=44 TOS=0x00 PREC=0x00 TTL=53 ID=37819 PROTO=TCP
> SPT=80 DPT=3723 WINDOW=20498 RES=0x00 URGP=0
> 
> and my iptables:
> iptables -L
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
> ACCEPT     all  --  anywhere             anywhere            state
> RELATED,ESTABLISHED
> ACCEPT     udp  --  anywhere             anywhere            udp
> dpt:domain
> ACCEPT     tcp  --  anywhere             anywhere            tcp
> dpt:domain
> ACCEPT     tcp  --  anywhere             anywhere            tcp
> dpt:http
> ACCEPT     udp  --  anywhere             anywhere            udp
> dpt:http
> ACCEPT     tcp  --  anywhere             anywhere            tcp
> dpt:irdmi
> ACCEPT     udp  --  anywhere             anywhere            udp
> dpt:irdmi
> ACCEPT     tcp  --  anywhere             anywhere            tcp
> dpt:ftp
> ACCEPT     udp  --  anywhere             anywhere            udp
> dpt:ftp
> ACCEPT     tcp  --  anywhere             anywhere            tcp
> dpt:ssh
> ACCEPT     udp  --  anywhere             anywhere            udp
> dpt:ssh
> ACCEPT     all  --  172.16.1.0/24        anywhere
> ACCEPT     tcp  --  anywhere             anywhere            tcp
> dpt:smtp
> ACCEPT     udp  --  anywhere             anywhere            udp
> dpt:smtp
> LOG        all  --  anywhere             anywhere            LOG level
> warning prefix `IPTABLES:INPUT '
> 
> Chain FORWARD (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere            state NEW
> ACCEPT     all  --  172.16.1.0/24        anywhere
> ACCEPT     all  --  anywhere             anywhere            state
> RELATED,ESTABLISHED
> 
> Chain OUTPUT (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
> 
> I'm completely stumped on this.  Can anyone suggest a way forward?
> 
> Thanks.
> 
> R.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

