From: "Peter Marshall" <peter.marshall@caris.com>
Subject: return
Date: Fri, 4 Jun 2004 10:39:24 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00f201c44a39$599a9230$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

I was just wondering if anyone here uses "return" in their rules .. I
understand what it is for .. just wondering if it is efficient to use.

ex.

-A Forward -s 192.168.200.5 -o eth1 -j subchain1
-A Forward -s 192.168.200.0/24 -o eth1 -j subchain2

-A subchain1 -d 200.200.200.200 --dport 1234 -j ACCEPT
-A subchain1 -d 200.200.300.300 --dport 4321 -j ACCEPT
-A subchain1 -j RETURN

-A subchain2 .......... blah blah blah ....

Or would you just write the rules different ?

Also, I was wondering is there a way to specify multiple source ip address ?

ex -s 192.168.200.5, 192.168.200.20 .....

Thank you,
Peter.


Peter Marshall, BCS
Network Administrator, CARIS
115 Waggoners Lane, Fredericton NB, E3B 2L4 CANADA
Phone:  (506) 458-8533 (Reception)


