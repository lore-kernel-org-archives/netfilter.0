From: "Jorge Agrelo" <jagrelo@novadevices.com>
Subject: IPSET issue ???
Date: Tue, 29 Mar 2005 19:10:41 -0500
Message-ID: <4249A831.26741.68F66E4C@localhost>
Reply-To: jagrelo@novadevices.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Description: Mail message body
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi friends

I want to block the offensive network list supplied by dshield
(http://feeds.dshield.org/block.txt) using IPSET match, anybody tell me if the 
following stuff is correct.  

ipset -N bogons-nets nethash
ipset -A bogons-nets 81.208.28.0/24
ipset -A bogons-nets 141.50.163.0/24 ..........
iptables -N blocklist
iptables -A bogons-nets -m set --set bogons-nets scr,dst -j drop
iptables -A INPUT -i ! lo -m state ! --state ESTABLISHED -j blocklist
iptables -A FORWARD -m state ! --state ESTABLISHED -j blocklist
iptables -A OUTPUT -o ! lo -m state ! --state ESTABLISHED -j blocklist

I want to block the source and destination traffic from/to this networks, I'm not sure 
regarding how to use the tokens src and dst and the set type (nethash) in IPSET???

Thanks in advanced

**********************************
CTO: Eng. Jorge Agrelo O.
WEb: www.novadevices.com
E-Mail: jagrelo@novadevices.com
Phone: (593-2) 225-7711 ext. 105
Av. Brasil N44-12 y Condor, Quito-Ecuador
**********************************
