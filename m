From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: snat and dnat
Date: 04 Apr 2003 11:00:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049446817.1866.39.camel@kermit.spenneberg.de>
References: <B5747F3DB39FD411884B00B0D07808CCB6C9D8@server10>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B5747F3DB39FD411884B00B0D07808CCB6C9D8@server10>
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
To: Netfilter <netfilter@lists.netfilter.org>

Am Fre, 2003-04-04 um 09.59 schrieb Philippe Dhont (Sea-ro):
> Hi, 
> 
> I am a beginner with NAT and maybe you could just help me starting with the
> following so i can find the rest myself.
> i have an eth0 and eth1 
> eth0: 10.51.51.51
> eth1: 10.165.254.220
> on the eth0 side i have a client 10.51.13.13 who needs to ping to a client
> 10.165.1.60 
> so that's from one side to the other side.
> is that SNAT or DNAT ?
Well, in the beginning it is just routing. Therefore, if both clients
use the machine in between as a default gateway, it should work out of
the box.

If you want to hide the fact, that actually client1 pings client2 or
client2 does not use the FW as default gateway you have to use SNAT:
iptables -t nat -A POSTROUTING -o eth1 -s 10.51.0.0/16 -j SNAT --to
10.165.254.220

It would be DNAT, if client1 pings your firewall and this ping is
answered by client2 in reality.

cheers,

Ralf
-- 
Ralf Spenneberg
RHCE, RHCX

IPsec/PPTP Kernels for Red Hat Linux:  
http://www.spenneberg.com/.net/.org/.de
Honeynet Project Mirror:                http://honeynet.spenneberg.org
Snort Mirror:                           http://snort.spenneberg.org

