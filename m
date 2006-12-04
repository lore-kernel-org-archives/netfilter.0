From: Frederik Deweerdt <deweerdt@free.fr>
Subject: T/TCP connections not NATed
Date: Mon, 4 Dec 2006 08:23:55 +0000
Message-ID: <20061204082355.GF3136@slug>
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

Hi,

We're trying to use a home brewed T/TCP stack in addition to Linux plain
SNAT. Everything works as expected, except for the first packet, which
is not NATed. Communication is as follows:

	C		S
1.	SYN*
2.	DATA
3.			SYN/ACK*
4.	ACK*
5.	REST_OF_COM*

[*] The packet is NATed


Our hypothesis du jour, is that packet #2 is not NATed because it is
not currently part of a connection from netfilter point of view. Hence
my questions:
- Does our hypothesis seem you reasonable?
	- If yes, is it possible to tell NAT to ignore the connection
	tracking informations, and NAT all the packets getting out of
	a given interface
	- If not, what do you reckon could be the cause for having the
	#2 packet not NATed?

Thanks,
Frederik

