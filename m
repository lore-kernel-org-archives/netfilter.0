From: "Alec Matusis" <matusis@yahoo.com>
Subject: RE: now to increase ip_conntrack_max in 2.6.28?
Date: Tue, 28 Jul 2009 00:09:20 -0700
Message-ID: <012301ca0f52$5411d470$fc357d50$@com>
References: <010b01ca0f4c$50596f10$f10c4d30$@com> <20090728085320.6046d2ed@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090728085320.6046d2ed@catlap>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Thank you Marek, in Ubuntu 9.04 server edition nf_conntrack module
apparently is not loaded by default. I wonder why... What confused me was
that iptables rules actually worked, so I thought the module must have been
loaded.
I loaded it, and the file appeared.

> -----Original Message-----
> From: Marek Kierdelewicz [mailto:marek@piasta.pl]
> Sent: Monday, July 27, 2009 11:53 PM
> To: Alec Matusis
> Cc: netfilter@vger.kernel.org
> Subject: Re: now to increase ip_conntrack_max in 2.6.28?
> 
> Hi Alec,
> 
> >On 2.6.28 (ubuntu 9.04) the entire /proc/sys/net/ipv4/netfilter
> >directory is missing. Moreover,
> 
> Make sure you have nf_conntrack loaded. It you do, then file you're
> looking for is here:
> /proc/sys/net/nf_conntrack_max
> 
> Cheers,
> Marek Kierdelewicz

