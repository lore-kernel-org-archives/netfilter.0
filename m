From: Willi Mann <newsletters@wm1.at>
Subject: strange log entries
Date: Tue, 11 Feb 2003 16:13:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E49130A.70805@wm1.at>
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

Hi!

I'm fighting with some strange log entries in my firewall.
The machine is a proxy server and these entries appear only while the 
proxy (squid) is heavily used. (about 200 hits/minute, so I don't think 
it's caused by ip_conntrack_max=16376)

I allow all ESTABLISHED,RELATED connections and of course some ports 
(8080) in the INPUT chain and all connections in the OUTPUT chain.
The rest of the INPUT chain is logged with stateNEW or stateINVALID prefix.


e.g.:

stateNEW: IN=eth1 OUT= MAC=xxx SRC=131.131.131.131 DST=193.193.193.193 
LEN=1500 TOS=0x00 PREC=0x00 TTL=47 ID=10226 DF PROTO=TCP SPT=80 
DPT=37678 WINDOW=33304 RES=0x00 ACK URGP=0

The flags vary. ACK - ACK,FIN.- ACK,PSH,FIN

Does anybody know the reason for this? Bug in netfilter, bug in remote 
system?

Willi Mann


