From: "Alejandro Zaidel" <Alejandro.Zaidel@comafi.com.ar>
Subject: Destination NAT
Date: Wed, 28 Jan 2004 11:21:43 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <147E1D375819F44680C3E5BFB6424C52DFC450@bcexc01.bue299.comafi.com.ar>
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
To: netfilter@lists.samba.org


Can I address a packet to more than one IP address at the same time ??

I have   iptables -t nat -A PREROUTING -i eth1 -j DNAT --to=
 5.6.7.8-5.6.7.10  as an example, but I want to send the packets to both=
 7.8 and also 7.10=0D

Is it possible to do ???


From Buenos Aires, Argentina.


Alex.-

La informacion contenida en este correo es para uso exclusivo de los=
 destinatarios del mismo.
Esta prohibido a las personas o entidades que no sean los destinatarios de=
 este correo
realizar cualquier tipo de modificacion, copia o distribucion del mismo.
Si Usted recibe este correo por error tenga bien notificar al emisor y=
 eliminarlo.

