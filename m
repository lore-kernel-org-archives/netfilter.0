From: Michal Kepien <lordpopcorn@poczta.onet.pl>
Subject: Re: Firewall setup at boot - trouble with setting up the LOG target
Date: Sat, 05 Jul 2003 00:05:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sgubgvg6n5ckac25g8qs1d678vgrl0ro24@4ax.com>
References: <7C9884991ADAE0479C14F10C858BCDF52E3554@alderaan.smgtec.com> <20030704024217.5e231e71.arnt@c2i.net> <chbagvsp3mcblk39e4n5u9od1ntja2ksb1@4ax.com> <200307041112.58290.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307041112.58290.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Alistair@nerdnet.ca
Cc: netfilter@lists.netfilter.org

>	What those entries suggest to me is that there are two
>	copies of iptables code on the box.

You're correct:

(v1.2.3)
- /lib/iptables
- /sbin

(v1.2.8 - the correct one)
- /usr/local/lib/iptables
- /usr/local/sbin/iptables

>	If there is a second copy of iptables it could take some time
>	and care to sort out which files are which.... but it can be done.

OK, everything now works as it should. What I did was:

rm -rf /lib/iptables
rm -f /sbin/ip*tables*
mv /usr/local/lib/iptables /lib
mv /usr/local/sbin/ip*tables* /sbin
ln -s /lib/iptables /usr/local/lib/iptables

However, every time an iptables command is executed, the program looks
for libraries in /usr/local/lib/iptables (which is now symlinked to
/lib/iptables) - is there a way to force iptables to load its modules
directly from /lib/iptables?

Michal Kepien

