From: "Patrick Ahler" <patrick@vikus.com>
Subject: stub forwarding filtering
Date: Wed, 5 Mar 2003 14:00:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFMEAOCAAA.patrick@vikus.com>
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
To: netfilter@lists.netfilter.org

I have a couple questions... I am using iptables as a firewall on a linux
machine(router) with 2 nic's. Everything on the internal network has an
internal ip. As it passes through the firewall(router) it is given a public
ip (stub network using dnat and snat along with some static routes in the
routing table). This is my first time building a firewall, so I am still
learning alot of the basics. Here are my questions.

1. I have 2 webservers behind the firewall. Is it possible on the firewall
to setup a rule that will allow port 80 to only be open to those ip's? Or
will that not allow other computers behind the firewall to browse the
internet? If so what will the rule look like?
iptables -A FORWARD ?????????? HELP =)

2. Also, because I'm routing/forwarding packets through 2 NIC's(eth1 public,
eth0 internal), is it possible to have iptables to tell where the packet is
coming from? ie. if I wanted to disable all incoming traffic on the FORWARD
chain (except for allowed rules), but allow all outgoing traffic on the
FORWARD chain. How would I do this?

Thanks for all the help,
Patrick


