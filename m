From: Mark Atwood <mra@pobox.com>
Subject: Using mangle table to change source address, how?
Date: 04 Nov 2002 12:28:59 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <m3vg3d84fo.fsf@khem.blackfedora.com>
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
To: Netfilter <netfilter@lists.netfilter.org>


I have an interface eth1, with an IP address 192.168.23.100

I've configured eth1 to have a subinterface eth1:0, and
have given that subinterface an IP address 172.23.1.3.

There is a host on the segment that this interface is connected to
with an IP address of 172.23.1.2.

If I send packets to that host 172.23.1.2, the packets from me have a
source address of 192.168.23.100, not 172.23.1.3!

Can I use the mangle table to rewrite the source address?  If so,
what is the iptable command line?

Or is there an easier way?

-- 
Mark Atwood   | Well done is better than well said.
mra@pobox.com | 
http://www.pobox.com/~mra

