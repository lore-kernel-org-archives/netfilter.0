From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: how to set ports for ip_conntrack_ftp
Date: Thu, 31 Aug 2006 18:44:04 +0200
Message-ID: <44F711D4.5090002@plouf.fr.eu.org>
References: <20060831151130.GA32342@freesources.org>	<000601c6cd14$e07a28a0$0101000a@tanjian>
	<20060831155749.GC32342@freesources.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060831155749.GC32342@freesources.org>
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
To: Netfilter-Users <netfilter@lists.netfilter.org>

Hello,

'Jonas Meurer' a =E9crit :
>=20
> in other words, this module is unusable for ftpservers on non-standard
> ports, if it's compiled into the kernel?

Well, I guess you can edit the default port list in the kernel source=20
before compiling.

> how can i open the ports for those ftp-servers without using
> ip_conntrack_ftp?

There is a workaround, which requires that the FTP server software be=20
"cooperative". For instance, it must be able to set a range of local=20
ports to use for data transfer connections in passive mode.

> what i'm currently doing is:
>=20
> iptables -A INPUT -i eth0 -m state --state NEW,ESTABLISHED,RELATED \
> 	-m multiport -p tcp --dports 9621,9721 \
> 	-d **.**.***.**/31 -j ACCEPT
>=20
> iptables -A OUTPUT -o eth0 -m state --state ESTABLISHED,RELATED \
> 	-m multiport -p tcp --sports 9621,9721 \
> 	-d **.**.***.**/31 -j ACCEPT
>=20
> iptables -A OUTPUT -o eth0 -m state --state NEW \
> 	-m multiport -p tcp --sports 9620,9720 \
> 	-d **.**.***.**/31 -j ACCEPT

What do the "-d **.**.***.**/31" address ranges represent ?

> but obviously this doesn't work. i still cannot connect to the
> ftpservers on port 9621 and 9721. what am i missing?

The first two rules may allow to establish an incoming control=20
connection, although the RELATED state is not needed. But the third rule=20
is not sufficient to allow the server to establish an outgoing data=20
connection in active mode. You need to add the ESTABLISHED state to=20
allow outgoing packets once the connection is established. You also need=20
to create another rule in the INPUT chain as its counterpart for the=20
return traffic, in the ESTABLISHED state.

