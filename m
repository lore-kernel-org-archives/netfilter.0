From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: delay
Date: Fri, 31 Oct 2003 16:44:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031031214426.GA31510@cannon.eng.us.uu.net>
References: <1067626591.1451.21.camel@pauloric.intranet> <20031031191507.GC30565@cannon.eng.us.uu.net> <1067634823.1430.40.camel@pauloric.intranet>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1067634823.1430.40.camel@pauloric.intranet>
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
Content-Transfer-Encoding: 7bit
To: Paulo Ricardo Bruck <pauloric@contato.com.br>
Cc: netfilter@lists.netfilter.org

On Fri, Oct 31, 2003 at 07:13:44PM -0200, Paulo Ricardo Bruck wrote:
> > > 
> > > c) iptables -A POSTROUTING -o eth2 -j SNAT --to-source 192.168.1.1
> > > 
> > > 
> > > What happens:
> > > 
> > > - all desktops ( M$windows) access webmail and email w/ no problems, but
> > > if I insert rule c) above it causes a delay when any desktop hit
> > > get/post e-mail in Outlook and it takes +- 40 seconds to "connenct".
> > 
> > Let me not ask you why you have rule (c). 
> c) I insert because we have in DMZ a IIS and as far as I known I could
> protect it putting PREROUTING rules.... who knows??? If someone invade
> IIS at least I'll be protecting LAN changing their IP ....80)

And changing their IP to 192.168.1.1 protects you, how?

> > But in general a long delay
> > is most of the time related to a faulty or non-existent reverse DNS.
> > But in case of SMTP it also might have something to do with ident
> > being dropped...
> maybe it can help: 
>  iptables -N AUTH
> iptables -A FORWARD -d $LAN -p tcp --dport 113 -j AUTH
> iptables -A FORWARD -d $REDEDMZ -p tcp  --dport 113 -j AUTH
> iptables -A AUTH  -j REJECT -p tcp --reject-with tcp-reset
> 
> As you can see I'm rejecting ident.... Is that the problem ??

Try tcpdump and see what is happening. I'm not sure but some of the
--reject-with options didn't do their job correctly (AFAICR).

Ramin

