From: prabha <prabha@multitech.co.in>
Subject: Logging packets with original address
Date: Wed, 03 Mar 2004 14:40:09 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4045A0F1.F7366A69@multitech.co.in>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi
    I want to log some packets in the INPUT and FORWARD chains, but with
the
original address of the packets. (ie) with the destination address
before any DNAT
rule has been applied on the packet in the PREROUTING chain.
    When the packet comes to the INPUT / FORWARD chains, it will be
after any
DNAT has been applied. I do not want the NATted address to be present in

the logs, but the original address as the received interface saw it. Is
this possible?

Regards
Prabha


