From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: urgent - netfilter rejecting 60% of DNS requests!
Date: Thu, 2 Oct 2003 09:31:00 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C406@wardrive.citadelcomputer.com.au>
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
Content-Type: text/plain; charset="iso-8859-1"
To: mferrari@decidir.net, "Netfilter list (E-mail)" <netfilter@lists.samba.org>

Are you sure this isn't a BIND problem and not iptables? If it's =
iptables then you should log all droped/rejected packets and find out =
which ones are dropping and why.

Do you have some funky rules like dropping fragmented packets or =
anything else?

Some BIND servers use TCP instead of UDP to transfer zone info but this =
may(not) be your problem.. LOG, LOG, LOG and if it doesn't catch it then =
it's probably a BIND issue..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Martin Ferrari - Decidir IT [mailto:mferrari@decidir.net]
Sent: Thursday, 2 October 2003 4:33 AM
To: 'Netfilter list (E-mail)'
Subject: urgent - netfilter rejecting 60% of DNS requests!


Hi, I don't know what's happening, but I discovered that my firewall is
currently rejecting with port unreachable about 60% of the DNS queries I
receive, but this is not happening with the other kind of traffic I =
manage
(http and smtp).

I use connection tracking and ip_conntrack_max is set to 32k. Dmesg =
doesn't
report anything!

Please, ANY help would be greatly welcomed!

---

Martin Ferrari
Administrador UNIX
Decidir
________________________________________
mailto:mferrari@decidir.net
Vis=EDtenos en http://www.decidir.com
Decidir.com International Ltd.

******************* Confidencialidad en Internet Email =
********************
Este mensaje puede contener informaci=F3n confidencial. Si usted no es =
el
destinatario de este mail, o la persona encargada de recibir los
mensajes para dicha persona, por favor no copie ni reenv=EDe este =
mensaje.
De ser as=ED, por favor destruya este mensaje y de ser tan amable
notifique al remitente con un Email. En caso de no querer recibir esta
clase de informaci=F3n via Internet por favor av=EDsenos cuanto antes.
Conclusiones, opiniones y cualquier otro tipo de informaci=F3n que
contenga este mensaje y que no este directamente relacionado con el
rubro oficial de esta Empresa, no debe ser tomado en cuenta.



