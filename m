From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables routing help
Date: Sun, 25 Jan 2004 08:57:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401250857.37939.Antony@Soft-Solutions.co.uk>
References: <CD650C0C-4EB3-11D8-8BD0-000A9577164C@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <CD650C0C-4EB3-11D8-8BD0-000A9577164C@hotmail.com>
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

On Saturday 24 January 2004 9:25 pm, William Knop wrote:

> Hello,
> My dsl provider has my house on several subnets (ips obtained via dhcp,
> along with a netmask of 255.255.255.0), so I have had to screw around
> with each machine to make sure local traffic doesn't flood the dsl
> modem. To remedy this, I've been trying to set up a firewall box to
> basically reroute those three subnets as local, but I'm finding it very
> difficult. It seems like every doc out there only addresses nat, which
> is definitely not what we want. I'd greatly appreciate some help
> accomplishing this.

This is not a netfilter question - in fact quite the opposite - it is an IP 
routing question, which netfilter will only help to interfere with.

All netfilter would do for you in a case like this is help to drop packets 
which would otherwise be routed.   Netfilter doesn't route packets - that's 
the job of the normal routing table.

Many times on this list a question is answered with "get your basic routing 
working first, then start implementing netfilter rules to drop things you 
don't want."   In your case the correct routing table entries will solve your 
problem - there's almost certainly no need for netfilter to be involved 
except as the perimeter firewall just before your networks hit the DSL.

I suggest you start with something like 
http://www.linux.org/docs/ldp/howto/Networking-Overview-HOWTO.html or 
http://www.linux.org/docs/ldp/howto/IP-Subnetworking.html - alternatively a 
standard IP book such as O'Reilly's "TCP/IP Network Administration" by Craig 
Hunt will tell you what you need.

The main thing is to make sure you don't have netfilter rules blocking what 
your routing table would otherwise allow between your local subnets.

Hope this helps,

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.


