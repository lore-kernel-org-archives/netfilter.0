From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Is this at all possible
Date: Thu, 2 Dec 2004 10:11:12 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679601@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Steve Comfort <steve@4Dllc.com>, netfilter@lists.netfilter.org

Steve Comfort wrote:
> Hi all,
>=20
> I'm 99% sure that the answer to this one is no, but a customer asked
> :)=20

Linksys routers have Linux installed. With custom firmware, you can
perform Bridged network solutions. This means passing data from one
network to the next almost transparently.=20

Normal bridged network setup
Network A -> Bridge -> Network B

Wireless bridged setup
Network A -> Wlan1 -> (air) -> Wlan2 -> Network B

You'll need to support ProxyARP and enable the bridged mode on the
router. I believe www.sveasoft.com has the support needed. It has
bridged at least.

I have never setup this exact configuration, so I may be missing
something. PS: the 'Internet' port should not be plugged in or have a
valid network. Ideally you're delegating the default route to someone
else.

