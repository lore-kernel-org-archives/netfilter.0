From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Missing shared object
Date: Fri, 09 Jun 2006 20:38:37 +0200
Message-ID: <4489C02D.6090607@plouf.fr.eu.org>
References: <001d01c68be1$5cc143f0$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001d01c68be1$5cc143f0$0101000a@sterenborg.info>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Rob Sterenborg a =E9crit :
>=20
> So, it looks like you don't have the file "libipt_ipv4options.so", or
> perhaps it's in the wrong place. Try to find the file ("locate
> libipt_ipv4options.so") to see if and where it finds it.
> If you don't have it, you're going to have to patch the kernel for
> ipv4options and build a new one to be able to use ipv4options.

Why ? libipt_ipv4options.so is an iptables library, not a kernel module.

