From: Roderik van Heijst <roderik@digicit.nl>
Subject: forwarding to an external ip
Date: Wed, 12 Jan 2005 18:09:26 +0100
Message-ID: <20050112170926.GA4744@digicit.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi there,

i spent the whole day (which sucks btw :( ) trying to figure out how to
forward 62.131.95.133:4321 (phex) to 131.155.228.4:1111 (orion). Quickly said, after 6
hours (which is too long IMHO) i got it to work. However, phex was just
for testing and i want it to work on 80.69.73.147 (boron) so i figured - if i
copied the complete setup of iptables at phex to boron, it should do the same. 

... Nopez. Honestly, I can't understand what's making the difference .. must be due to
different kernels, but this is user-space right .. should work the same?
I'm sorry if i sound frustrated, but i am.

iptables -F
iptables -t nat -F
iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 1111 -j DNAT --to
131.155.228.4
iptables -t nat -A POSTROUTING -p tcp --dport 1111 -j MASQUERADE
iptables -L
iptables -t nat -L

that's all i had to do on phex to get it working.
iptables -L, iptables -t nat -L and iptables -t mangle -L output exactly the same (phex & boron).

Now for the difference that i can spot which may have to do with this:
phex uses 2.4.20 whereas boron has 2.4.24. A subtle difference (at least that's what it
seems to me) is that phex preroutes things from ppp0 while boron should
do that from eth0, maybe that can be the problem? i don't see how, but
that doesn't surprise me anymore by now. I hope any of you can bravely
come up with some sort of answer that should push me into the right
direction of solving this .. well .. i don't know what it is. Aargh!

oh and happy newyear.

p.s. i'm not on this list, figured it's a little silly to subscribe for
one question, so please reply/cc/bcc to my address, which is
roderik@digicit.nl .. and many thanks in advance.

p.p.s. i noticed that
iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 1111 -j DNAT --to
:4444
does not do the same as
 iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 1111 -j DNAT --to
 127.0.0.1:4444
 when that box is directly addressed, which is another mystery for me..
 but that's probably how it should work.


