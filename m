From: "Curby ." <kirbysdl@hotmail.com>
Subject: questions about chain traversal, new ascii diagram
Date: Thu, 06 Jan 2005 17:23:07 +0000
Message-ID: <BAY101-F121798A658C0B56334F8D7DF930@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi, I'm in the process of building a three-interface firewall and I have 
some questions about how the different chains see NAT packets and 
locally-generated packets.

Firstly, if I just do filtering in the INPUT/OUTPUT chains, NAT-ed packets 
will not traverse those chains, so I figure I should probably put similar 
filtering rules in the FORWARD chain? (For example, I'd like to be able to 
block all my internal users from accessing certain sites, or block incoming 
traffic sent by bad hosts from being port-forwarded to internal servers).

If I was trying to block incoming traffic from bad hosts, why not simply put 
the filters in the PREROUTING chain instead of both INPUT and FORWARD?  Is 
it because the nat table is intended for just nat and doing filtering there 
would be ugly, or would it actually fail to work?

I read in http://davidcoulson.net/writing/lxf/14/iptables.pdf (on the 
netfilter.org documentation page) that nat's OUTPUT chain performs DNAT on 
outgoing packets originating from the server, and POSTROUTING performs SNAT 
on outgoing packets passing through the firewall from other hosts.  If I 
have two Internet-facing IPs and would like to SNAT locally-generated 
traffic to one or the other, it would appear that iptables wouldn't let me 
do that very easily, right?  What is the purpose of nat's OUTPUT chain (in 
other words, when would I want to DNAT locally-generated traffic)?

In what order does locally-generated traffic traverse the OUTPUT chains of 
filter and nat tables?

Lastly, aside from those issues, is the diagram below a reasonable 
representation?  The only diagrams I found on chain traversal dealt with the 
nat and filter tables separately, but I'm hoping that it's possible to show 
them together.  (I hope hotmail doesn't completely destroy this ascii hehe).

# -->n.PREROUT-->routing decision-->f.FORWARD-->n.POSTROUT--,-->
#                       |                     ,-------------^
#                       v                     |
#                     f.INPUT              f.OUTPUT, n.OUTPUT
#                       |                     ^
#                       `--->local process----'

Thanks!

--curby



