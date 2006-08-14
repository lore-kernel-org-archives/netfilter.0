From: Osvaldo Andrade <osvaldo_andrade@yahoo.com.br>
Subject: DNAT - Load Balance
Date: Mon, 14 Aug 2006 11:33:35 -0300 (ART)
Message-ID: <20060814143335.31632.qmail@web53408.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I=B4m a iptables user and i=B4ve got a kind of problem in
a load balance through NAT situation.=20
=20
Well, I have one Aplication Server (WebSphere) whose
open a socket to another server called CommServer and
it cannot support connections any more, so we decided
to add another CommServer and uses a NAT for load
balancnig.=20
=20
The following is the nat rule i=B4ve tested:=20
=20
/sbin/iptables -t nat -A PREROUTING -d 192.168.89.44
-p tcp --dport 9000 -j DNAT --to
192.168.89.158-192.168.89.159=20
=20
Whenever i use the tcpdump, i got all socket
connections passing by the same host(CommServer).
After some read about the subject i undestand its
occurring due to a round robin implementation on DNAT
in iptables, whose uses the source host to make the
load balance instead packages, and i=B4m always gonna
have only one client source.=20
=20
Is there any way to use a nat for load balancing when
i have only one source ?=20
=20
Is something wrong on my string rule ?=20
=20
Thanks,=20
Osvaldo Andrade

__________________________________________________
Fale com seus amigos  de gra=E7a com o novo Yahoo! Messenger=20
http://br.messenger.yahoo.com/=20

