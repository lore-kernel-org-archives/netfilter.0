From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: bytes count question
Date: Thu, 15 Mar 2007 21:01:37 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703152059480.1199@yvahk01.tjqt.qr>
References: <45F95EA9.3030201@unipex.it>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45F95EA9.3030201@unipex.it>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@lists.netfilter.org


On Mar 15 2007 15:56, Michele Petrazzo - Unipex srl wrote:
>
> Hi list,
> I'm making some test for see "how many traffic" create an IP, so, into
> the gateway, I create a chain, add a rule so all the traffic go through
> it, and here accept all the traffic.
> After, from that IP, I download a file that has 1 MB and I control with
> a "iptables -nxvL my_chain" what number are on the "bytes" columns, but
> with a big surprise, I see 60000.
> What're this number?
>
> I thought to find something like 1048000 (or similar)!


(1) What is counted is L3 bytes, i.e. includes IP and TCP headers.
(2) Compression on L4 (ipcomp) or L7 (gzipped HTTP transfer)
(3) Use of caching proxies may reduce bandwidth by returned fresh entries

And BTW, any traffic analyzer (like iptraf) will show the same counting.


Jan
-- 

