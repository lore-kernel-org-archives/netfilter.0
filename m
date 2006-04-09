From: Jeroen Elebaut <jeroen@elebaut.com>
Subject: Re: NATed packets only enter the default routing table
Date: Sun, 9 Apr 2006 15:56:02 +0200
Message-ID: <200604091556.02586.jeroen@elebaut.com>
References: <20060408194058.71fa3e09.mailinglists@lucassen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060408194058.71fa3e09.mailinglists@lucassen.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
i had a similar problem with our setup. The problem is i think that the 
routing decision on the linux box is made before the address in the packet is 
changed back to 1.2.3.3. So it doesn't use the source policy routing entry. I 
solved this by using the connmark module from iptables and then do routing 
based on the mark. The following should work in your setup:

iptables -t mangle -I PREROUTING -m conntrack --ctstate ESTABLISHED,RELATED -j 
CONNMARK --restore-mark
iptables -t mangle -I PREROUTING -i eth1 -m conntrack --ctstate NEW  -j 
CONNMARK --set-mark 1

ip rule add fwmark 1 lookup eth1_up


This will route everything that entered via eth1 back via eth1.

Greetings,
jeroen

