From: Aaron Lin <aaron@tg-embedded.com>
Subject: encapsulation scheme
Date: Wed, 03 Dec 2003 17:00:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070488856.2996.0.camel@jessica>
Reply-To: aaron@tg-embedded.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hey guys,
I'm writing a module to encapsulate IP packets and send them throught a
tunnel between the 2 end-points, the IP packets being passed include
those that are locally generated and that are forwarded from other
computer (who sends their packets to this PC to be tunneled).
My code seems to work fine with the packets that are generated locally,
although it doesn't seem to make a lot of sense.
Here's the set up of my program.

I register my module to listen to packets coming through the POSTROUTING
hook at my tunnel end-point (because I thought that hook would cover
both types of packets mentioned above, after the criteria is met, i do
the following :
- hook the packet back at LOCAL_OUT hook
- copy the old sk_buff to a new sk_buff and drop the old one
- add my outer ip header to the new sk_buff
- and finally do an ip_send( new_sk_buff ) to send it out again

The postrouting code i wrote can differentiate between the original buff
and the new buff to avoid infinite looping.

This scheme seems to work fine with the locally generated packets
(although it seems kinda weird), but always locks up my PC once it
started receiving packets that are forwarded.

PS: I use the tunnel endpoint PC as the gateway to the other PC wishing
to be tunneled.

Any input would be appreciated,
Thanks,
Aaron


