From: "=?iso-8859-1?q?Maur=EDcio=20S=2E?= Mudrik" <mudrik@intercomax.com.br>
Subject: Problems removing rules
Date: Wed, 30 Apr 2003 20:58:00 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030430235716.49E371B9927@server.aeroshopping.net>
References: <20030426173540.JVCG1380.lakecmmtao03.coxmail.com@vaio> <1051736666.14478.4.camel@il.npn>
Reply-To: mudrik@intercomax.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051736666.14478.4.camel@il.npn>
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
DNAT       tcp  --  anywhere             anywhere           tcp dpt:www=20
to:192.168.0.1:80

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

I inserted iptables -t nat -I PREROUTING -s xxx.xxx.xxx.xxx -j RETURN

OK. The rules works fine.

Then I removed the RETURN iptables -t nat -D PREROUTING -s xxx.xxx.xxx.xxx =
-j=20
RETURN and... The IP still access some pages that accessed before!

Why?

I need to redirect all internal requests to a specific page and then, after=
 a=20
login, masquerade them to the Internet...

That's it.

Thanks in advance.

Maur=EDcio S. Mudrik

