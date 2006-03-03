From: "T. Horsnell" <tsh@mrc-lmb.cam.ac.uk>
Subject: states and UDP
Date: Fri, 3 Mar 2006 14:34:56 +0000 (GMT)
Message-ID: <E1FFBMv-0016UD-1H@alf1.lmb.internal>
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
To: netfilter@lists.netfilter.org

Am I right in thinking that the stateful capabilities
of iptables (NEW/ESTABLISHED/RELATED etc) only apply to
tcp connections? If not, how are these states defined for
udp?

iptables doesnt complain if I add a rule containing
'-p udp -m state --state NEW'

Thanks,
Terry.

