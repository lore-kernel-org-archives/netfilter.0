From: malware@t-online.de (Michael Mueller)
Subject: Re: Matching IPSEC encapsulated traffic with connection tracking
Date: Tue, 04 Jan 2005 10:16:33 +0100
Message-ID: <41DA5EF1.7050306@t-online.de>
References: <41DA5373.5080404@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41DA5373.5080404@gmx.net>
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
Cc: netfilter@lists.netfilter.org

Hi,

Robert Dahlem wrote:
> The problem is to combine these two scenarios: make both netfilter and
> IPSEC active at the same time.
[...]
> # SYN packet
> HostA kernel: Debug INPUT:IN=eth1 OUT=
>     MAC=00:0a:5e:4d:0f:12:00:0a:5e:4d:10:42:08:00
>     SRC=10.133.127.197 DST=10.133.126.6
>     LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=5559 DF
>     PROTO=TCP SPT=1023 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0

This packet causes the problem because the encapsulated TCP (transport 
mode) or IP packet (tunnel mode) is not inspected and due the connection 
tracking does not know of.

Robert, you may want to look into the mailing list archive of the 
developer list (https://lists.netfilter.org/pipermail/netfilter-devel/) 
and/or the current patch-o-matic. January last year there was a 
discussion on the developer list with the topic "NAT before IPsec with 
2.6" which caused  Harald Welte to produce a patch which may be of help 
to you. I have no idea of the current state of this.


Michael

