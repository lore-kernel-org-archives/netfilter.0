From: Unknown <unknown@unknown.invalid>
Subject: Re: Iptables and Kernel
Date: Mon, 12 Apr 2004 16:16:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <36070.9628942006$1081802745@news.gmane.org>
References: <407A27B2.4000101@rd.arkonnetworks.com> <200404121822.03874.Antony@Soft-Solutions.co.uk> <407AE8E8.7000102@rd.arkonnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <407AE8E8.7000102@rd.arkonnetworks.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Norman Zhang <norman.zhang@rd.arkonnetworks.com>, netfilter@lists.netfilter.org

On April 12, 2004 03:07 pm, Norman Zhang wrote:
> Antony Stone wrote:
> > On Monday 12 April 2004 6:05 pm, Norman Zhang wrote:
> >>I just downloaded 2.6.5, may I ask where should I check to see if h323
> >>modules are included? On www.netfilter.org, I see pom-20031219 and
> >>pomng-20040302. Is it safe to assume, that pomng includes pom?
> >
> > You might find the following postings from the archives relevant here:
> >
> > http://lists.netfilter.org/pipermail/netfilter/2003-December/049362.html
> >
> > http://lists.netfilter.org/pipermail/netfilter/2003-December/049310.html
>
> Thank you so much. From the postings, it looks like 2.6.x is still
> lacking some features that are available in 2.4.x. I'm setting up a
> firewall with NAT and hoping to able to do Netmeeting and MSN Instant
> Messenger. Would 2.4.x's netfilter patches sufficient to protect my LAN?
	
	I'm running 2.6.3. with iptables 1.2.9 and p-o-m-ng h323 patch -- they work
	for me -- but I'm referring to a home lan ond only one netmeeting seesioon 
	from the LAN  -- we haven't tried multiple sessions from inside the lan ... 
	either to the same netmeeting sessioon or to different ones.

		
	Alistair Tonner

>
> Regards,
> Norman

