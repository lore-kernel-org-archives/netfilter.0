From: Jiri Kosina <jikos@kernel.org>
Subject: Re: conntrackd: synchronization failures
Date: Wed, 11 Jan 2017 22:57:35 +0100 (CET)
Message-ID: <alpine.LRH.2.00.1701112254250.25853@gjva.wvxbf.pm>
References: <alpine.LRH.2.00.1701112049480.25853@gjva.wvxbf.pm>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.00.1701112049480.25853@gjva.wvxbf.pm>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: info@jablonka.cz

On Wed, 11 Jan 2017, Jiri Kosina wrote:

> 	(pid=11083) [ERROR] inject-add2: File exists

Sometimes this EEXIST is reported in inject-add1

> 	        tcp      6 120 FIN_WAIT src=10.33.12.15 dst=116.31.116.30 sport=22 dport=44232 [ASSURED]
> 	(pid=11083) [ERROR] inject-add2: Device or resource busy

This EBUSY seems to be always inject-add2 phase though.

I've tried both conntrackd 1.0.1 and 1.4.3, both compiled against 
libnfnetlink-1.0.1; the behavior has been exactly the same.

The hosts are running rather different kernels (3.10 from RHEL 7 (RS2) and 
4.6.1-rt2 (RS1) respectively).

-- 
Jiri Kosina <jikos@kernel.org>
SUSE Labs
