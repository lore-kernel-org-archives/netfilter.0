From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: connection tracking without iptables?
Date: Thu, 30 Sep 2004 11:19:25 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E37C@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Jiann-Ming Su <sujiannming@gmail.com>, netfilter@lists.netfilter.org

> Just trying to get an idea of the type and amount of traffic passing
> through a subnet.  I've done this before with tcpdump, but that
> required an external parsing program to reconstitute all the
> connections from the tcpdump capture.

The way I track this kind of information is from netfilter/iptables.

In the PREROUTING and POSTROUTING chains, you implement 'null' targets
to add an internal netfilter counter to the packet stream.

# Detect all outgoing web traffic from that subnet
iptables -t mangle -A PREROUTING --source ${mynet}/${mymask} -p tcp
--dport 80=20
# Return Traffic
iptables -t mangle -A PREROUTING --destination ${mynet}/${mymask} -p tcp
--sport 80

You may find this a little kludgy. I guess it is. The other alternative
is to use IP accounting packages which are pre-built to do this stuff.
You may find http://www.ntop.org/ntop.html or http://www.cacti.net/
useful if you don't feel like doing it yourself.

