From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: snat to multiple source ip
Date: Tue, 20 Sep 2005 14:39:10 +0200
Message-ID: <BAY103-DAV7432DC634B39274E5495CB2950@phx.gbl>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thanks for the reply Rob0.

On Thursday 2005-September-15 04:59, Marco Berizzi wrote:
>> My firewall script mark all the squid packet and I route them

>You did not post your rules.

This is not the real problem.
The problem is the SNAT rule. It is doesn't work as stated
by man. How does it work? Per socket? Or per socket per host?

iptables -t nat -I POSTROUTING -s HDSL_ip
--protocol tcp -m multiport --dports SQUIDports
-j SNAT --to first_adsl_ip --to second_adsl_ip

This rules snat all packets created by this (squid) host, but
everytime I connect to the internet *always* the first_adsl_ip
is chosen. My company lan has about 150 pc that connect to
the internet by this proxy, so I don't understand why *everytime*
I open my browser and I connect to www.dnsstuff.com always the
same ip is displayed. It isn't a cache problem because I reset them
(both on squid and browser side).

>> through the two adsl connections (I have patched the kernel
>> with the equalize patch).

> Which patch is this? I have used Julian Anastasov's patches

Here is http://www.ussg.iu.edu/hypermail/linux/kernel/0203.2/1314.html
However this is only for routing not for nat.



