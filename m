From: "Jean-Francois Nadeau" <jna@microflex.ca>
Subject: SNAT, packet mangling and QoS Problem
Date: Sun, 5 Jan 2003 13:37:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IMELJGMMLMCOALNNLBFCKEDECFAA.jna@microflex.ca>
Reply-To: <jna@microflex.ca>
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

Hi,

Let say you have a proxy behind a firewall on your LAN.
You use SNAT or MASQUERADING to give Internet access to your proxy.
You also want to do some Qos (CBQ + U32) to shape traffic coming from the
net to the proxy.

The goal is to mark a packet returning from an exernal host to the proxy.

The OUTPUT chain can not be used to mangle packets as they were not
generated locally.
The FORWARD and POSTROUTING chains cant be used with the mangle table.
The PREROUTING chain offers no match as the packet is targetted at the SNAT
IP.

The problem is: I can not mark a packet in order to match a shaping class.

Anyone has an idea on how to do the trick ?

Any reason why the FORWARD chain cant be used with the mangle table ?

Regards,

Jeff



