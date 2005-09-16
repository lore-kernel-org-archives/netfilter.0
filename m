From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Limit access to one subnet?
Date: Fri, 16 Sep 2005 10:14:01 -0400
Message-ID: <65aa6af9050916071456fcc75c@mail.gmail.com>
References: <200509151546.j8FFk1di004133@nenya.memphis.edu>
	<65aa6af905091509582d1adbb0@mail.gmail.com>
	<7c65616905091606082eef6686@mail.gmail.com>
Reply-To: eantoranz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7c65616905091606082eef6686@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

That's what I meant when I said to use with care. He has to figure out
the "exact" way the firewall has to be set. If he only used those two
rules I wrote before... He'll have jumped into a deep pond of S&/T...
so to speak. :-)

On 9/16/05, Sai Kiran <saikiranrgda@gmail.com> wrote:
> hi,
>=20
> don't forget
>=20
> iptables -I INPUT -i lo -j ACCEPT
>=20
> >
> > iptables -A INPUT -s 141.225/16 -p tcp -dport 8080 -j ACCEPT
> > iptables -P INPUT DROP
>

