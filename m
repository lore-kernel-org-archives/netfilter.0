From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Logging MAC
Date: Fri, 21 May 2004 21:47:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405212147.00410.Alistair@nerdnet.ca>
References: <5390820828.20040521103958@alternativa.com.br> <9396093968.20040521120751@alternativa.com.br> <200405211625.47373.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405211625.47373.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

On May 21, 2004 11:25 am, Antony Stone wrote:
> On Friday 21 May 2004 4:07 pm, Marcelus Trojahn wrote:
> > > What version of netfilter are you using?
> >
> > 1.2.10 (CVS one)
>
> Hm - that's more recent than anything I've used.   I'd be a bit surprised
> if the log output format has changed to exclude MAC addresses, but it's
> possible.   I suggest you check the changelogs for recent versions of
> netfilter, and perhaps ask on the developers' list whether this change has
> in fact happened.
>
> Is anyone else here aware of such a change in the log output format?
>
	/me HMmmmms.
	
	I note that iptables doesn't log mac addresses it cannot see (i.e. not 
directly connected) ... in 1.2.9x (as I and Antony are running) you still see 
the MAC= element.  Perhaps in CVS the logging function drops this entry if 
MAC="" ?? -- that would indicate that someone on the wireless is being 
hijacked as a proxy?? *ugh*

	(Just an off the top o me head thought)

	Alistair


> Regards,
>
> Antony.

