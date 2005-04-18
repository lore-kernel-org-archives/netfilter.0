From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Mon, 18 Apr 2005 13:02:40 -0700
Message-ID: <1113854560.3544.215.camel@seberino.spawar.navy.mil>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
	<20050413211349.GA31336@bender.817west.com>
	<425DC2DA.7010608@riverviewtech.net>
	<20050417232709.GA28390@spawar.navy.mil>
	<1113782691.22084.23.camel@bodhittsatva>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113782691.22084.23.camel@bodhittsatva>
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
To: Thomas Jones <admin@buddhalinux.com>
Cc: netfilter@lists.netfilter.org

Thomas

Thanks for the reply.  Jason at beginning of this thread
surprised all of us by saying that Linux kernel
drops 127.0.0.1 address from NICs already!?!

No need to filter it out from Internet traffic!

Agreed?

Chris

On Sun, 2005-04-17 at 17:04, Thomas Jones wrote:
> On Sun, 2005-04-17 at 18:27, seberino@spawar.navy.mil wrote:
> > How allow just legitimate loopback traffic then?
> > 
> > Chris
> > 
> > On Wed, Apr 13, 2005 at 08:09:46PM -0500, Taylor Grant wrote:
> > > >allow traffic on the loopback interface unconditionally,  and allow the
> > > >linux routing code 'martian' checks to drop 127.0.0.0/8 packets received
> > > >'on the wire' as it does by default.
> > >
> > > I don't think this is such a good idea.  I could reconfigure my system such
> > > that it's loop back interface was not in the 127.0.0.0/8 network and set a
> > > route to the 127.0.0.0/8 network to be via your IP on the LAN.  Assuming
> > > that your system and my system were on the same LAN and subnet and we could
> > > ping each other I would be able to access your 127.0.0.1 address as your
> > > kernel would forward traffic to the loop back network in your system.
> > >
> 
> According to the TCP/IP specification this should not be an issue.
> 
> The loopback traffic outgoing response traverses the machine stack only
> as far as the network transport layer. Removing both the data link layer
> and physical layer and their appropriate protocols from the path of the
> data traffic.
> 
> Thus, this effectively negates the chance that any reply communication
> could be submitted to the OUTPUT queue. Of course, this is all in
> theory. I've never tried this process myself.
> 
> But, to answer your question Christian; the following rule will disallow
> packets with a source address of the loopback network coming from the
> internet side:
> 
> iptables -A INPUT -i $INTERNET_INTERFACE -s $LOOPBACK -j DROP
> 
> Where INTERNET_INTERFACE is usually "eth0". And LOOPBACK is the reserved
> loopback range of "127.0.0.0/8".
> 
> This entry should be placed along with other source address spoofing
> scenarios in your ruleset.
> 
> HTH.
> Thomas Jones
> 
> 


