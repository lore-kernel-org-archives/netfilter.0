From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: log entries
Date: Fri, 7 May 2010 21:54:06 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005072147120.31492@obet.zrqbmnf.qr>
References: <20100507150855.xgsdi9r1mo0gk0o4@mail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100507150855.xgsdi9r1mo0gk0o4@mail.harrisonburg.k12.va.us>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dhottinger@harrisonburg.k12.va.us
Cc: "list, netfilter discussion" <netfilter@vger.kernel.org>

On Friday 2010-05-07 21:08, dhottinger@harrisonburg.k12.va.us wrote:

> I keep seeing this log message in my firewall logs:
> May  7 15:05:12 firewall kernel: DROP IN=eth3 OUT=
> MAC=00:80:c8:ca:9f:bb:00:0f:35:2e:81:a2:08:00 SRC=64.94.179.24
> DST=204.111.42.226 LEN=32 TOS=0x00 PREC=0x00 TTL=5 ID=2063 PROTO=UDP SPT=10495
> DPT=33444 LEN=12
>
> The SRC address differs from time to time.  Are these port scans?

 - low TTL
 - UDP payload of 4 bytes

 - linux udp traceroute defaults to 40 bytes of payload
 - nmap udp port scans default to 0 bytes

Combine, Watson! :)
