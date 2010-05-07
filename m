From: dhottinger@harrisonburg.k12.va.us
Subject: Re: log entries
Date: Fri, 07 May 2010 16:57:29 -0400
Message-ID: <20100507165729.ub18kaoqcgc0gk0k@mail.harrisonburg.k12.va.us>
References: <20100507150855.xgsdi9r1mo0gk0o4@mail.harrisonburg.k12.va.us>
	<alpine.LSU.2.01.1005072147120.31492@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1005072147120.31492@obet.zrqbmnf.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "list, netfilter discussion" <netfilter@vger.kernel.org>

Thanks all.  I should have dissected the log more.  THe mac= part  
threw me.  I was just scanning through my log files to find anything  
that may account for a temporary disruption in connectivity.  Ive been  
losing internet connectivity for something like 2 to 3 minutes once or  
twice during the day.  I mean absolutely no traffic to internet during  
this time.  Plus, whatever the issue is, it fixes itself in that 2 or  
3 minutes.  Can anyone think of anything that could cause this?  I  
realize this is probably not a netfilter issue at all.  Just grepping  
the brains of some network guru's.

thanks,

ddh


Quoting Jan Engelhardt <jengelh@medozas.de>:

> On Friday 2010-05-07 21:08, dhottinger@harrisonburg.k12.va.us wrote:
>
>> I keep seeing this log message in my firewall logs:
>> May  7 15:05:12 firewall kernel: DROP IN=eth3 OUT=
>> MAC=00:80:c8:ca:9f:bb:00:0f:35:2e:81:a2:08:00 SRC=64.94.179.24
>> DST=204.111.42.226 LEN=32 TOS=0x00 PREC=0x00 TTL=5 ID=2063   
>> PROTO=UDP SPT=10495
>> DPT=33444 LEN=12
>>
>> The SRC address differs from time to time.  Are these port scans?
>
>  - low TTL
>  - UDP payload of 4 bytes
>
>  - linux udp traceroute defaults to 40 bytes of payload
>  - nmap udp port scans default to 0 bytes
>
> Combine, Watson! :)
>



-- 
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools

"Everything should be made as simple as possible, but not simpler."
-- Albert Einstein

"The hottest places in Hell are reserved for those who, in times of moral
crisis, preserved their neutrality."
-- Dante

