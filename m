From: netfilter_user <netfilter_user@o2.pl>
Subject: access to server
Date: Wed, 30 Apr 2003 00:49:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5436369716.20030430004931@o2.pl>
Reply-To: netfilter_user <netfilter_user@o2.pl>
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
To: netfilter@lists.netfilter.org

Hello netfilter users,

In my network, Linux machine connect Local net (eth1) with internet
(ppp0). As a default all INCOMING traffic is deny. I made some rules
to access SMTP, HTTP etc. but its not important now.
It is necessery for nodes from local net to access server that is in Internet. The
address of this server is 62.233.202.165 and listen on port 23073 and
23083.

Rule: "iptables -A FORWARD -i eth1 -p udp -m --multioport --dport
23073,23083 -j ACCEPT"
wont work and i have received msg in log like this:

Apr 30 02:28:41 slack kernel: IPT:UnhandledForward:IN=eth1 OUT=ppp0 SRC=192.168.1.2 DST=62.233.202.165 LEN=36 TOS=0x00 PREC=0x00 TTL=127 ID=23780 PROTO=UDP SPT=1552 DPT=13073 LEN=16

Im newbe at iptables and cant resolve that problem alone. Maybe anyone
of You have got idea how to force that to work.


  

-- 
Best regards,
mailto:netfilter_user@o2.pl


