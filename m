From: Jan Kogut <jkogut@genesilico.pl>
Subject: Re: Netfilter Hooks
Date: Thu, 21 Jun 2007 17:30:02 +0200
Message-ID: <467A997A.9080706@genesilico.pl>
References: <f9432b90706201841p7cf4cf95u25dcaa0a55124fac@mail.gmail.com>
	<498E8850061D9A008669D70D@[192.168.42.19]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <498E8850061D9A008669D70D@[192.168.42.19]>
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
To: Werner Maier <maier@fidion.de>
Cc: netfilter@lists.netfilter.org

Hi,
>
> look for "string" in the manpage to iptables.
>
> iptables ... -m string --string "GOOGLE" --algo bm ...
>
> should be the right pointer for you.
>

I am wondering about the usability of the Knuth-Pratt-Morris algorithm 
(--algo kmp).

here 
http://www-igm.univ-mlv.fr/~lecroq/string/node14.html#SECTION00140
vs
http://www-igm.univ-mlv.fr/~lecroq/string/node8.html#SECTION0080

we can see that Boyer-Moore gives definitely better performance than
Knuth-Pratt-Morris.
That is why I am curious about when kmp is better than bm ?

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


