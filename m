From: "Eduardo Bejar" <wonka@linkabu.net>
Subject: SNAT / MASQUERADE to a different IP
Date: Thu, 9 Mar 2006 17:09:13 -0500
Message-ID: <019d01c643c6$193ab020$6bb1a8c0@veruca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

I have this setup:

LAN with one Fedora Server as gateway/email server.

Currently I masquerade all LAN traffic to use the same IP as the Server:

iptables -t nat -A POSTROUTING -s $LAN -o eth0 -j MASQUERADE

So, LAN and mail server use both the same IP address. This works fine, =
but
now I=B4d like to make the LAN use a different IP address than the mail
server, so I=B4d like to know how can I do that?

I tested SNAT, like:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to $IP

but with this, LAN and mail server now use $IP both, and what I=B4d like =
to do
is assign different IP addresses: one for the LAN and other for the mail
server.

Any thoughts about this will be very appreciated.

Thanks!

Edo





