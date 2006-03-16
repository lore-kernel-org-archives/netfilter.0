From: Gaurav Sharma <gaurav@interacesso.pt>
Subject: Re: calculate "new connections per second" (nfcan: addressed to
	exclusive sender for this address)
Date: Thu, 16 Mar 2006 11:08:44 +0000
Message-ID: <200603161108.44976.gaurav@interacesso.pt>
References: <200603151513.08287.gaurav@interacesso.pt>
	<20060315233244.GI31570@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060315233244.GI31570@salty>
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
To: netfilter@lists.netfilter.org


Thanks for the reply Jim.

I am using the ip_conntrack module to mark connections on a linux bridge to 
shape traffic. Sometimes if there is a DOS attack the ip_conntrack table 
overflows and the kernel starts dropping packets.  I want to measure the rate 
at which the connections are being made and being entered in the ip_conntrack 
table so if there is a spike in the rate I will know that there is a DOS 
attack going on.  I hope you can now understand my situation. I you need more 
information please let me know.

Appreciate your help.

Regards,
Gaurav.

On Wednesday 15 March 2006 23:32, Jim Laurino wrote:
> On 2006.03.15 10:13, Gaurav Sharma - gaurav@interacesso.pt wrote:
> > Hello,
> >
> > I am trying to find out a way to calculate
> > the rate of "new connections per second"
> > for the ip_conntrack module.
> > What would be a good approach for this problem?
>
> Are you asking how to determine
> the time each connection is established
> or are you asking, given this data,
> how to estimate this rate.
>
> Can you explain how you want to use the measurement?

