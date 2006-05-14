From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Questions re iproute2, netfilter, and locally sourced packets
Date: Sun, 14 May 2006 23:11:07 +0200
Message-ID: <44679CEB.3040701@plouf.fr.eu.org>
References: <44677E8B.7050604@aut.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44677E8B.7050604@aut.ac.nz>
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

Ian Batterbee a =E9crit :
[...]
> ip rule add prio 1100 fwmark 0x0001 lookup vpn
[...]
> if I then display the rules, it shows (other rules omitted)
> 1100:   from all lookup vpn
>=20
> ie, the fwmark condition doesn't show in the display output. I thought=20
> that may just be a display problem when dumping the rules

The fwmark condition should show. Is the option CONFIG_IP_ROUTE_FWMARK=20
enabled in the kernel ? Or maybe your 'ip' version is too old (or too=20
recent) for your kernel version.

