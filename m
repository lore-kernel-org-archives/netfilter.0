From: Rinto Exandy <mysuse@gmail.com>
Subject: Re: icmp gaps
Date: Thu, 26 Aug 2004 11:35:57 +0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <e892b9d1040825213577b6e376@mail.gmail.com>
References: <a0f69e504082521196c31a01a@mail.gmail.com>
Reply-To: Rinto Exandy <mysuse@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e504082521196c31a01a@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 26 Aug 2004 09:19:16 +0500, Askar <askarali@gmail.com> wrote:
> hi all
> 
> Below is the output of ping to our billing server from on one of
> another server, when one look into "icmp_seq" sometime there is gap
> between two packets for example in icmp_seq=25 <---> icmp_seq=28 and
> icmp_seq=21 <---> icmp_seq=23.

Theese gaps means that the packet is "time out", if you use Win32
you'll see "Request Time Out"  at icmp_seq 26,27 and 22. Is this
something to worry about ?? Yes ofcourse, many gaps means many request
time out ( the packet didn't reach the destionation in a manner or
time). You need to check the network.
/* sorry my english is bad :)  */

> I just wants to know these gaps are normal or something to worried about?
> 
> regards
> Askar
> 
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=0 ttl=61 time=6.65 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=2 ttl=61 time=22.5 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3 ttl=61 time=9.77 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=4 ttl=61 time=26.9 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=5 ttl=61 time=22.6 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=8 ttl=61 time=13.1 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=9 ttl=61 time=40.4 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=10 ttl=61 time=24.0 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=11 ttl=61 time=18.9 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=12 ttl=61 time=5.80 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=13 ttl=61 time=26.1 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=14 ttl=61 time=26.6 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=15 ttl=61 time=16.9 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=16 ttl=61 time=7.64 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=17 ttl=61 time=8.67 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=18 ttl=61 time=8.04 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=19 ttl=61 time=5.86 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=21 ttl=61 time=6.14 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=23 ttl=61 time=5.82 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=24 ttl=61 time=5.84 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=25 ttl=61 time=11.1 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=28 ttl=61 time=5.89 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=29 ttl=61 time=5.81 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=30 ttl=61 time=5.79 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=31 ttl=61 time=13.3 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=32 ttl=61 time=5.79 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=33 ttl=61 time=8.52 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=35 ttl=61 time=25.1 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=36 ttl=61 time=8.17 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=38 ttl=61 time=5.97 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=39 ttl=61 time=6.04 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=40 ttl=61 time=13.4 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=41 ttl=61 time=29.1 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=42 ttl=61 time=26.0 ms
> 64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=43 ttl=61 time=12.9 ms
> --
> "If you really want something in this life, you have to work for it.
> Now, quiet! They're about to announce the lottery numbers..."
> - Homer Simpson
> 
>

