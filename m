From: David Cannings <lists@edeca.net>
Subject: Logging all packets going past an interface when masquerading
Date: Mon, 19 Jan 2004 18:41:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401191841.00917.lists@edeca.net>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

I've created a chain called COUNTER with rules that have no target.  It's 
purpose is to simply count packets as they go past interfaces.  The rules 
in it are created like so:

iptables -A COUNTER -i eth0

I send all packets from the chains INPUT and OUTPUT to this chain and the 
counters increment as desired.  This works absolutely fine.  However, the 
machine I am running this on is using masquerading.  If I also link to 
the COUNTER chain from FORWARD, like..

iptables -I FORWARD -j COUNTER

.. it appears that masqueraded packets are also accounted for.  Is this 
the case though?  By the looks of some crude tests, it seems that the 
packet counts/bytes are correct but I'd just like some confirmation that 
this is the case and I don't have to also use the PREROUTING/POSTROUTING 
in order to count packets coming from the LAN (eth0) and going out across 
my ATM link.

Thanks,

David
david [at] edeca [dot] net

