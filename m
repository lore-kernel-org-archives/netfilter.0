From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: [announce] chaostables 0.4
Date: Sun, 7 Jan 2007 20:55:31 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701072014550.4365@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nmap-dev-bounces@insecure.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://cgi.insecure.org/mailman/listinfo/nmap-dev>,
	<mailto:nmap-dev-request@insecure.org?subject=unsubscribe>
List-Post: <mailto:nmap-dev@insecure.org>
List-Help: <mailto:nmap-dev-request@insecure.org?subject=help>
List-Subscribe: <http://cgi.insecure.org/mailman/listinfo/nmap-dev>,
	<mailto:nmap-dev-request@insecure.org?subject=subscribe>
Sender: nmap-dev-bounces@insecure.org
Errors-To: nmap-dev-bounces@insecure.org
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Netfilter Mailing List <netfilter@lists.netfilter.org>, nmap-dev@insecure.org

[Not sure if netfilter/nmap-dev bounce when you are not subscribed, 
remove if in doubt.]


Hello lists,


chaostables 0.4 has been released. This is a package containing some 
netfilter modules to work against nmap and port scans. 'portscan' can 
match on stealth, syn, connect scans, also finds FIN-connect scans and 
simple banner grabbing. 'DELUDE' works like TARPIT, making it look like 
the port is open, but actually does not hold the connection like TARPIT, 
hence should not fill up conntrack. 'CHAOS' will deliver what it says: 
slows down nmap scans[1] and provides back bogus non-deterministic 
replies -- the more even with DELUDE/TARPIT.

For Linux 2.6.18, .19, .20, iptables 1.3.6, 1.3.7. CHAOS 
currently requires TARPIT during build and runtime.

'portscan' and 'CHAOS' can also be synthesized by rule logic "only"[2], 
giving way to possibly implement it on BSD ipf* too. Details in 
doc/fw.html.

Suggestions for improvement are welcome.
Please discuss the usefulness and let me
hear [LKML] any objections for inclusion in Linux mainline too.

	http://freshmeat.net/releases/244538/ - this release
	http://freshmeat.net/p/chaostables/   - generally


Thanks,
Jan


[1] nmap 3.81 timings have been done back in 2005, but things have 
changed a little since 4.x. Redoing the timing benchmarks is already on 
TODO.

[2] Requires: connmark && CONNMARK &&
              (conntrack || state) &&
              (random || nth || statistic || hashlimit)
    or equivalent. Depends on how you implement it.

_______________________________________________
Sent through the nmap-dev mailing list
http://cgi.insecure.org/mailman/listinfo/nmap-dev
Archived at http://SecLists.Org
