From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: forwarding on the same NIC
Date: Tue, 11 May 2004 10:30:10 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567932E@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: alucard@kanux.com
Cc: netfilter@lists.netfilter.org

Have you tried something like:

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD --destination 10.73.219.156 -p tcp --dport 80 -j
ACCEPT
iptables -t nat -A PREROUTING --destination 10.73.219.156 -p tcp --dport
8080 -j DNAT --to-destination 10.73.219.77:80
iptables -t nat -A POSTROUTING --destination 10.73.219.77 -p tcp --dport
80 -j SNAT --to-source 10.73.219.156

Remember, if the default router of the web server isn't your firewall
box, the packet will exit the router, but when the next packet destined
for the web server is senty by the client, the linux box doesn't think
its valid. This is because the conntrack missed the obligatory SYNACK.
The subsequent ACK to the firewall would mean nothing. I could be wrong
about the internal logic, but it'd make sense.


