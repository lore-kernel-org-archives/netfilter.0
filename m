From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Authentication in a Firewall Question
Date: Wed, 25 Aug 2004 14:50:50 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512E2@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Hello there,
>
> I'm trying to do something similar.
>
> When an enduser tries to go to Internet, the browser is redirected to =
an
> authentication page, then the webserver that contains that page =
inserts
> a rule in the firewall to allow that computer to go to Internet.
>
> It must be something like this, as no programs should be installed on
> the enduser's machine.
>
> What I was trying to do (without success) was, set a redirector policy
> that applies to the unauthenticated traffic. The thing is that
> redirection and dynamic nat are defined on different rules =
(PREROUTING,
> POSTROUTING). This is if I'm working with nat, I haven't thought of a
> way to require authentication when just routing.
>
> Some of the things I'm trying:
> ## redirector
> $IPTABLES -t nat -A PREROUTING -i $LAN_IFACE -p TCP --destination-port
> 80 -j REDIRECT --to-port 81 # The web server listens on port 81
>
> ## insert rule for each client
> $IPTABLES -t nat -I POSTROUTING -o $INTERNET_IFACE -m mac --mac-source
> $CLIENT_MAC -j MASQUERADE
>
>
> Any thoughts are welcome.

i did this for a hotel:

  iptables -t nat -A PREROUTING -i $LAN_IFACE -p tcp --syn --dport 80 -j =
authenticated
  iptables -t nat -A PREROUTING -i $LAN_IFACE -p tcp --syn --dport 80 -j =
REDIRECT --to-port 81

  iptables -N authenticated

as people authenticate, add rules to the "authenticated" chain like:

  iptables -A authenticated -s x.y.w.z -j ACCEPT

the performance hit was that the initial SYN of an HTTP request of an =
authenticated client had to go through every single other authenticated =
IP before it matched (this example was a class C, so 253 other rules).  =
i tested it with 500 rules in the authenticated chain and didnt see much =
of any performance hit...YMMV.

-j


