From: guillaume <guillaume.riviere@hcm.vsl-vn.com>
Subject: 2 ISP NAT configuration
Date: Thu, 29 Jul 2004 17:26:54 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4108D0EE.2070400@hcm.vsl-vn.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dear All netfilter users and developpers,

This software is an amazing software,
We are are very happy of this solution
for our office.

Now, I need some help to improve our network:

Our office is based in Vietnam, and in this country
(for the moment) all internet connections are unstable.

We currently use an ISP with a (slow) connection, but
providing real static IP address (6). We want to add a second ISP
to our office with non static IP Address. They provide us also a
modem/router for NAT.

We already install a GNU/Debian Router with netfiler support (2.6 kernel)
in order to manage our first ISP link.

We would like to add a network card in this router and "loadbalance"
our internet connection between those two ISPs.

The problem is that some of our internal IP need to be link to
a real external IP on the first provider only (For VPN connections).

Is it possible with netfilter to link some internal IP to a "load 
balancing" between 2 ISPs and some other on just one of those ISP ?

Is there a possibility to detect a "down" line and to use automatically 
the second line for all our internals IP ?

How can I manage the differents bandwith with "load balancing" ( I mean, 
my first ISP average is something around 64 kbps and my second is 512 
kpbs: How can I said to net filter 20% on this line and 80% on this line)

Is there How to or Dosumentation for this on 2.6 kernel ?

Thank you in advance for your help,

Guillaume

 

