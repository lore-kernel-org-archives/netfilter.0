From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solucoesip.net>
Subject: question on rating SYN packets
Date: Fri, 7 Feb 2003 19:01:24 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002b01c2cef4$74f9b860$3201a8c0@ESTACAO>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter ML <netfilter@lists.samba.org>


    Hello Guys,

    I'm trying to modify my script firewalls for not allowing a LOT of
connections being established on a specific port in a very small period of
time. I know I could easily do this using a rule like:

iptables -A INPUT -p tcp --dport XX -m state --state NEW -m limit --limit
Y/s -j ACCEPT


    Altough, with this rule, I would be globally limiting connections for
that specific port in Y connections per second. I would like to know if it's
possible building a rule that would allow, for example, 1 SYN packet per
second PER host. In this case, I wouldnt have a 'global' limit of SYN
packets. In fact, I would have a SYN limitation for EACH host.

    Question: is it possible for building a rule like this ? Is there any
filter on patch-o-matic tree that would allow this kind of rule ?


    Sincerily,
    Leonardo Rodrigues
    Solu=E7=F5es IP


