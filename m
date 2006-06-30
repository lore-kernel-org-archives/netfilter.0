From: Ramen Sen <ramen@intnetsystems.com>
Subject: per machine SNAT
Date: Fri, 30 Jun 2006 14:03:28 +0100
Message-ID: <44A52120.7020206@intnetsystems.com>
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

Hi all,

I'm hoping someone might be able to point me in the right direction.

I have a large number of machines (potentially > 65,000) that I need to
be able SNAT to particular addresses for particular machines, onto a
different network.

Essentially I'm trying to achieve a dynamic DHCP -> fixed address
mapping onto a different network for logging and filtering based on ip
address.  (The easiest way would be to do away with dynamic DHCP but I
unfortunately do not have that option.  Also I will need to map
different networks onto the same network, which also negates the use of
static DHCP option.)

One way to do this is to write a custom rule for each machine, eg:

Chain POSTROUTING (policy ACCEPT)
target 	prot	opt 	source		destination
SNAT 	all 	--	192.168.100.50	anywhere	to: 10.0.0.1
SNAT 	all 	--	192.168.100.17	anywhere	to: 10.0.0.2
SNAT 	all 	--	172.16.45.18	anywhere	to: 10.0.0.3
...etc...

That's ok for a small number of machines, but performance obviously
drops off quickly for large numbers of rules.

I looked at using ipset, but this does seem to be able to be used in
this kind of case.

Also, unfortunately there is no algorithmic mapping in this case - the
information for the mappings will be stored in a database that will be
used to populate the rules.

Can anyone suggest a possible solution?  I am willing to write my own
GPL'd kernel module (probably based on another that is part way there -
e.g. ipset) if that is the answer, but before I throw my effort into
that, I'm hoping that someone else might have an idea.

regards
Ramen Sen


