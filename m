From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Strange log entry ...
Date: Mon, 8 Jul 2002 13:15:16 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708171516.GS25368@cannon.eng.us.uu.net>
References: <002d01c22688$cfa8a920$0a01a8c0@ed> <1026138591.27153.77.camel@rayw> <20020708143656.GR25368@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020708143656.GR25368@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org
Cc: Raymond Leach <raymondl@knowledgefactory.co.za>, blacknet@simplyaquatics.com

On Mon, Jul 08, 2002 at 10:36:56AM -0400, Ramin Alidousti wrote:

> On Mon, Jul 08, 2002 at 04:29:51PM +0200, Raymond Leach wrote:
> 
> > On Mon, 2002-07-08 at 16:07, Ed Street wrote:
> > > Hello,
> > > 
> > > 
> > > Looks like station 10.0.0.19 on eth2 tried to ping 199.181.167.201 and
> > > it was droped.
> > > 
> > I've checked the process list on 10.0.0.19 and also restarted it just to
> > make sure, and there is nothing that is trying to ping anywhere.
> > 
> > Isn't ICMP CODE 0 TYPE 0 a reply? Doesn't this log entry represent
> > 10.0.0.19's reply to an echo request?
> 
> Don't you have any backdoor?? If not, then 10.0.0.19 might be replying
> to a spoofed ping from the inside...

Second thought. It probably isn't due to a backdoor as this backdoor
would need to do the same natting that you're doing on your firewall.
So it'd narrow down to the spoofed ping from the inside.

Ramin

