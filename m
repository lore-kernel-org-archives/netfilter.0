From: Sanjay Arora <skpobox@hotpop.com>
Subject: Re: Cons?: Directed Pinholes
Date: 23 Aug 2004 01:08:18 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093203497.2592.3.camel@Sewak.Asr.Lan>
References: <1093194886.16081.84.camel@Sewak.Asr.Lan>
	 <200408221855.36768.Antony@Soft-Solutions.co.uk>
	 <1093199079.2283.22.camel@Sewak.Asr.Lan>
	 <200408222004.59916.Antony@Soft-Solutions.co.uk>
Reply-To: skpobox@hotpop.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408222004.59916.Antony@Soft-Solutions.co.uk>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Mon, 2004-08-23 at 00:34, Antony Stone wrote:

> > since my dmz has private address space 192.168.x.x, IPs from there are
> > not routable to anyone outside my network,
> 
> Huh?   So how do machines on your DMZ reply to external connections?   And if 
> there aren't any external connections, what are they doing in a DMZ?   I'm 
> puzzled.   You must have some NAT going on, or it wouldn't be a DMZ...

Yes. I have an IPcop box with three network cards, acting as firewall,
transparent proxy using NAT & gateway. One public IP address, two
non-routable 192.168.x.x segments. Port forwarding for DNS, SMTP, POP3 &
HTTP.

Thank you. You have been very helpful.

Best regards.
Sanjay.



