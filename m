From: Scott MacKay <scottmackay@yahoo.com>
Subject: Bridging and rule specifications
Date: Tue, 25 Feb 2003 10:03:35 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030225180335.92361.qmail@web13906.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

Hello!
I am playing with iptables under RH8.0 and wanted to
try out a range of 'stuff'.  I had some questions
about the iptables qualification lines I should use
for bridging.

Specifications:  I am using RedHat 8.0.  I recompiled
the kernel using the linux-2.4.20 release (as opposed
to the distributed linux-2.4.18).  I applied the
http://bridge.sourceforge/net bridging + firewall
patch (I belive the HOWTO eventually points to that as
the final location of the patch).  Recompiled and all
is happy in the world.  I can bring up raw interfaces
(no ip), create my 'br0' bridge device out of eth0 and
eth1, and even set up br0 to get a DHCP address.
'eth0' is considered the 'protected hosts'.  'eth1'
leads out to the world.  Neither interface has an IP
(tho the pseudo br0 does)

My question: 
I want to create the following rules
A rule to send all packets going from machines on eth0
bound for eth1 to enter into a QUEUE (where the
packets may also get mangled).  What would my rule
look like?  Would it be:

iptables -t mangle -A FORWARD -i eth0 -o eth1 -j QUEUE



-Scott

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - forms, calculators, tips, more
http://taxes.yahoo.com/

