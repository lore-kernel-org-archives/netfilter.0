From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: Tue, 10 Dec 2002 12:52:13 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0212101245300.9625-100000@blackhole.kfki.hu>
References: <1039519950.1713.109.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039519950.1713.109.camel@rayw.knowledgefactory.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Raymond Leach <raymondl@knowledgefactory.co.za>
Cc: rsterenborg@xs4all.nl, 'Paulo Andre' <pandre@darkstar.nom.za>, 'louie miranda' <lmiranda@chikka.com>, 'netfilter' <netfilter@lists.netfilter.org>

On 10 Dec 2002, Raymond Leach wrote:

> OK, then how does connection tracking work for passive ftp?

The FTP connection tracking and NAT helper modules support active (PORT,
EPRT) and passive (PASV, EPSV responses) ftp as well. In both cases the
command channel is monitored and the commands/responses are parsed. As the
appropriate patterns detected, the system digs out the announced
port (address) and prepares to accept the data channel.

At iptables level there is no difference whatsoever between active/passive
modes in letting in/NATing them.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


