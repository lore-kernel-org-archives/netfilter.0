From: "Allan Kissack" <lists@kissack.freeserve.co.uk>
Subject: iptables from cgi script
Date: Mon, 2 Jun 2003 07:34:44 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006401c328d9$701f0040$2c00a8c0@local.net>
References: <E04CF3F88ACBD5119EFE00508BBB212109A2CCC8@exch-01.noida.hcltech.com>
Reply-To: "Allan Kissack" <lists@kissack.freeserve.co.uk>
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

I used to be able to list my rules via a cgi script but since moving to
redhat 9 (iptables 1.2.7a) it fails. The reson given is "can't initialize
iptables table `filter': Permission denied (you must be root) Perhaps
iptables or your kernel needs to be upgraded." which is absolutley accurate
(because I get this logging in as a local user and running /sbin/iptables -L
too) - but I need to know how to achieve this.
I tried altering the group on /sbin and /sbin/iptables and adding my local
user to that, but still it fails.

Am I missing something really obvious?  Either way, your assistance/advice
is welcome.

Thanks

--
Allan




