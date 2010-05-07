From: dhottinger@harrisonburg.k12.va.us
Subject: log entries
Date: Fri, 07 May 2010 15:08:55 -0400
Message-ID: <20100507150855.xgsdi9r1mo0gk0o4@mail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: "list, netfilter discussion" <netfilter@vger.kernel.org>

I keep seeing this log message in my firewall logs:
May  7 15:05:12 firewall kernel: DROP IN=eth3 OUT=  
MAC=00:80:c8:ca:9f:bb:00:0f:35:2e:81:a2:08:00 SRC=64.94.179.24  
DST=204.111.42.226 LEN=32 TOS=0x00 PREC=0x00 TTL=5 ID=2063 PROTO=UDP  
SPT=10495 DPT=33444 LEN=12

The SRC address differs from time to time.  Are these port scans?

ddh


-- 
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools

"Everything should be made as simple as possible, but not simpler."
-- Albert Einstein

"The hottest places in Hell are reserved for those who, in times of moral
crisis, preserved their neutrality."
-- Dante

