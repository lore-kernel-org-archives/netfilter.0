From: Maxime <hou@lebelge.net>
Subject: Trying to load balance a port redirection
Date: Sat, 11 May 2002 16:10:06 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020511161006.27cdd56a.hou@lebelge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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


Hi,

I'm trying to do a basic port redirect load balancing, here is what I tried :

while true; do echo serv1 | nc -l -p 4001; done &
while true; do echo serv2 | nc -l -p 4002; done &
iptables -t nat -F PREROUTING
iptables -t nat -I PREROUTING -p tcp --destination-port 1234 -j REDIRECT --to 4001-4002


But it doesn't work, I always get redirected on serv1. Note that it doesn't seems to
work with DNAT --to my_extern_ip:4001-4002.

May someone help me please ?


--
Maxime

