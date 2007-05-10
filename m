From: Bas Verhoeven <netfilter@bserved.nl>
Subject: Re: iptables NAT routing issues
Date: Thu, 10 May 2007 22:06:00 +0200
Message-ID: <46437B28.5000805@bserved.nl>
References: <4640E893.1010206@bserved.nl>	<Pine.LNX.4.61.0705090024450.2342@yvahk01.tjqt.qr>	<4640FAD0.9050301@plouf.fr.eu.org>	<Pine.LNX.4.61.0705090036060.2342@yvahk01.tjqt.qr>	<4640FDA9.5000706@bserved.nl>	<464101DA.4070102@plouf.fr.eu.org>	<46432A84.2010409@bserved.nl>
	<464372FE.1070802@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <464372FE.1070802@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Pascal Hambourg wrote:
> Which option did you choose ?
We still have the outbound server DNAT-ing connections to the 
webserver's ip, that worked fine.
On the webserver we now mark all outgoing web packets:

# iptables -t mangle -A OUTPUT -s <webserver_inner_ip> -p tcp --sport 80 
-j MARK --set-mark 2

And we use iproute2 to forward them back to the outbound server:

# ip rule add fwmark 2 pref 10 table web.out
# ip route add default via <outbound_box_ip> dev eth0 table web.out

Couldn't test with CONNMARK, as the box doesn't ship with that, but MARK 
works great for now.

I did test your last option too, but that just didn't work and sounded 
very hacky-ish, not something we could rely on, even if it worked.

