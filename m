From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Need help with iptables and iprange module
Date: Thu, 15 Feb 2007 11:45:47 +0100
Message-ID: <45D439DB.8090105@plouf.fr.eu.org>
References: <b6d73fa90702141745k3326bc2ei2c202cf91ca30bd6@mail.gmail.com>
	<20070215030134.5bac19da.michel@mitch-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070215030134.5bac19da.michel@mitch-it.com>
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

Michel van der Klei a =E9crit :
> On Wed, 14 Feb 2007 20:45:41 -0500 TheNokia <nokiairc@gmail.com> wrote:
>=20
>>debian:/glftpd/ftp-data/users# modprobe ipt_iprange
>>modprobe: Can't locate module ipt_iprange
>>
>>My version kernel is 2.4.27-2-386
>=20
> It's like i said in my previous mail ..... you'll need kernel=20
> 2.6.18 for the ipt_iprange module _without_ patch-o-matic.

Actually the iprange match support is included in all standard 2.6=20
kernels, since version 2.6.0. But indeed you need to patch the kernel=20
sources in order to add this feature to a 2.4 kernel.

