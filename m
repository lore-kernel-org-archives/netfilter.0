From: Antonio Alvarez <aramirez@teneinformatica.com>
Subject: iptables and iproute
Date: Mon, 26 Apr 2004 08:20:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082964013.1772.14.camel@Toshiba.Toshiba>
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
To: netfilter <netfilter@lists.netfilter.org>

Hello every body!

I have a machine with 4 ethernet interfaces, 3 directly connected to
ADSL lines a the another one to a LAN.

I have 3 routing tables with iproute ( each one with his default gw for
each ADSL line )

I don't have problems with packet traversing my linux machine ( mangle
the packet in the PREROUTING chain ) to routing.

The problem is how can i control the packet localy generated( ip and
port )???  
i can't mangle this packet before routing :-/

for example a need to use ssh server in the linux machine using ADSL 1 
but when the machime aswer me use the ADSL 3 ( because this is the
default gw in the main routing table :-( ... 

In sumarize it's possible to use different routing tables with packet
generated localy??


Thanks in advance ...

Antonio Alvarez



