From: Irvan Adrian Kristiono <irvan_adrian@yahoo.com>
Subject: i use iptables for nat, and can connect with ping command but other ports can't connect
Date: Sat, 26 Oct 2002 14:16:32 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021026211632.17973.qmail@web20305.mail.yahoo.com>
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

hi, i'am from Indonesian, i use mandrake 8.2 for my
gateway 
server, which had iptables installed on it.. so i
decided
to use it, and remove ipchains and ipvsadm. and i use
iptables -t nat -A POSTROUTING -s 192.168.15.0/24 -o
eth0 -j SNAT
--to-source myinternetip
when i try to browse from my workstation which at
192.168.15.0/24
it cannot find any page.. so i try ping command to
yahoo.com
IP, and get the reply. i'm so confused, why other port
cannot pass to workstation, although the INPUT,OUTPUT,
FORWARD Policy is ACCEPT.. so there isn't firewall at
all.

why ip tables cannot pass the port beside 80. aren't
must
i declared it first, how ? help me !!

__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

