From: Akao <technique@akao.fr>
Subject: Re: table "mangling" is missing, but she shouldn' t
Date: Mon, 14 Jun 2004 12:56:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40CD8443.4050900@akao.fr>
References: <7528A97D83FBD411BEF40003471B905B05D8FF73@smtp.retecal.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7528A97D83FBD411BEF40003471B905B05D8FF73@smtp.retecal.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Cc: netfilter@lists.netfilter.org

But mangle is built in the kernel!  I have not built any module.

Axel


CPD - David Carde=F1osa Rubio wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
> Hi
>
> You perhaps dont have loaded iptable_magle module.
>
> try lsmod
>
> and if you don=B4t see the mangle module try insmod iptable_mangle
>
>
> David
>


