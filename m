From: John Mathey <jmathey@attbi.com>
Subject: using iptables and masquerade to change IP in data portion
Date: Thu, 27 Mar 2003 10:56:18 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030327104706.01c2fff8@mail>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,
I don't even think this is possible, but I have an application which I 
believe is embedding the source IP address in the data portion of the 
packets. The masquerading is doing it's job and modifying the source IP on 
the way out, but that is only the header portion of the packet. Are there 
any utilities out there that will allow me to parse the the data portion of 
the packet for IP addresses and replace them with the masqueraded IP? I 
believe I may be able to write something myself to do it, but before I head 
down that path, I thought I'd see if anyone else had run into this? The 
problem is that when the recipient receives this, ( this is a proprietary 
application), he pulls the senders IP out of the data portion, not the 
header. Also, what utilities are available to dump the packet completely, 
including the data portion? Something like tcpdump would be nice, just for 
udp?

My Network:

------------------------------- 
-----------------------------------------------------------
|                       |                         | 
eth0                                        |
|                       |---------------------------->| 
192.168.1.1                             |
|    192.168.1.0/24    |                          |             N A 
T     eth1          |
|                       |                         | 
    12.238.44.52     | ---------------------------> INTERNET
------------------------------- 
-----------------------------------------------------------

Thanks in advance
John



