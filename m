From: Jarek Sobieszek <j.sobieszek@lart.pl>
Subject: loopback and pointopoint interfaces
Date: Thu, 30 Jan 2003 12:00:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030130110035.GA3701@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I have some problems testing local interfaces over loopback.

Consider the following setup:

if0: 10.1.1.1 pointopoint 10.1.1.12
if1: 10.1.1.2 pointopoint 10.1.1.11

cable connects if0 with if1

iptables -A POSTROUTING -t nat -d 10.1.1.11 -j SNAT --to 10.1.1.12
iptables -A POSTROUTING -t nat -d 10.1.1.12 -j SNAT --to 10.1.1.11
iptables -A PREROUTING -t nat -d 10.1.1.11 -j DNAT --to 10.1.1.1
iptables -A PREROUTING -t nat -d 10.1.1.12 -j DNAT --to 10.1.1.2

ping 10.1.1.11 and ping 10.1.1.12 work as expected

Here's what I believe is going on:

ping 10.1.1.11
src             dst
10.1.1.2      10.1.1.11
POSTROUTING(if1)
10.1.1.12    10.1.1.11
OUT: if1
IN: if0
10.1.1.12    10.1.1.11
PREROUTING(if0)
10.1.1.12    10.1.1.1
ICMP
10.1.1.1      10.1.1.12
POSTROUTING(if0)
10.1.1.11    10.1.1.12
OUT: if0
IN: if1
10.1.1.11    10.1.1.12
PREROUTING(if1)
10.1.1.11    10.1.1.2
ping response from 10.1.1.2

Now the setup which I cannot make to work:

if0: 10.1.1.1 pointopoint 10.1.1.12
if1: 10.1.1.3 pointopoint 10.1.1.14
if2: 10.1.1.4 pointopoint 10.1.1.13
if3: 10.1.1.2 pointopoint 10.1.1.11

cables connect if0 to if1 and if2 to if3

iptables -A POSTROUTING -t nat -d 10.1.1.11 -j SNAT --to 10.1.1.3
iptables -A POSTROUTING -t nat -d 10.1.1.12 -j SNAT --to 10.1.1.4
iptables -A POSTROUTING -t nat -d 10.1.1.13 -j SNAT --to 10.1.1.11
iptables -A POSTROUTING -t nat -d 10.1.1.14 -j SNAT --to 10.1.1.12
iptables -A PREROUTING -t nat -d 10.1.1.11 -j DNAT --to 10.1.1.14
iptables -A PREROUTING -t nat -d 10.1.1.12 -j DNAT --to 10.1.1.13
iptables -A PREROUTING -t nat -d 10.1.1.13 -j DNAT --to 10.1.1.2
iptables -A PREROUTING -t nat -d 10.1.1.14 -j DNAT --to 10.1.1.1

ping 10.1.1.1 and ping 10.1.1.2 don't work

Here's what I believe should be going on (but apparently it isn't):

ping 10.1.1.11
src             dst
10.1.1.2      10.1.1.11
POSTROUTING(if3)
10.1.1.3      10.1.1.11
OUT: if3
IN: if2
10.1.1.3      10.1.1.11
PREROUTING(if2)
10.1.1.3      10.1.1.14 (FWD)
POSTROUTING(if1)
10.1.1.12    10.1.1.14
OUT: if1
IN: if0
10.1.1.12    10.1.1.14
PREROUTING(if0)
10.1.1.12    10.1.1.1
ICMP
10.1.1.1      10.1.1.12
POSTROUTING(if0)
10.1.1.4      10.1.1.12
OUT:if0
IN:if1
10.1.1.4      10.1.1.12
PREROUTING(if1)
10.1.1.4      10.1.1.13 (FWD)
POSTROUTING(if2)
10.1.1.11    10.1.1.13
OUT:if2
IN:if3
10.1.1.11    10.1.1.13
PREROUTING(if3)
10.1.1.11    10.1.1.2
ping response from 10.1.1.2

Any ideas why it doesn't work (I enabled ip_forward and disabled 
rp_filter)?
And is it posible to blindly forward packets from if1/if2 to if2/if1 
(since the devices are not ehernet I think ethernet bridging does not 
qualify)?

Thanks,

Jarek Sobieszek

