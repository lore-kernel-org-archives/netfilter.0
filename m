From: Fall Birahim <birahim.fall@upu.int>
Subject: Checkpoint VPN through Iptables
Date: Tue, 24 Sep 2002 11:42:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8F31D8DF00BBD411975C00508B6D6E65F8908F@hermes.upu.int>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>, "'fw1@phoneboy.com'" <fw1@phoneboy.com>
Cc: "'BNC.Bourqui Laurent'" <laurent@bnc.ch>, Bernieu Olivier <olivier.bernieu@upu.int>

Hi all,

I'm hanged with the following problem.
I want to access our enterprise network behind a Nokia checkpoint FW-UPU
@a.b.c.d 
from a Windows 2k Checkpoint NG client @192.168.0.2
behind my Linux Redhat 7.2 iptables 1.2.6a FW-HOME with eth0 @DHCP and eth1
@192.168.0.1

I have the following script

$IPTABLES -F
$IPTABLES -t nat -F
$IPTABLES -t mangle -F
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -t nat -A POSTROUTING -s 192.168.0/24 -o eth0 -j MASQUERADE

My little understanding of firewall, linux and iptables, makes me believe
that :
a) I've a quite secureless FW-HOME and my internal LAN is nated
b) no matter the protocol, the src/dst ports etc, everything should pass.
c) The checkpoint client should be able to access my enterprise VPN
Is that right?

My problem is that the client cannot access my enterprise VPN.
I added some loging rules and it seems that
My client uses UDP, src port 500 dst port 500.
The FW-HOME send that to FW-UPU (prot udp, src port 500 dst port 500)
(masquerading the IP@)
The FW-UPU replies to FW-UPU (prot udp, src port 500 dst port 500)
The FW-HOME replies : icmp port udp 500 unreachable

I made another test before incriminating the Client
I plugged it directly to my CableModem and it worked immediately.
I check that it was configured correctly (IKE + Force UDP encapsulation +
IKE over TCP)
according to PhoneBoy http://www.phoneboy.com/faq/0141.html 
and http://www.phoneboy.com/faq/0372.html
After this test I concluded that the Client is operational.

Another info:
It worked with a Redhat 7.0 + ipchains
It didn't worked with ISA

So for me the problem is located somewhere on FW-HOME.
Anybody can help, explain, advice!?!?



_________________________________________________________
Birahim FALL
Project Manager (Postal Technologie Centre)
Universal Postal Union, PO Box, CH-3000 Bern 15 (Switzerland)
Phone	+41 313.503.372
Fax	+41 313.503.110
Email	mailto:birahim.fall@upu.int



