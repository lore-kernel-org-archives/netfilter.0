From: Brad Chapman <kakadu_croc@yahoo.com>
Subject: Re: NAT only - No connection tracking
Date: Tue, 12 Nov 2002 16:36:05 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021113003605.54039.qmail@web40904.mail.yahoo.com>
References: <1037099676.12587.8.camel@hope>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037099676.12587.8.camel@hope>
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
To: Filip Sneppe <filip.sneppe@cronos.be>
Cc: netfilter@lists.netfilter.org

Mr. Filip,

--- Filip Sneppe <filip.sneppe@cronos.be> wrote:
> On Mon, 2002-11-11 at 20:21, Brad Chapman wrote:
> > 
> > Basically, if this person wants to do NAT, he has to do connection tracking as
> well.
> > LYSB, he doesn't have to run ctrack without NAT, but without ctrack the current
> > implementation of NAT in netfilter won't work. If there are other stateless NAT
> > kernel implementations available that attach to netfilter, then I am currently
> > unaware of them.
> > 
> Hi Brad & Antony,
> 
> There is one other way to do NAT without connection tracking - this is
> even possible on 2.2 kernels. There is some NAT functionality in the
> routing code (policy routing, advanced routing).
> 
> This is a form of NAT where only the IP addresses in the IP header
> are changed, no data inside the packet payload is inspected or changed.
> Also, there is no automatic retranslation of return packets, like with
> iptables.

*thunk*

Duh! I had forgotten about that, having never used it. Good call. Maybe the original
poster will be interested in this.

> 
> The syntax is a little different and takes some time to get used to;
> basically you get something like this:
> 
> ip rule add from 192.168.1.32/27 nat 10.1.1.32 prio 14000
> ip route add nat 10.1.1.32/27 via 192.168.1.32
> 
> to set up NAT rules.
> 
> For more info, see the iproute documentations. I can also recommend
> the book "Policy Routing with Linux" by Matthew G. Marsh, who is also
> a contributor on this list.
> 
> The book is being released online at http://www.policyrouting.org/,
> but is definately worth the buy.

> 
> Regards,
> Filip
> 

Brad


=====
Brad Chapman

Permanent e-mail: kakadu_croc@yahoo.com

__________________________________________________
Do you Yahoo!?
U2 on LAUNCH - Exclusive greatest hits videos
http://launch.yahoo.com/u2

