From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: REDIRECT to localhost
Date: Mon, 16 Aug 2004 10:17:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051285@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

> iptables -t nat -A PREROUTING -i "name of interface" -p tcp -m tcp --
> dport 80 -j REDIRECT --to-ports 3129
>
> If your default policy is to DROP all INPUT/FORWARD as is it should =
be.
>
>
> iptables -A INPUT -i "name of interface" -p tcp -m tcp --dport 80 -j
> ACCEPT

in this case--where you have ppp[0-9], you can also use the "+" notation =
to avoid having 10 rules that do the same thing; i.e.,=20

  iptables -t nat -A PREROUTING -i ppp+ -p tcp -m tcp --dport 80 -j =
REDIRECT --to-ports 3129

will match any ppp interface.

> You can also use -s "ip address" instead of -i  "name of interface".

or both...

-j

