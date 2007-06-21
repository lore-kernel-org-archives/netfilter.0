From: "=?ISO-8859-1?Q?Juan_Le=F3n?=" <debjuanca@gmail.com>
Subject: Re: Netfilter Hooks
Date: Thu, 21 Jun 2007 14:14:47 -0400
Message-ID: <6bb85d880706211114p50a552e6mdf294b1f8b3119c4@mail.gmail.com>
References: <f9432b90706201841p7cf4cf95u25dcaa0a55124fac@mail.gmail.com>
	<498E8850061D9A008669D70D@192.168.42.19>
	<467A997A.9080706@genesilico.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=iQuf6KZ32i+DgjMoYdx0NTIk0RSkkl5QStU9KXPaijvNGL0liEkRC84yeQa91RzMHs9J3FdOamePU2h6lysg9sM7456pyR9jZDcMRwLpAQWzLLHLJVICEwc+wFUGf2W2fnYxkakujo6P6aClNztt7nJ/nUtGzsyNOMLWMh3ECa4=
In-Reply-To: <467A997A.9080706@genesilico.pl>
Content-Disposition: inline
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
To: Jan Kogut <jkogut@genesilico.pl>
Cc: netfilter@lists.netfilter.org

2007/6/21, Jan Kogut <jkogut@genesilico.pl>:
> Hi,
> >
> > look for "string" in the manpage to iptables.
> >
> > iptables ... -m string --string "GOOGLE" --algo bm ...
> >
> > should be the right pointer for you.
> >
>
> I am wondering about the usability of the Knuth-Pratt-Morris algorithm
> (--algo kmp).
>
> here
> http://www-igm.univ-mlv.fr/~lecroq/string/node14.html#SECTION00140
> vs
> http://www-igm.univ-mlv.fr/~lecroq/string/node8.html#SECTION0080
>
> we can see that Boyer-Moore gives definitely better performance than
> Knuth-Pratt-Morris.
> That is why I am curious about when kmp is better than bm ?
>
> Cheers,
> JK
>
> --
> Regards,
>
> Jan Kogut
> Computer Systems Administrator
> Laboratory of Bioinformatics and Protein Engineering
> International Institute of Molecular and Cell Biology
>
> ul. Ks. Trojdena 4
> 02-109 Warsaw, Poland
> http://genesilico.pl
>
>
> :.
>
>
>

if you use a string match and match for a specific string inside the
packet, lets say get /index.html. Will that work? Normally, yes.
However, if the packet size is very small, it will not. The reason is
that iptables is built to work on a per packet basis, which means that
if the string is split into several separate packets, iptables will
not see that whole string. For this reason, you are much, much better
off using a proxy of some sort for filtering in the application layer.

Use Squid.

