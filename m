From: "Spiro Azkoul" <spiro@snacorp.net>
Subject: raw ICMP ports
Date: Tue, 13 Jul 2004 01:31:44 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407130831.i6D8Vg1m012187@ylpvm01.prodigy.net>
References: <3700.211.24.230.5.1089591173.squirrel@somerset.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3700.211.24.230.5.1089591173.squirrel@somerset.sytes.net>
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

I shutdown a bunch of startup services and only have specific ports open,
and IPTABLES on top. 

Out of no where, the following lines appeared on my netstat as of 3 days ago

raw   125024      0 *:icmp                  *:*                     7

raw   126688      0 *:icmp                  *:*                     7

raw   126688      0 *:icmp                  *:*                     7  

I can't exactly figure out what this is. 
Any feedback?
Thanks



