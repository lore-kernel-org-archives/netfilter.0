From: =?iso-8859-1?q?Intercomax?= <intercomax@yahoo.com.br>
Subject: Problems removing rules
Date: Wed, 30 Apr 2003 21:07:17 -0300 (ART)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030501000717.46647.qmail@web14308.mail.yahoo.com>
Reply-To: intercomax@yahoo.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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

I'm having a huge problem:

I have those rules:

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             anywhere    =20
     tcp dpt:www
to:192.168.0.1:80

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

I inserted iptables -t nat -I PREROUTING -s
xxx.xxx.xxx.xxx -j RETURN

OK. The rules works fine.

Then I removed the RETURN iptables -t nat -D
PREROUTING -s=20
xxx.xxx.xxx.xxx -j
RETURN and... The IP still access some pages that
accessed before!

Why?

I need to redirect all internal requests to a specific
page and then,=20
after a
login, masquerade them to the Internet...

That's it.

Thanks in advance.

Maur=EDcio S. Mudrik

_______________________________________________________________________
Yahoo! Mail
O melhor e-mail gratuito da internet: 6MB de espa=E7o, antiv=EDrus, acesso =
POP3, filtro contra spam.=20
http://br.mail.yahoo.com/

