From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Transparent proxy question
Date: Mon, 15 Mar 2004 10:57:13 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403151057.13169.Antony@Soft-Solutions.co.uk>
References: <40556EE6.6040809@stupar.homelinux.net> <200403151036.00538.Antony@Soft-Solutions.co.uk> <405589BC.70703@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <405589BC.70703@stupar.homelinux.net>
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

On Monday 15 March 2004 10:47 am, Sasa Stupar wrote:

> Antony Stone pravi:
>
> > > $IPT -t nat -A POSTROUTING -o $INIF -s $INNET -d 192.168.10.10 -j SNAT
> > > --to 192.168.10.111
> > >
> > > Is there something to add or change here?
> >
> > Yes.   Remove the POSTROUTING rule, because it is specifically changing
> > the source address of all packets sent to the proxy server to be that of
> > the firewall.
>
> Not good. Now my transparent proxy doesn't work anymore. :(
> What's the catch?

1. Now that it isn't working, do you get any errors in your proxy log file, or 
does it think there are no requests?
2. What source IPs does your proxy server allow access for?
3. Does the proxy server know how to route back to the clients?
4. Do you have a suitable ESTABLISHED,RELATED rule on your firewall to allow 
back the replies?   (I expect so, but you didn't post your full ruleset 
earlier, so I can't be sure...)
5. Where are the clients on the network in relation to the firewall and the 
proxy server (please don't tell me they're on the same subnet as the 
proxy...?)

Regards,

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.


