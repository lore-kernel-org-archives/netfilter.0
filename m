From: Kai Weber <kai.weber@glorybox.de>
Subject: Re: What is missed for port forwarding
Date: Sun, 7 Mar 2004 10:40:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040307094013.GA3156@glorybox.de>
References: <20040306183657.GB836@glorybox.de> <200403061847.28569.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200403061847.28569.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

* Antony Stone <Antony@Soft-Solutions.co.uk>:

> Which machine is that (192.168.1.2)?   Is it the machine running the abov=
e=20
> rules, or another machine on yur internal LAN, with packets being routed =
by=20
> the netfilter box?

The router has 192.168.1.250, 192.168.1.2 is the box the packets should
be forwarded to.

> Do you have a FORWARD rule allowing traffic to 192.168.1.2:80?
> Do you have a rule allowing the reply packets (probably an ESTABLISHED,RE=
LATED=20
> rule)?

The 3 rules from my first mail are the only rules I have. All chain
policies are set to ACCEPT.

> What happens if you telnet to port 80 on 192.168.1.2?   Is there a servic=
e=20
> listening on that port?

Of course there is a running Apache on that port. I have no firewall on
192.168.1.2.

The strange thing: the rule for portforwarding for SSH works. The
package counter for that rules is increasing when I try to connect to
that port. But there is now response.

-- =20
  Kai Weber
=BB kai.weber@glorybox.de   http://www.glorybox.de   gpg-key: 0x594D4132

