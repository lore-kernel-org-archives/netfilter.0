From: Duane Cloud <cloud@cray.com>
Subject: Question about dynamically updating SNAT rules
Date: Mon, 11 Nov 2002 14:33:34 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211112033.gABKXYn04151@kumo.us.cray.com>
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
To: netfilter@lists.samba.org

Hello,

I'm working on a project which is attempting to cut a TCP connection
into 2 parts.  The following represents my "intended behavior":

  Connection request's source:       SA/SP
  Connection request's destination:  DA/DP

I've got a REDIRECT rule which sends connection requests to a program
running on a Linux box, so when the request comes in, the connection
that gets established (from the Linux box's perspective) is:

  Local address/port                 IA/IP
  Foreign address/port               SA/SP

The IA/IP is where my program is executing...

This program then executes a system call to obtain the DA/DP, opens
another socket, enters an iptables rule to do SNAT so that DA/DP sees
packets with the original requestor's SA/SP, and then does a connect()
to DA/DP.

From SA's perspective, the connection looks like:

  Local address/port                 SA/SP
  Foreign address/port               DA/DP

From DA's perspective, the connection looks like:

  Local address/port                 DA/DP
  Foreign address/port               SA/SP

But from the Linux box's perspective, in between these to hosts, it
is really 2 connections:

  Local address/port                 IA/IP
  Foreign address/port               SA/SP

  Local address/port                 xA/xP
  Foreign address/port               DA/DP

Where "xA/xP" is the address/port bound to the newly created socket,
and is intended to be translated to SA/SP.

For the most part, this all works...But on occassions the iptables
rule gets added but the connect() goes out to lunch.  The connection
from the Linux box's perspective stays in SYN_SENT, but tcpdump shows
no traffic going out the target interface.

I'm wondering if there is a better way to handle this or whether
dynamically adding rules is the only way to accomplish it.  And if
so, if there are any know problems when executing "iptables -t nat ..."
on the fly.

Any help/information/etc would be greatly appreciated.  If there is
another method for asking questions or obtaining information, please
direct me as appropriate.

Thank you,
Duane Cloud

