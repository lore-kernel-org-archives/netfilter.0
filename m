From: <john@spectrum.in>
Subject: Problem with IP tables
Date: Sun, 23 Feb 2003 12:00:08 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1367.203.197.151.77.1045981808.squirrel@smtp.spectrum.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Group,

I have one Redhat 7.1 server with kernal version 2.4.
The IP table version is iptables-1.2.5-3

But is  not working, when ever I tied to execute the iptables command,
following is the error message that I am getting...

/lib/modules/2.4.18-4smp/kernel/net/ipv4/netfilter/ip_tables.o:
init_module: Device or resource busy
Hint: insmod errors can be caused by incorrect module parameters, including
invalid IO or IRQ parameters
/lib/modules/2.4.18-4smp/kernel/net/ipv4/netfilter/ip_tables.o:
insmod /lib/modules/2.4.18-4smp/kernel/net/ipv4/netfilter/ip_tables.o failed
/lib/modules/2.4.18-4smp/kernel/net/ipv4/netfilter/ip_tables.o: insmod
ip_tables failed
iptables v1.2.5: can't initialize iptables table `filter': iptables who?
(do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

How can I solve this problem...

regds,




