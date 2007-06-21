From: Jan Kogut <jkogut@genesilico.pl>
Subject: Re: Netfilter Hooks
Date: Thu, 21 Jun 2007 20:29:41 +0200
Message-ID: <467AC395.1030007@genesilico.pl>
References: <f9432b90706201841p7cf4cf95u25dcaa0a55124fac@mail.gmail.com>	
	<498E8850061D9A008669D70D@192.168.42.19>	
	<467A997A.9080706@genesilico.pl>
	<6bb85d880706211114p50a552e6mdf294b1f8b3119c4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6bb85d880706211114p50a552e6mdf294b1f8b3119c4@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: =?ISO-8859-1?Q?Juan_Le=F3n?= <debjuanca@gmail.com>
Cc: netfilter@lists.netfilter.org

Hello,
>
> if you use a string match and match for a specific string inside the
> packet, lets say get /index.html. Will that work? Normally, yes.
> However, if the packet size is very small, it will not. The reason is
> that iptables is built to work on a per packet basis, which means that
> if the string is split into several separate packets, iptables will
> not see that whole string. For this reason, you are much, much better
> off using a proxy of some sort for filtering in the application layer.
>
> Use Squid.
That's correct (I hope).
The point is "what is the idea of Knuth-Pratt-Morris algorithm in string
module, if Boyer-Moore works fine?". I assume there should be some pros
and cons of it, hence my curiosity.
Anyway thnx for your indication by demonstration.

Cheers,
JK

-- 
Regards,

Jan Kogut
Computer Systems Administrator
Laboratory of Bioinformatics and Protein Engineering
International Institute of Molecular and Cell Biology

ul. Ks. Trojdena 4
02-109 Warsaw, Poland 
http://genesilico.pl


:.


