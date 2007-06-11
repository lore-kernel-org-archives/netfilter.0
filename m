From: "=?ISO-8859-1?Q?Martin_Schi=F8tz?=" <malinux@gmail.com>
Subject: Re: iptables state transfer
Date: Mon, 11 Jun 2007 14:12:38 +0200
Message-ID: <e208f5d10706110512l32e12e2ap6b79e318c57b4546@mail.gmail.com>
References: <e208f5d10706110355o42796f61va19167b7ac2282b6@mail.gmail.com>
	<slrnf6qc46.71g.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=N4lI39swHtb0xSfPg+NROPQg4d1pbNGTgm47jrG+E+m3SBFmhma65G/7Zv63mKRDDGDLHMDwgSutRIBmkQG5MNAGxh7Q9MTBfCGewVaNFQAJNGM79CkAHMx6WEcx7miy72S+5n5L1l0oiNoBa4Gv04Wf3x2CZuBnU22oOEd8agI=
In-Reply-To: <slrnf6qc46.71g.petr.pisar@album.ics.muni.cz>
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
To: Petr Pisar <petr.pisar@atlas.cz>
Cc: netfilter@lists.netfilter.org

> > Can iptables do state transfer between two firewalls for failover
> > purpose. Something like PF sync with PF in BSD.
> >
> > I want to do NAT with failover.
> >
>
> Try conntrack-tools
> http://people.netfilter.org/pablo/conntrack-tools/
>

It looks like the right thing - Thanks!

- Martin

