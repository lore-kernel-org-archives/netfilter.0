From: Peter Schobel <pschobel@porchlight.ca>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Mon, 12 Jan 2004 15:57:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F678994A-4541-11D8-AFEE-000393677A36@porchlight.ca>
References: <784D246D-453A-11D8-AFEE-000393677A36@porchlight.ca>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <784D246D-453A-11D8-AFEE-000393677A36@porchlight.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

If i access the proxyhost directly on port 80 i can see the request to 
the local host on 3128 and then i see a request from the local host to 
the remote proxy site and everything works fine - the squid log shows 
the access.  I'm not really sure what to do at this point i've been 
trying any rule i can think of and i have a bunch of logging rules in 
now to try to figure out what's going wrong but i'm not getting any 
more information than what you see below.

If i can't get this working by the end of the night, i'll probably have 
no choice but to format reinstall and try to get back to a working 
configuration which i really don't want to do because i have a lot of 
software installed and configured on that machine that i will have to 
rebuild.

Peter Schobel
~

On Monday, January 12, 2004, at 03:04  PM, Peter Schobel wrote:

> it appears to me as if it's redirecting to port 3128 but its not 
> getting a reply from squid - the squid access log does not show the 
> access at all as if it never received the packet
>
>
> Jan 12 14:52:21 proxyhost IN=eth0 OUT= 
> MAC=00:04:75:fb:a6:e1:00:d0:52:04:43:5a:08:00 SRC=64.187.35.163 
> DST=216.239.37.104 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=47715 DF 
> PROTO=TCP SPT=53036 DPT=80 WINDOW=8192 RES=0x00 SYN URGP=0
> Jan 12 14:52:21 proxyhost IN=eth0 OUT= 
> MAC=00:04:75:fb:a6:e1:00:d0:52:04:43:5a:08:00 SRC=64.187.35.163 
> DST=10.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=47715 DF PROTO=TCP 
> SPT=53036 DPT=3128 WINDOW=8192 RES=0x00 SYN URGP=0
> Jan 12 14:52:24 proxyhost IN=eth0 OUT= 
> MAC=00:04:75:fb:a6:e1:00:d0:52:04:43:5a:08:00 SRC=64.187.35.163 DST= 
> 10.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=47717 DF PROTO=TCP 
> SPT=53036 DPT=3128 WINDOW=8192 RES=0x00 SYN URGP=0
> Jan 12 14:52:27 proxyhost IN=eth0 OUT= 
> MAC=00:04:75:fb:a6:e1:00:d0:52:04:43:5a:08:00 SRC=64.187.35.163 DST= 
> 10.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=47719 DF PROTO=TCP 
> SPT=53036 DPT=3128 WINDOW=8192 RES=0x00 SYN URGP=0
> Jan 12 14:52:30 proxyhost IN=eth0 OUT= 
> MAC=00:04:75:fb:a6:e1:00:d0:52:04:43:5a:08:00 SRC=64.187.35.163 DST= 
> 10.0.0.1 LEN=44 TOS=0x00 PREC=0x00 TTL=63 ID=47721 DF PROTO=TCP 
> SPT=53036 DPT=3128 WINDOW=8192 RES=0x00 SYN URGP=0
> Jan 12 14:52:33 proxyhost IN=eth0 OUT= 
> MAC=00:04:75:fb:a6:e1:00:d0:52:04:43:5a:08:00 SRC=64.187.35.163 DST= 
> 10.0.0.1 LEN=44 TOS=0x00 PREC=0x00 TTL=63 ID=47724 DF PROTO=TCP 
> SPT=53036 DPT=3128 WINDOW=8192 RES=0x00 SYN URGP=0
> Jan 12 14:52:36 proxyhost IN=eth0 OUT= 
> MAC=00:04:75:fb:a6:e1:00:d0:52:04:43:5a:08:00 SRC=64.187.35.163 DST= 
> 10.0.0.1 LEN=44 TOS=0x00 PREC=0x00 TTL=63 ID=47726 DF PROTO=TCP 
> SPT=53036 DPT=3128 WINDOW=8192 RES=0x00 SYN URGP=0
> Jan 12 14:52:42 proxyhost IN=eth0 OUT= 
> MAC=00:04:75:fb:a6:e1:00:d0:52:04:43:5a:08:00 SRC=64.187.35.163 DST= 
> 10.0.0.1 LEN=44 TOS=0x00 PREC=0x00 TTL=63 ID=47739 DF PROTO=TCP 
> SPT=53036 DPT=3128 WINDOW=8192 RES=0x00 SYN URGP=0
> Jan 12 14:52:54 proxyhost IN=eth0 OUT= 
> MAC=00:04:75:fb:a6:e1:00:d0:52:04:43:5a:08:00 SRC=64.187.35.163 DST= 
> 10.0.0.1 LEN=44 TOS=0x00 PREC=0x00 TTL=63 ID=47743 DF PROTO=TCP 
> SPT=53036 DPT=3128 WINDOW=8192 RES=0x00 SYN URGP=0
>
> On Saturday, January 10, 2004, at 12:26  AM, Alistair Tonner wrote:
>>
>> 	Have you tried LOGging the INPUT chain for both 80 and 3128?
>> 	Or, perhaps more thorough, put a LOG rule in PREROUTING
>> 	before the REDIRECT/DNAT rule to log what you will change,
>> 	and since your destination is local, a LOG rule at the top of INPUT
>> 	to catch *everything* for the interim? -- then see at what point
>> 	the packets are actually disappearing.
>> 	
>
>
>
*****************************
Peter Schobel
Network Administrator
Porchlight.ca
Unlimited Internet
*****************************
In a world without walls or fences
We will have no need for gates or windows
*****************************


