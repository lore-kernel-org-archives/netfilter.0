From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: DROP or REJECT?
Date: Sun, 20 Nov 2005 13:33:45 -0500
Message-ID: <000001c5ee00$f8343970$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

For blocking various attacks on ports 22 and 80,
I have been using:
   -j REJECT --reject-with icmp-host-unreachable
To minimize future attempts, is this best, or is
there a better idea, such as DROP?
Thanks for your advice,
Mike.
--
Michael D. Berger
m.d.berger@ieee.org 



