From: "Slawomir Orlowski" <orlowscy@hotpop.com>
Subject: question about Real Audio
Date: Fri, 22 Aug 2003 15:45:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d301c368e5$ea5d7a20$4900a8c0@cympak.com>
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

Hello there,
I have been using ipchains with 2.2 kernel and after reading about Netfilter
and outstanding manual iptables tutorial by Oskar Andreasson I desire to
move to 2.4 kernel with iptables.

I have some question though. In ipchains I have been using ip_masq_radio,
ip_masq_irc, ip_masq_ftp modules (to make real Audio, IRC and ftp services
to work).

I understand that in new iptables I will be using ip_conntrack_ftp,
ip_nat_ftp and ip_conntrack_irc, ip_nat_irc modules respectively.

What about real audio? Do modules ip_conntrack_raudio, ip_nat_radio exists ?

If not, will not I be able to use real audio ?

I have Real Server on my network and would like to be able to conect from
LAN Windows clients to conect to another Real Servers on the Internet.

I would really appreciate if somebody would shed some light on this topic.
Where I can find more information about it ?

Best regards.
Slawomir Orlowski


