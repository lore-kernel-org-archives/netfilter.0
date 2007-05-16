From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: RE: is it possible to block ip packets that contains experimental
 tcp options ?
Date: Wed, 16 May 2007 20:04:29 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705162002420.9019@yvahk01.tjqt.qr>
References: <F163413C9250D211A55C0060979D5280016AB33A@hertz.rad.nd.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F163413C9250D211A55C0060979D5280016AB33A@hertz.rad.nd.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Cozzi <cozzi@nd.edu>
Cc: netfilter@lists.netfilter.org


On May 16 2007 08:18, Marc Cozzi wrote:
>
>Not sure what you mean by "experimental" however, there are
>some conditions of flags that should never occur on the
>network. These can be trapped with rules similar to the following.
>
>iptables -A BLOCKED -m state --state INVALID -j LOG-AND-DROP
>iptables -A BLOCKED -p tcp --tcp-flags ALL ALL -j LOG-AND-DROP
>iptables -A BLOCKED -p tcp --tcp-flags ALL NONE -j LOG-AND-DROP

Uhm, I think it is valid for a packet to carry no flags at all.
(Regular data packet without TCP Selective ACK)

Check up on http://jengelh.hopto.org/p/chaostables/ to see how
to block evil stuff.


	Jan
-- 

