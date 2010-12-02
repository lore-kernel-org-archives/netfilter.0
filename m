From: Michele Codutti <michele.codutti@uniud.it>
Subject: Re: ClusterIP network slowdown
Date: Thu, 02 Dec 2010 15:01:32 +0100
Message-ID: <1291298492.2044.12.camel@nerino>
References: <1291107610.2488.46.camel@nerino> <4CF78C9A.80302@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CF78C9A.80302@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

I know but that clusterip is deprecated but I cannot use the cluster
match because I'm working a Debian Lenny 5.0 that use the 2.6.26 version
of the Linux kernel.
I cannot change the kernel version until ne next release of Debian, this
is a constraint.
ClusterIP works pretty well, if only I could find a persistent
workaround to this packet loss issue it would be perfect ... until the
next release of Debian of course! ;)

> A suggestion, better use the 'cluster' match.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Michele Codutti
Centro Servizi Informatici e Telematici (CSIT)
Universita' degli Studi di Udine
via Delle Scienze, 208 - 33100 UDINE
tel +39 0432 558928
fax +39 0432 558911
e-mail: michele.codutti at uniud.it

