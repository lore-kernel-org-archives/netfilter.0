From: "Andy Lego" <legoandy@gmail.com>
Subject: Dual-home and forward outgoing requests
Date: Thu, 2 Mar 2006 08:33:55 -0500
Message-ID: <a46d47540603020533v6093ac9et4a1f3677e0f490cc@mail.gmail.com>
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

Hello,

I have a dual-homed network. Is there any way to tell iptables to
forward all requests for specific service, that come from one
interface, to go back out on the same interface?

Right now I have simply:

-A POSTROUTING -o eth0 -j MASQUERADE
-A POSTROUTING -o eth1 -j MASQUERADE

So, what am I missing?

Thank you.

--
http://legoandy.com

