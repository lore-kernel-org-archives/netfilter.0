From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Port forwarding with multiple public IPs
Date: Thu, 25 Mar 2004 11:08:55 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F2D@alderaan.smgtec.com>
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
To: Shane Hickey <shane@howsyournetwork.com>, netfilter@lists.netfilter.org

Remove all of your reverse-SNAT rules. They are automagically handled
implicitly.

Can you receive the packets from the server?
Does the server's default route take it back through the firewall?
Does the firewall detect the reply packets on the inside interface?
Does the firewall detect the reply packets on the outside interface?

