From: "Bob Von Ilten" <bilten@hpsk12.net>
Subject: Need help with basic understanding of IPtables
Date: Mon, 25 Oct 2004 14:41:41 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <s17d10cf.018@hpsk12.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have just installed IPtables and have been reading as many FAQs as I
can stand, (which come to think of it may be part of my problem :-) ) at
any rate I have come to a basic understanding that the INPUT and OUTPUT
chains of the filter table refer to the following.  Please correct me if
I am wrong.  The INPUT chain refers to packets that are entering the
TCP/IP protocol stack from any interface not just the NIC or NICs
connected to the internet.  The OUTPUT chain refers to packets that are
leaving the stack for some destination either on the internet or on the
LAN.  The NAT table is used for any packets that are in transition
between INPUT and OUTPUT.

Bob Von Ilten
Director of Info Sys
Holt Public Schools

