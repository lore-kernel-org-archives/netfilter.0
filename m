From: Pierre Ossman <drzeus-list@drzeus.cx>
Subject: Re: Out of window filter catches too much
Date: Wed, 02 Mar 2005 08:59:05 +0100
Message-ID: <42257249.8050101@drzeus.cx>
References: <421FBC65.40202@drzeus.cx>
	<Pine.LNX.4.58.0503010938320.14280@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0503010938320.14280@blackhole.kfki.hu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Jozsef Kadlecsik wrote:

>Hi,
>
>On Sat, 26 Feb 2005, Pierre Ossman wrote:
>
>  
>
>>Since there is only linux machines involved here this must be a kernel
>>bug. Either in the TCP layer or in netfilters detection. Here is a dump
>>from the router when it starts throwing away packets:
>>
>>ip_ct_tcp: SEQ is over the upper bound (over the window of the receiver)
>>IN= OUT= SRC=10.8.0.24 DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64
>>ID=10234 DF PROTO=TCP SPT=3851 DPT=873 SEQ=2763580423 ACK=299956256
>>WINDOW=95 RES=0x00 ACK URGP=0 OPT (0101080AC4C2FDE77E1D58C1)
>>ip_ct_tcp: SEQ is over the upper bound (over the window of the receiver)
>>    
>>
>
>On Mon, 21 Feb 2005 I posted a patch to netfilter-devel which addresses
>this and other issues in TCP window tracking. Please try the patch.
>  
>

I assume you meant:
https://lists.netfilter.org/pipermail/netfilter-devel/2005-February/018598.html

I've tried the patch and it seems to keep it from dropping the ACKs 
which is enough to keep the connection going. I still get some errors 
the other way though:

Mar  2 01:36:22 prometheus kernel: ip_ct_tcp: SEQ is over the upper 
bound (over the window of the receiver) IN= OUT= SRC=10.8.0.24 
DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 ID=52959 DF PROTO=TCP 
SPT=1053 DPT=873 SEQ=3991302411 ACK=1391445765 WINDOW=115 RES=0x00 ACK 
URGP=0 OPT (0101080AD974090C92CE1415)
Mar  2 01:36:24 prometheus kernel: ip_ct_tcp: SEQ is over the upper 
bound (over the window of the receiver) IN= OUT= SRC=10.8.0.24 
DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 ID=53577 DF PROTO=TCP 
SPT=1053 DPT=873 SEQ=3991735363 ACK=1391446225 WINDOW=0 RES=0x00 ACK 
URGP=0 OPT (0101080AD974111492CE1C1D)
Mar  2 01:37:55 prometheus kernel: ip_ct_tcp: SEQ is over the upper 
bound (over the window of the receiver) IN= OUT= SRC=10.8.0.24 
DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 ID=5615 DF PROTO=TCP 
SPT=1053 DPT=873 SEQ=4004321678 ACK=1391476149 WINDOW=74 RES=0x00 ACK 
URGP=0 OPT (0101080AD97576E992CF81EC)
Mar  2 01:37:55 prometheus kernel: ip_ct_tcp: SEQ is over the upper 
bound (over the window of the receiver) IN= OUT= SRC=10.8.0.24 
DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 ID=5617 DF PROTO=TCP 
SPT=1053 DPT=873 SEQ=4004323126 ACK=1391476149 WINDOW=74 RES=0x00 ACK 
URGP=0 OPT (0101080AD97576E992CF81EC)
Mar  2 01:37:55 prometheus kernel: ip_ct_tcp: SEQ is over the upper 
bound (over the window of the receiver) IN= OUT= SRC=10.8.0.24 
DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 ID=5619 DF PROTO=TCP 
SPT=1053 DPT=873 SEQ=4004324574 ACK=1391476149 WINDOW=74 RES=0x00 ACK 
URGP=0 OPT (0101080AD97576E992CF81EC)
Mar  2 01:37:55 prometheus kernel: ip_ct_tcp: SEQ is over the upper 
bound (over the window of the receiver) IN= OUT= SRC=10.8.0.24 
DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 ID=5621 DF PROTO=TCP 
SPT=1053 DPT=873 SEQ=4004326022 ACK=1391476149 WINDOW=74 RES=0x00 ACK 
URGP=0 OPT (0101080AD97576E992CF81EC)
Mar  2 01:37:55 prometheus kernel: ip_ct_tcp: SEQ is over the upper 
bound (over the window of the receiver) IN= OUT= SRC=10.8.0.24 
DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64 ID=5623 DF PROTO=TCP 
SPT=1053 DPT=873 SEQ=4004327470 ACK=1391476149 WINDOW=74 RES=0x00 ACK 
URGP=0 OPT (0101080AD97576E992CF81EC)

Rgds
Pierre


