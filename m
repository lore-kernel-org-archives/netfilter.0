From: "dravya" <dravya@magma.ca>
Subject: How do I masquerade based on the interface???
Date: Wed, 25 Aug 2004 13:46:06 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408251746.i7PHk6fp009651@webmail1.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Netfilter mailing list <netfilter@lists.netfilter.org>


Hi all,

I know that Masquerade makes the outgoing packet with the src "ip address" of the link it
is going out on. BUT is there a way to specify the actual interface it should go out on.

for example, if there is ppp0 and ppp1, I want to be able to send all ICMP packets through
say ppp0. 

Basically I want all ICMP packets to go through one interface, don't care which one...

What kind of rules will I need?

Thanx alot guys,
any suggestions are appreciated,

Dravya

