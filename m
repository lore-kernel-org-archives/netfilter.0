From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: iptables and wireless card in promiscuous mode
Date: Tue, 30 Nov 2004 07:38:49 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019809@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Claudio Lavecchia <Claudio.Lavecchia@eurecom.fr>, netfilter@lists.netfilter.org

Try pre and post routing...  It might be a start


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Claudio Lavecchia
> Sent: Tuesday, November 30, 2004 4:54 AM
> To: netfilter@lists.netfilter.org
> Subject: iptables and wireless card in promiscuous mode
>=20
> Hello People,
>=20
> I have a little question:
>=20
> I have two laptops that have 802.11 wireless cards. I am developing
some
> application that essentially perform sniffing functions using wireless
> cards in promiscuous mode. To test my code, I need those two laptops
not
> to "see" each other (--> I do not want the wireless card of laptop A,
> which is operating in promiscuous mode to process packets coming from
> laptop B) and I tought to do it using iptables. so on laptop A i added
> the following rule:
>=20
> iptables -A INPUT -mac --mac-source MAC_ADDRESS_LAPTOP_B -j DROP
>=20
> and on laptop B I added the rule:
>=20
> iptables -A INPUT -mac --mac-source MAC_ADDRESS_LAPTOP_A -j DROP
>=20
> I just executed my first tests and the feeling  I got is that, for
> example, the wlan card of  laptop B still passes through the packet
> coming from laptop A.
>=20
> Can anyone confirm  this analysis? If I am right, can anyone give me a
> hint to possibly workaround this?
>=20
> Thank you very much
>=20
> Claudio


