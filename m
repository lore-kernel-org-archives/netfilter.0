From: Steve <sdisemi@tin.it>
Subject: error: ip_tables.o init_module:Device or resource busy
Date: Mon, 10 Nov 2003 16:08:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FAFA9D8.2030207@tin.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'd like to preface this mail by saying that if a little knowledge is a 
dangerous thing, then I am very dangerous....

I have recently installed redhat 9.0 and upgraded to iptables 1.2.7a 
with a 2.4.20-18.9 kernel.
When I try to do anything with iptables, I get the following error:-

*************************************************************
e.g. iptables -F
/lib/modules/2.4.20-18.9/kernel/net/ipv4/netfilter/ip_tables.o: 
init_module: Device or resource busy
Hint: insmod errors can be caused by incorrect module parameters, 
including invalid IO or IRQ parameters.
       You may find more information in syslog or the output from dmesg
/lib/modules/2.4.20-18.9/kernel/net/ipv4/netfilter/ip_tables.o: insmod 
/lib/modules/2.4.20-18.9/kernel/net/ipv4/netfilter/ip_tables.o failed
/lib/modules/2.4.20-18.9/kernel/net/ipv4/netfilter/ip_tables.o: insmod 
ip_tables failed
iptables v1.2.7a: can't initialize iptables table `filter': iptables 
who? (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
******************************************************

Obviously, there is something wrong with either the kernel or iptables 
as I have installed it ( using apt-get install, no thanks to redhat).
I need to get iptables working yesterday.
Can anyone tell me a no-brainer way to achieve this ?
Does my version of kernel work with this version of iptables ?
Do I have to go back to an earlier version ?
Whats the best way to get out of this mess ?
I remember for my dos days we used to do "format c:" in this kind of 
situation.


Thanks a lot,

a moron


