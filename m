From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: no nat please
Date: Thu, 4 Nov 2004 09:13:04 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567959D@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Payal Rathod <payal-netfilter@scriptkitchen.com>, Netfilter ML <netfilter@lists.netfilter.org>

Payal Rathod wrote:
> Hi,
> I use simple masquerading to allow my windows clients to browse the
> net. But for one particular machine I need to connect it to VPN of
> my client abroad. Now, the tech people at their end told me not
> to nat that machine as nating would destroy the VPN part. How do I do
> that? The machine IP address is 192.168.10.15.


You have to NAT that address or else you're looking at a very large
change the firewall to get it to work. Even then it'd be a kludge. The
best ideal would be to NAT and figure out how to support the VPN tunnel
through the firewall. Linux has support for IPSEC/PPTP/L2TP, any other
VPN-like products, who knows. Maybe if you gave some more information,
we could give you a more articulate answer.

