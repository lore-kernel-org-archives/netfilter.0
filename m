From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP masquerading and second ISP line questions
Date: Sun, 16 May 2004 19:54:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405161954.15392.Antony@Soft-Solutions.co.uk>
References: <E1BPPQK-0003pm-At@vishnu.netfilter.org>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1BPPQK-0003pm-At@vishnu.netfilter.org>
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

On Sunday 16 May 2004 6:27 pm, Ryan Hatch wrote:

> > It's generally recommended that if you have a static IP address (which
> > you appear to have), then you use SNAT instead of MASQUERADE, however
> > this is purely for a (very modest) performance improvement; it doesn't
> > change the functionality in any way.
>
> So, in order to do this sort of static NATing, what sort of command would I
> use to to replace the -A POSTROUTING -o eth0 -j MASQUERADE?  Would
> sensibily, it seems like I should do something like this:
>
> -A POSTROUTING -s 192.168.0.0/24 -j SNAT -o eth1 --to-source 1.2.3.5
>
> Is that more or less what you were talking about?

Exactly.

> Yeah, I actually do have a bunch of statics.  I don't think that my
> SecureClient problem is a function of the IP addresses.  I think that it
> has to do with NAT.  From what I can tell, it is a common problem that many
> IPSec VPN clients have when working behind firewalls/routers using
> masquerading NAT. Its seems that the common workaround is to do UDP
> encapsulation--something that my particular client does not support.  I
> might end up trying to do 1:1 on it.

I'm not aware of this "common problem", however I only use IPsec (through NAT) 
in tunnel mode between networks, not in transport mode with a client-gateway 
arrangement.

> > Yes.   Set up another route using the iproute2 tools available from
> > http://lartc.org - for what you want, the best solution is probably to
> > MARK the packets you want to go up the cable modem in netfilter, and then
> > route the marked packets with the appropriate iproute2 tables.
>
> Yeah, I've looked there....it seems like a slightly complex process.
> Perhaps a project for next weekend!

Yes.   It looks slightly complex - but it isn't.   You almost certainly have 
all the tools you need already on your system (you just never typed the "ip" 
command before...)

Read about it, try it, and you'll find it's a lot easier than you think :)

Regards.

Antony.

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the list;
                                                           please don't CC me.


