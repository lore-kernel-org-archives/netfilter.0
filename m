From: Brett Oster <boster@loadsys.com>
Subject: ipset question
Date: Fri, 10 Dec 2004 16:47:37 -0600
Message-ID: <1102718857.3550.27.camel@hammer.internal.platinumtel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I'm looking for a way to make my iptables rules more manageable, and so
I am attempting to use ipset.  However, I am not sure if it does what I
am trying to do.   I have many subnets that need to be SNATed
differently depending upon their destination.  As a test, I made two
iphash sets and loaded in one of my sets of sources and one set of
destinations.  However, when I try to apply the iptables rule, I get the
error:

iptables v1.3.0: Unknown arg `destination'

I am running 2.6.9 with the most current iptables, pom, and ipset from
Jozsef Kadlecsik's website
(http://people.netfilter.org/kadlec/ipset/install.html)

below is my test data:


-N source iphash --hashsize 1024 --probes 8 --resize 50 --netmask 24
-A sources 10.2.2.0
-A sources 10.2.3.0
-A sources 10.2.8.0
-A sources 10.2.7.0
-A sources 10.2.11.0
-A sources 10.2.4.0
-N destination iphash --hashsize 1024 --probes 8 --resize 50 --netmask
24
-A destination 10.2.254.0
-A destination 10.2.250.0
-A destination 10.2.6.0
-A destination 10.2.251.0
-A destination 10.2.249.0
-A destination 10.2.10.0
-A destination 10.2.14.0

iptables -t nat -A POSTROUTING -m set --set sources src -m set --set
destination dst -j SNAT --to-source <ipaddress>


I would appreciate any tips or pointers of what I've done wrong.

Brett


