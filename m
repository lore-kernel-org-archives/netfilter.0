From: "james.Q.L" <shijialeeee@yahoo.ca>
Subject: Re: another iptables question
Date: Thu, 28 Nov 2002 03:50:25 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021128085025.92538.qmail@web14505.mail.yahoo.com>
References: <200211272111.26736.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211272111.26736.netfilter@newkirk.us>
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
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

[snip]

> > 3.the packet gets DNAT'ed,and all other requierd action are
> > taken,however,the packet is not SNAT'ed. so the same source
> IP
> > address is used on the packet.
> > # my question: what does it have to do with SNAT here?
> shouldn't
> > it see the source come from $INET_IP ?
> 
> This is where it gets more complicated.  If $LAN_BOX sends a
> packet to 
> $INET_IP that gets DNATted and forwarded to the local server,
> the reply from 
> that server will go DIRECTLY to $LAN_BOX since it recongnizes
> the client as 
> an IP that is local to it,

why it see the client from an local IP ? hasn't it been SNAT'ed
to the $INET_IP ?

I am bit confused how the internal machine request the
firewall's $INET_IP. i think the internal request gets SNAT'ed
so it has the $INET_IP after it goes out of the firewall(does
it?), then it finds the $INET_IP via DNS resolve, and come back.
am i right at this point? 
 
> through the 
> gateway.  The solution to this is to SNAT the DNAT.  What you
> do is DNAT the 
> packet as it enters the firewall so that it will be forwarded
> to the server 
> that handles it, even though it came in addressed to the
> firewall/gateway at 
> $INET_IP.  THEN you SNAT that same packet as it leaves the
> firewall, so that 
> the reply from the server will come BACK to the
> gateway/firewall.  On the 
> return trip the SNAT is reversed (so that the packet gets
> forwarded back to 
> the original requesting client) and then the DNAT is reversed
> (so that the 
> client sees it as returning from $INET_IP instead of the
> 'private' IP of the 
> actual server)
> > then later the author has the solution like this:
> > iptables -t nat -A POSTROUTING -p tcp --dst $HTTP_IP --dport
> 80
> > -j SNAT  --to-source $LAN_IP


i was thinking of the $LAN_IP as the ip of $LAN_BOX....

i have read your words couple times and it's still hard to
grasp. it's complicated as you mentioned. &^%*(

=====
/James.Q.L

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

