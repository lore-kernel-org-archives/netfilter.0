From: Dominic Iadicicco <sctylib2004@yahoo.com>
Subject: RE: Can anyone tell me how to do this?
Date: Thu, 23 Sep 2004 11:26:56 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040923182656.88541.qmail@web51307.mail.yahoo.com>
References: <1095961688.6715.35.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095961688.6715.35.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

Here is Samuel's response


> > $> iptables -t filter -A INPUT -i eth1 -d 10.0.0.1
> > -m tcp -p tcp --dport
> > 22 -j ACCEPT

this allows connections to pass an INPUT filter rule
with destination 
IP
10.0.0.1 and destination port 22 (TCP).

that wasn't really what you were asking for, but may
be of some use to
you in another situation...

> > $> iptables -t nat -A PREROUTING -i eth1 -d
10.0.0.1
> > -m tcp -p tcp --dport
> > 22 -j DNAT --to-destination 172.16.12.130:22

think about what the word PREROUTING means.  it means
that before this
linux host every makes any layer 3 decision about this
packet at
all--we're going to modify it.  once this rule is
applied--the linux
host will never ever see a packet that has a
destination IP of 10.0.0.1
in the context of this connection.  the destination IP
is
172.16.12.130.  as such, any filter rules applied
later in the stack
will have to accommodate 172.16.12.130, not 10.0.0.1.

if you're using this as a learning experience (and i
hope this is on a
test machine); i recommend LOG-ing everything you can,
break things at
will, figure out why they broke, and how to fix them.

and i never get tired of pimping this:

http://iptables-tutorial.frozentux.net/iptables-tutorial.html

HTH...
--- Jason Opperisano <opie@817west.com> wrote:

> On Thu, 2004-09-23 at 13:28, Dominic Iadicicco
> wrote:
> > it didn't work
> >  
> > 
> >   Thank you for the input though. 
> > 
> > 
> > Dom
> 
> hmmm...i never got Samuel's response...
> 
> a good learning exercise for you would be to figure
> out why it doesn't
> work...
> 
> > --- Samuel Daz Garca (ArcosCom)
> > <samueldg@arcoscom.com> wrote:
> 
> [ snip]
> 
> > > $> iptables -t filter -A INPUT -i eth1 -d
> 10.0.0.1
> > > -m tcp -p tcp --dport
> > > 22 -j ACCEPT
> 
> this allows connections to pass an INPUT filter rule
> with destination IP
> 10.0.0.1 and destination port 22 (TCP).
> 
> that wasn't really what you were asking for, but may
> be of some use to
> you in another situation...
> 
> > > $> iptables -t nat -A PREROUTING -i eth1 -d
> 10.0.0.1
> > > -m tcp -p tcp --dport
> > > 22 -j DNAT --to-destination 172.16.12.130:22
> 
> think about what the word PREROUTING means.  it
> means that before this
> linux host every makes any layer 3 decision about
> this packet at
> all--we're going to modify it.  once this rule is
> applied--the linux
> host will never ever see a packet that has a
> destination IP of 10.0.0.1
> in the context of this connection.  the destination
> IP is
> 172.16.12.130.  as such, any filter rules applied
> later in the stack
> will have to accommodate 172.16.12.130, not
> 10.0.0.1.
> 
> if you're using this as a learning experience (and i
> hope this is on a
> test machine); i recommend LOG-ing everything you
> can, break things at
> will, figure out why they broke, and how to fix
> them.
> 
> and i never get tired of pimping this:
> 
>
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> 
> HTH...
> 
> -j
> 
> -- 
> Jason Opperisano <opie@817west.com>
> 
> 
> 



		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail 

