From: Rakotomandimby Mihamina <rktmb.list@wanadoo.fr>
Subject: port scan identification
Date: Wed, 09 Jun 2004 11:33:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C6D987.9050805@wanadoo.fr>
Reply-To: netfilter@lists.netfilter.org
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

Hello

I try to set correctly up my firewall ans would need your help on one
thing :

I have this rule :
[...]
iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST \
-j LOG --log-level debug --log-prefix 'p_scan_: '
[...]

and i see this when i tail the output file :

[...]
Jun  8 22:52:32 milina kernel: p_scan_: IN=ppp0 OUT= MAC=
SRC=81.220.171.201 DST=81.248.95.56 LEN=40 TOS=0x00 PREC=0x00 TTL=54
ID=45424 PROTO=TCP SPT=4391 DPT=80 WINDOW=0 RES=0x00 RST URGP=0
[...]

Well . According to me, a port scan is the action to scan _all_ the
ports ... why is the port scan identified as only scaning the 80th port
? I mean, a port scan should not be on one port only ... isn't it ?

-- 
Rakotomandimby Mihamina Andrianifaharana
Tel : +33 2 38 76 43 65
http://stko.dyndns.info/site_principal/Members/mihamina

