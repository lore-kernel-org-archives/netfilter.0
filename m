From: SBlaze <dagent.geo@yahoo.com>
Subject: CnC General and ipitables woes. Need HELP PLS!
Date: Wed, 16 Apr 2003 17:58:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030417005813.13243.qmail@web40209.mail.yahoo.com>
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
To: nf <netfilter@lists.netfilter.org>

Recently a friend and I decided we would like to play EA's Command and
Conquer's Generals in a "Direct Connect" game. We had a time finding
information about the ports needed. The Readme file would have you believe you
need to open alot of ports to make this work... however upon inspection of the
games pratices... I discovered that it listens on port 8086 for UDP(always)..
Once a game is started 8088 opens.... So in leaning this(my friend and I)
thought we could get by with just some standard PREROUTING(see below)

iptables -t nat -A PREROUTING -p udp --dport 8086 -j DNAT --to-destination
192.168.1.25:8086
iptables -t nat -A PREROUTING -p udp --dport 8088 -j DNAT --to-destination
192.168.1.25:8088

I'm not the only one having this problem as you can see here...

http://www.computing.net/linux/wwwboard/forum/18596.html  

So my question is... is some sort of con. tracking mod needed? Anyone know
anything about this problem? Thanks for your time and help anyone

P.S. The friend and I also tried the FirewallPortOveride option and had it
ignored as well... So we are at a loss after for searching for help...
I'm turning to you capable guys for help :}}





=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo
http://search.yahoo.com

