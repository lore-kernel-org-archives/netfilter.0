From: SaVaGE <pc-secure@home.nl>
Subject: Re: Problems removing rules
Date: Thu, 1 May 2003 05:02:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305010502.48739.pc-secure@home.nl>
References: <20030501000717.46647.qmail@web14308.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030501000717.46647.qmail@web14308.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

Op donderdag 1 mei 2003 02:07, schreef Intercomax:
> I'm having a huge problem:
>
> I have those rules:
>
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> DNAT       tcp  --  anywhere             anywhere
>      tcp dpt:www
> to:192.168.0.1:80
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> MASQUERADE  all  --  anywhere             anywhere
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
> I inserted iptables -t nat -I PREROUTING -s
> xxx.xxx.xxx.xxx -j RETURN
>
> OK. The rules works fine.
>
> Then I removed the RETURN iptables -t nat -D
> PREROUTING -s
> xxx.xxx.xxx.xxx -j
> RETURN and... The IP still access some pages that
> accessed before!
>
> Why?
>
> I need to redirect all internal requests to a specific
> page and then,
> after a
> login, masquerade them to the Internet...
>
> That's it.
>
> Thanks in advance.
>
> Maur=EDcio S. Mudrik
>
> _______________________________________________________________________
> Yahoo! Mail
> O melhor e-mail gratuito da internet: 6MB de espa=E7o, antiv=EDrus, ace=
sso
> POP3, filtro contra spam. http://br.mail.yahoo.com/

As far I can see by your rules , your running a Web-server on 192.168.0.1=
:80 =20
, not specific a rule to aply local acces to the internet.

But as i see the POSTROUTING chain , i miss something namely your output=20
interface !!  like this ::;
Chain POSTROUTING (policy DROP)
num  pkts bytes target        prot       opt      in   out     source    =
 =20
  *        *     * MASQUERADE  all  --  *         *    eth0    0.0.0.0/0 =
          =20

destination
0.0.0.0/0

what about that login , i think Squid could do something like that , so y=
ou=20
have to use a proxy for that.

Pascal

