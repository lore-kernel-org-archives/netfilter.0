From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Adding listening ports
Date: Tue, 29 Jul 2003 13:16:35 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E35F4@alderaan.smgtec.com>
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
To: Richard Plana <rplana@zicorp.com>, netfilter@lists.netfilter.org

The DNAT operation happens firstly so the INPUT rule needs to refer to
port 22 since the address/port mangle has already occurred.

Secondly, instead of DNAT, you could have used the redirect jump
instead.

-----Original Message-----
From: Richard Plana [mailto:rplana@zicorp.com]=20
Sent: Tuesday, July 29, 2003 12:07 PM
To: netfilter@lists.netfilter.org
Subject: Adding listening ports

Hi,

Because of (overly?) strict security policies at our company, one can=20
only make TCP connections to ports 80 and 443. I was wondering if=20
netfilter could be used to redirect packets destined for port 443 to the

listening sshd daemon on port 22 on an external machine.

I tried "iptables -I RH-Lokkit-0-50-INPUT 5 -p tcp -m tcp --dport 443 =20
--syn -j ACCEPT" (I'm using RedHat's default config) and "iptables -t=20
nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination=20
127.0.0.1:22" to do the actual routing, but that didn't seem to work:

$ ssh -p 443 localhost
ssh: connect to host localhost port 443: Connection refused

Suggestions would be appreciated.
--=20


*Richard Neal Plana, B.Sc., CCNA*
Lead Software Engineer
Zi Corp.



