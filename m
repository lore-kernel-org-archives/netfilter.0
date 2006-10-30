From: Marc Cozzi <cozzi@nd.edu>
Subject: Packet mangle and re-directing
Date: Mon, 30 Oct 2006 11:02:43 -0500
Message-ID: <F163413C9250D211A55C0060979D5280014F34A2@hertz.rad.nd.edu>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am using RH ESr4 configured as a bridge device with
two Ethernet cards. Bridging and IPTABLES works
well for filtering and blocking. No NAT is being used
on this box.

I'm not sure I understand the IPTABLES mangle interaction
with NAT or forwarding.

What I would like to do is the following:
an unregistered user plugs their laptop into the Ethernet and
their MAC address is not recognize by the IPTABLES filter rules,
they try to open any default web page outside of the controlled area,
the destination address: port 80, should be re-directed.

Redirect them to a local web page clearly informing them what
needs to be done in order to use their laptop on the local LANs
and who to see.

Is this possible?

Thanks for any help,

  --marco

