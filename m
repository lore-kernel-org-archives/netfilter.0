From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Year missing from ulogd2 timestamp
Date: Tue, 14 Mar 2017 20:47:43 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1703142043320.22524@aurora.sdinet.de>
References: <CAAzdDtMV=OaFftNs8A_AF9-TXCvn-pxmVDqdDHCBD_2HTu3t3g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAAzdDtMV=OaFftNs8A_AF9-TXCvn-pxmVDqdDHCBD_2HTu3t3g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Muhammad Faisal <faisalusuf@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 14 Mar 2017, Muhammad Faisal wrote:

> I would like to understand is this a feature or a possible bug that
> Year info is missing from the ulogd2 output.
> 
> 
> Mar 11 15:55:59 wc01 ulogd[14289]: [NEW] ORIG: SRC=5.55.22.172
> DST=192.168.1.3 PROTO=TCP SPT=2083 DPT=5158 PKTS=0 BYTES=0 , REPLY:
> SRC=192.168.1.3 DST=5.55.22.172 PROTO=TCP SPT=5158 DPT=2083 PKTS=0
> BYTES=0

That is because historically the syslog output format does not contain 
the year. Perhaps in the dark unix ages noone thought that you could 
keep logs longer...

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
