From: Daniel Balkanski <Daniel.Balkanski@Informatik.TU-Chemnitz.DE>
Subject: iptables and nfs mounts problems
Date: Mon, 3 Jun 2002 13:21:01 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <E17EptV-0001zE-00@pat.hrz.tu-chemnitz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello

I have constant troubles with nfs mounts on my masquerading
machine. Whenever I use iptables the nfs mounts on the
masquerading machines are destroyed after some time.
Setup consist of nfs server with public IP address and
several clients with private addresses behind masquerading
machine. My nfs server is an old RH 6.2 machine with
kernel 2.2.16-3. This machine had about 460 days uptime
before where rebooted because of power loss, so I'm
not very keen to upgrade it. But I try different versions of linux
on masquerading machines and clients behind (LM8.1, LM8.2
RH7.2) and the result is always the same - periodicaly the
nfs mounts on the frontend masquerading machine are
destroyed, while the nfs mounts on clients are O.K. and
the masqerading continue to work. If i use old ipchains on
frontend to do the masquerading all work flawlessly.
The problem is that iptables doesn't offer the flexibility
I need....

Does it somebody experienced similar problems? Where
can be the problem - nfs or iptables?

Best Regards

Daniel

P.S.: here is my quite usual iptables setup:

iptables -P INPUT ACCEPT
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -N block
iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A block -m state --state NEW -i eth1 -j ACCEPT

iptables -A INPUT -j block
iptables -A FORWARD -j block

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d '!' 192.168.0.0/16 -j 
SNAT --to <public IP of eth0>

