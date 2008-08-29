From: "Alex Judd" <alex@skywire.co.uk>
Subject: Fixing TCP sequence approximation problems using iptables and tools
Date: Fri, 29 Aug 2008 18:21:42 +0100
Message-ID: <00e901c909fb$b52c9950$1f85cbf0$@co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-gb
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: 'Alex Judd' <alex@skywire.co.uk>

Hi list

My first post here so briefly Hi.

I wanted to see if anyone out there had any experience of using iptables and
tools to fix a vulnerability we have in the TCP of our Linux kernel which
according to our PCI evaluations leaves us open to TCP sequence
approximation hacking.

"TCP Sequence Number Approximation Based Denial of Service"

THREAT:
TCP provides stateful communications between hosts on a network. TCP
sessions are established by a three-way handshake and use random 32-bit
sequence and acknowledgement numbers to ensure the validity of traffic. A
vulnerability was reported that may permit TCP sequence numbers to be more
easily approximated by remote attackers. This issue affects products
released by multiple vendors.

Basically as far as I can see PF on OpenBSD has the ability to do this by
normalizing the TCP packets

Ref:
http://www.section6.net/wiki/index.php/Setting_up_a_Firewall_NAT_using_PF

# Normalizes packets and masks the OS's shortcomings such as SYN/FIN packets

# [scrub reassemble tcp](BID 10183) and sequence number approximation 
# bugs (BID 7487).
scrub on $extif reassemble tcp no-df random-id

Has anyone any experiences with this using a Linux based kernel to fix this?

Many thanks

Alex

Skywire | www.skywire.co.uk


