From: "HareRam" <hareram@sol.net.in>
Subject: DROP or REJECT
Date: Fri, 11 Oct 2002 21:45:27 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00e601c27141$69754060$7cfcc5cb@humanpc>
References: <00e301c270e7$09c5a7e0$7cfcc5cb@humanpc> <002d01c270fe$86ca3c80$7cfcc5cb@humanpc> <3DA696C3.5000508@iprimus.com.au> <200210111230.g9BCUlL19231@vulcan.rissington.net> <00b501c2712e$f88e39e0$7cfcc5cb@humanpc>
Reply-To: "HareRam" <hareram@sol.net.in>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Hi all

REJECT action tells tables to send back an ICMP message indicating that
you're REJECTing the packet.
DROPing will just DROP with no further action.

What is the Bandwidth will  use, if i keep on sending ICMP on big network
saying that
packets are REJECT.

which one i have to USE, recomendation will be more helpful

hare



