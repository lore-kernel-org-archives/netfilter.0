From: Vilmos Branyik <vbranyik@piopc.com>
Subject: NAT everything
Date: Thu, 28 Aug 2003 19:21:21 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <30E7B49F378ED711AC0F00E02917CD8B08B324@POLLY>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I can't seem to get this right and I'm hoping someone has the right answer.

I have 10 computers on a public network. They all need to connect to an NT
server (cringe) off that block of addresses and use all the services on it.
But everyone else needs to be blocked.

The NT server runs Exchange, Norton Anti Virus (Corp Edition), and has file
sharing turned on.

I've tried several different commands but no luck. Could everyone give me
the an IPTABLES command that redirects every port to another address but
only allows that from the local subnet.

Here are the ip addresses:

Public network - 200.1.17.0/27
Firewall/Router address:
200.1.17.10 eth0 external
192.168.1.1 eth1 internal net

Internal NT server - 192.168.1.254

Thanks for any help

Vilmos

