From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Debian 2.6.8/bridge/iptables/passive ftp
Date: Wed, 04 Apr 2007 19:44:27 +0200
Message-ID: <4613E3FB.1030008@plouf.fr.eu.org>
References: <361462969@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <361462969@web.de>
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

spaminator@web.de a =E9crit :
>=20
> Rebooting the bridge box left me again with an unloaded
> ip_conntrack_ftp. So I made an entry in /etc/modules which caters for
> the module to be loaded on (re)boot. Strange thing that, because other
> modules related to iptables are being loaded automatically, although
> they are not compiled into the kernel too. Are there other
> "surprise"-modules that have to be loaded via /etc/modules?

Only modules related to iptables rules are loaded automatically, when=20
needed by a table, target or match in a newly created rule. Conntrack=20
and NAT helper modules for special protocols (FTP, IRC DCC, TFTP, H.323,=20
SIP...) are not related to any rule, thus not loaded automatically.

