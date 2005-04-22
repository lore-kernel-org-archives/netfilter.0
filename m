From: "Andreas Mimz" <Andreas.Mimz@kos2.de>
Subject: route all internet traffic through dummy device?
Date: Fri, 22 Apr 2005 09:48:59 +0200 (CEST)
Message-ID: <21722.212.18.18.20.1114156139.squirrel@212.18.18.20>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello there!

I'm trying to route all internet traffic through a dummy network device.
Unfortunately, I wasn't able to do that yet :-(

my setup is:

eth0: 172.20.39.1 (netmask 255.255.255.0)
dummy0: 172.25.79.1 (netmask 255.255.255.0)
ppp0: <dynmic-ip>

currently, all outgoing traffic from the clients (connected to eth0) is
masqueraded and then send via the ppp0 device. what I'm trying to do is
that outgoing data through ppp0 is first routed through dummy0, basically
just adding one hop.

can anybody point me to the right direction?

thanks in advance,

andreas


