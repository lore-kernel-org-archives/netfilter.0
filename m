From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: missed packets
Date: Tue, 2 Mar 2004 22:03:10 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403030603.i23632fG009347@server5.bandwidthco.com>
References: <Pine.GSO.4.58.0403022326400.27317@unix.cs.tamu.edu>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0403022326400.27317@unix.cs.tamu.edu>
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
To: 'Xinwen Fu' <xinwenfu@cs.tamu.edu>, netfilter@lists.netfilter.org

If all these machine are on the same subnet, connected by a hub, then there
is no need for the packets to go through 192.168.0.2 because they do not
require routing.  Consequently, they cannot be processed by the firewall.
The flow is this:  192.168.0.1 -> HUB -> 192.168.0.3. 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Xinwen Fu
Sent: Tuesday, March 02, 2004 9:27 PM
To: netfilter@lists.netfilter.org
Subject: missed packets

Hi,
	I have three machines in the same subnet (i.e., 192.168.0.1,
192.168.0.2 and 192.168.0.3). The three machines are collected by a hub.
So they can communicate with each other directly.

	Now 192.168.0.1 wants to send a packet to 192.168.0.3. I use
"iptables -t mangle -A OUTPUT -j QUEUE"
to forward the packet to the user space, where a program changes the
destination of this packet to 192.168.0.2. Of course, I change checksum
accordingly here and in later steps.

	When 192.168.0.2 receives the packet, I use iptables -t mangle -A
PREROUTING -j QUEUE to forward the packet to the user space, where the
destination of the packet is changed to 192.168.0.3.

	But I could not see any packet sent out by 192.168.0.2 and
192.168.0.2 does receive the packet from 192.168.0.1.

	What is the possible problem?

	Thanks!

Xinwen Fu



