From: "Jack Liu" <Jack_liu@usish.com>
Subject: iptables-restore problem
Date: Wed, 31 Mar 2004 16:15:57 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403310816.i2V8Gf6P003126@ms.usish.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-2022-jp"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

hi,all
   I have encountered a problem:
   I can ping to another machine. Yet telnet and ftp port can not=
 opened. So I thought it was a firewall problems. I compile the=
 kernel with CONFIG_NETFILTER unselected. Still the same problem.=
 When I restore all Netfilter configuration and use 
service iptables start, a message "iptables-restore failed in=
 line 18".=09
   What's the problem?=09

=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1Jack Liu
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1Jack_liu@usish.com
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A12004-03-31



