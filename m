From: =?iso-8859-1?Q?Herbert_H=F6hlke?= <hhohlke2000@yahoo.com.ar>
Subject: H.323_NAT: partial packet  0/6 in 0/0
Date: Mon, 24 Mar 2003 22:00:25 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NHBBJMFAILALELGBFJEJMEBMCKAA.hhohlke2000@yahoo.com.ar>
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
To: netfilter@lists.netfilter.org, Leaf User Mail List <leaf-user@lists.sourceforge.net>

Hello

I have a linux 2.4.20 firewall running iptables 1.2.7a with
ip_conntrack_h323 and ip_nat_h323 installed and Netmeeting running in both
ends, inside the LAN and in the Internet. Sometime appears on screen the
following error six times:
  H.323_NAT: partial packet 0/6 in 0/0
  H.323_NAT: partial packet 0/6 in 0/0
  H.323_NAT: partial packet 0/6 in 0/0
  H.323_NAT: partial packet 0/6 in 0/0
  H.323_NAT: partial packet 0/6 in 0/0
  H.323_NAT: partial packet 0/6 in 0/0
and in syslog twice:
  /var/log/syslog:Mar 24 21:32:58 firewall kernel: H.323_NAT: partial packet
0/6 in 0/0
  /var/log/syslog:Mar 24 21:36:08 firewall kernel: H.323_NAT: partial packet
0/6 in 0/0

I searched in Google but I found only 9 occurences but in italian language.

Does someone know, what causes this error?

Regards
Herbert


