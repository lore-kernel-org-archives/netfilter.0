From: Metal Gear <finattack@gmail.com>
Subject: proxy+port redirection behaviour
Date: Thu, 21 Apr 2005 16:36:34 +0600
Message-ID: <110c784405042103362108ebad@mail.gmail.com>
Reply-To: Metal Gear <finattack@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi all,

1) Dedicated Firewall
2) Server
3) Clients

It is a switched network and the 'Server' has only one interface card=20
connected to the switch. The 'Server' can only access the internet as i hav=
e=20
specially blocked the clients on the 'Dedicated Firewall'. Now what i want=
=20
is that=20

1) When clients connect to the smtp port of the 'Server' they are redirecte=
d=20
to the another smtp server on the internet. One more thing my 'Server' is=
=20
not listening on port 25 i just want to have a behaviour of port redirector=
.=20
Redirecting connections destined to the 'Serve' on port 25 to a specific=20
server on the internet.

2) Now in this case i wanted to have the behaviour of proxy server. Wheneve=
r=20
client connects to any ftp (or any other service) server on the internet=20
they are silently proxied thru the 'Server' as 'Server' can only access the=
=20
internet.

My clients gateway is set to 'Server'

Is that possible to achieve thru iptables if yes can someone give me a=20
direction or iptables script how to accompalish that.

Thanks...
