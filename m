From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Dynamic redirection?
Date: Thu, 26 Feb 2004 00:00:01 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122EFB@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Glen Becker <solar04@comcast.net>, netfilter@lists.netfilter.org

Glen Becker wrote:
> Hello, I haven't been lurking here long but have tried the FAQs,
> tutorials and How-To's.  I'm an iptables novice.  I thought this
> would be simple; I hope I'm overlooking something obvious. =20
>=20
> I have a Linux server acting as a gateway between the internet and
> the internal network, allowing only authenticated hosts internet
> access.  I have a simple FORWARD (policy DROP) ruleset into which
> individual hosts, after authentication, are inserted and allowed
> internet access.  As each host's session time expires, the
> corresponding ACCEPT rule is removed from FORWARD.  That all works
> well.     =20

No, there isn't. The closest match to this requirement currently is a
hack to pam_iptables, or else you could scrap Linux and use checkpoint
which has it. Maybe authenication could be through a web page, but you'd
have to code all the logic yourself.

> Now I would like to do something like DNAT for http connections from
> NON-authenticated hosts to a webserver on my gateway box, but still
> let authenticated hosts through. =20
>=20
> -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to
> 192.168.2.1 unfortunately catches everything.=20
>=20
> Is there a way to "redirect" web connections only if the packet
> hasn't already been ACCEPTed for forwarding?=20
>=20

With the pam_iptables module today, the program would simply add (-A) a
single rule to the FORWARD chain. You would have to change to make the
rule insert (-I) the rule at the beginning of the chain. If you need to
DNAT traffic as well, that all has to be hacked into the pam module, or
write some scripting extensability into it.

When you are building your chains, you'll have a catch-all rule for the
defalt redirect, and since all user auth rules are getting pushed to the
front of the chain list, they will always be executed before the generic
rule, just as you want here.

