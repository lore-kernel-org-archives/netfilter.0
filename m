From: Robert Kropiewnicki <phantomnj@gmail.com>
Subject: Firewall for network without NAT
Date: Fri, 30 Jul 2004 10:52:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <35772c3a04073007527df116b7@mail.gmail.com>
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

Hello all,

I am in the process of learning iptables.  Progress is slow but
steady, however there is one thing that continues to vex me and it may
simply be a problem of terminology with regards to finding help.

I'm looking to eventually replace a couple of firewall machines with
Linux boxes running iptables.  For one of the firewalls, the network
it protects consists of machines that all have real-world IP
addresses.  Given the nature of the network and its usage, I am cannot
institute NAT on the network.

Unfortunately, the difficulty I'm running into is that every tutorial
I can find has focused on using NAT.

Can someone guide me to the specific rules I need, whether by posting
them here or pointing me to a tutorial, in order to provide firewall
services for a network consisting purely of publicly addressable IP's?

Regards,
Robert Kropiewnicki

