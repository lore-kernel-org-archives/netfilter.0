From: "Rodrigo Montoro (Sp0oKeR)" <spooker@gmail.com>
Subject: Re: pptp
Date: Sun, 12 Aug 2007 18:41:03 -0300
Message-ID: <9255886c0708121441h3265684ep8699d7ee771f53c2@mail.gmail.com>
References: <33152.202.69.36.149.1186819159.squirrel@khimail.comsats.net.pk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=pj/oCgNSuuwBkDR26R1PduIy/FEFqUtwVqsn9FketadCz+JHleLSuPPfCr+2sA5ZEtpVan4qYUoDIHVzhNJ70O6Hp53s0d2VSWw6Il5cC3LYd/qbfY9gt6aMAJFXPycLZ0gDtY+m/Zl4ViJ84FgMBJAqcDxefpW6NZQ0EXS82wI=
In-Reply-To: <33152.202.69.36.149.1186819159.squirrel@khimail.comsats.net.pk>
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
Content-Type: text/plain; charset="us-ascii"
To: Ammad Shah <ammads@khi.comsats.net.pk>
Cc: netfilter@lists.netfilter.org

   you need ip_pptp_conntrack module enable.
   Look http://www.wlug.org.nz/PPTPConnectionTracking

Regards,

Sp0oKeR

On 8/11/07, Ammad Shah <ammads@khi.comsats.net.pk> wrote:
> Dear all,
>
> i am using linux as firewall and proxy server, having some problem
> regarding Microsoft VPN,
> my network users connect Microsoft vpn server. the problem is only one
> user is able to connect vpn, while othere can't do this at same time.
>
> if i restart firewall, then any one can connect on First come first
> server. but only one.
> so i clear all rules, and default policy to ACCEPT, and used this rule
>
> iptables -t nat -A POSTROUTING -i eth1 -s 10.0.0.0/24 -j MASQUERADE
> iptables -A FORWARD -s 10.0.0.0/24 -j ACCEPT
>
> i try this on 2.6(rhel 5) and 2.4 (rhel3)
>
>


-- 
=========================
     Rodrigo Ribeiro Montoro
BRConnection Development Team
       spooker@brc.com.br
    SnortCP / RHCE / LPIC-I
=========================

