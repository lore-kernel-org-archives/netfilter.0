From: Philip Craig <philipc@snapgear.com>
Subject: Re: netfiltering and ethernet bridging doesn't appear to work as
 advertised, help!
Date: Thu, 22 Jan 2004 10:10:07 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <400F14DF.9010402@snapgear.com>
References: <7A3B4AA360FDEF448F3390421FC8D731014BE786@coxhpexg.coxhp.com> <x7r7xt9s5r.fsf@speech.braille.uwo.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <x7r7xt9s5r.fsf@speech.braille.uwo.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kirk Reiser <kirk@braille.uwo.ca>
Cc: netfilter@lists.netfilter.org

Kirk Reiser wrote:
> I'm having a bit of trouble with this statement because to me it
> doesn't seem to make sense without the notion of the interface cards.
> If eth0 is our interface to the net and eth1 our interface to the lan
> then input to an interface makes sense because input to eth0 means one
> set of rules while input to eth1 means a totally separate set.  When
> you are talking about a virtual interface such as br0 how do input and
> output relate?  Is input meaning packets entering both real interfaces
> eth0 and eth1 or does input mean to the virtual device br0.  If the
> latter what direction is input verses output, the order you add the
> NICs?  I don't see how this can be.

The bridging patch introduces the concept of physical interfaces.  If you
still have eth0 as the Internet interface, and eth1 as the lan interface,
but have them bridged by br0, then a packet from the Internet to the lan
has a physical input interface of eth0, an input interface of br0, a
physical ouput interface of eth1, and an output interface of br0. The -i
and -o matches will match either the physical or 'normal' interface.
So any of the following will match this packet: -i eth0, -i br0, -o eth1,
or -o br0.  The -i eth0 and -o eth1 matches will be the most useful.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


