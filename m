From: Ralf Braga <ralf@4linux.com.br>
Subject: PPTP
Date: Tue, 28 Oct 2003 14:36:49 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F9E9B21.9020801@4linux.com.br>
Reply-To: ralf@4linux.com.br
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi Friends,

A have a Gateway Gnu/Linux, Debian 3.0 rc1  with kernel 2.4.22, iptables=20
1.2.8-8 and freeswan 2.02 in S=E3o Paulo and i have another Linux in=20
Rio-de-Janeiro with Red-Hat 6.2, ipchains and the path-pptp. Clients in=20
S=E3o Paulo have to conect in Rio-de-Janeiro throught PPTP and the problem =

its that the Server in Rio accepts only one connection.

In my Firewall here in S=E3o Paulo i'm put only one rule just to do the tes=
ts:

iptables -t nat -A POSTROUTING -j MASQUERADE

The chains in my FIREWALL are ACCEPT

Have I enable any rule or patch in kernel ?

I would like to know whats going on, cause the server in RIO just ACCEPT=20
one connection. There is something that should i do? ... rules... path=20
in my kernel.....



Thank you very much




