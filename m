From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: What is the diference between ipfw of *bsd and netfilter
	oflinux?
Date: Tue, 5 Oct 2004 10:33:50 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567954B@alderaan.smgtec.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Damjan <gdamjan@mail.net.mk>, netfilter@lists.netfilter.org


> However I agree with you that netfilter is easier to use and has more
> capabilities, I still can't beleive that netfilter (iptables actually)
> doesn't have a way to identify rules uniquely (via an ID). So simple
> feaure, so powerfull, and still iptables doesn't have this.
>=20
> And no, linenumbers don't identify rules uniquely, they can change at
> any moment.

Yeah, I know this is pretty annoying. They are going to include the
comment patch for this purpose, but it means you have to specify the ID.

