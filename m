From: "Tomasz Wrona" <twr@wp.pl>
Subject: Per IP packets/s limit.
Date: Sat, 22 Nov 2003 17:34:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3fbf901a8bd4c@wp.pl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I am a bit out of date... so I would like to ask if  does any
iptables module support
per IP pkt/s limit ?

I mean something like "-m limit --limit X/s [--limit-burst Y]"
but working per IP simmilar to iplimit module which do not
require creating separate rules for each src IP.

I think it could be usefull against simple icmp/udp DoS in large
LAN enviroment.


Regards
tw
--
 



