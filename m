From: Erik =?iso-8859-1?Q?Wikstr=F6m?= <eriwik@itstud.chalmers.se>
Subject: Routing and PREROUTING
Date: Mon, 12 Jul 2004 16:58:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040712145806.GA30044@itstud.chalmers.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi again

I'm probably thinking to much here but I've got a bit of a problem with
allowing traffic from my local network out to the Internet. Currently
I've got the following rules which should do that:

# Allow traffic from LAN to WAN
$IPT -t nat -A PREROUTING -i $LAN -s $LOCAL_NET -j ACCEPT
$IPT -t filter -A FORWARD -i $LAN -o $WAN -s $LOCAL_NET -j ACCEPT
$IPT -t nat -A POSTROUTING -o $WAN -s $LOCAL_NET -j MASQUERADE

My problem is with the first rule, where I'm uding the "nat" table but
I'm not doing any NATing, more like filtering since I only pass some
packets. And filtering is not supposed to be done in the "nat" table but
on the other hand there is no filter table in PREROUTING.

But the alternative would be to have a ACCEPT policy in the
PREROUTING-chain and do all the filtering in the FORWARD-chain, which is
kind of unnecessary since a number of packets would then have to travel
through a number of rules (larger than the number of rules in the
PREROUTING-chain) just to be droped in the end. So is my rule OK to use
or would you do in any other way?

--
Erik Wikstr=F6m

