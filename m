From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: Tue, 10 Dec 2002 12:22:33 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0212101216060.9625-100000@blackhole.kfki.hu>
References: <1039518051.1713.91.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039518051.1713.91.camel@rayw.knowledgefactory.co.za>
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

> Yes, you do. Port 20 (and/or any other) connections after the control
> connection are not 'RELATED, ESTABLISHED' to the control connection.
> They are new connections either from the client to the server or vice
> versa. You therefore need seperate rules for them.

If we are speaking about the data channels of the supported protocols
(FTP, IRC and all the other protocols from p-o-m), then this is absolutely
false.

> Remember connection tracking happens at a pakcet level, i.e all states
> relate to packets of a connection, not per protocol.

In the case of the supported protocols with additional channels, again,
untrue. Please do no spread false info! Why would then the RELATED state
exist?

> > However, I'm not sure if it's better to split them up into 2 rules :
> > iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 21 -m state --state
> > NEW -j ACCEPT
> > iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED
> > -j ACCEPT

Because the destination port of the data channels cannot be port 21,
therefore you must use two rules. And because you specify the
incoming/outgoing interfaces, you need a third rule for the reply packets
as well.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


