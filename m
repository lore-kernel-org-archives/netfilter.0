From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Load Balancers and conn_track
Date: Wed, 13 Apr 2005 13:47:59 +0200
Message-ID: <1403218a05041304471c9f17c7@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

If I have two servers (say web servers) located behind a layer4
switch, that act as a load balancer.
server1 and server2 have the IPs (say) 1.2.3.4 & 1.2.3.5
and the load balancer is  1.2.3.6
Of course the DNS of the sites will point to 1.2.3.6 and clients from
outside will see this.
Now, will conntrack understand that the replies from 1.2.3.4 are
really established connections that were destined for 1.2.3.6 ??

If not, any tips ?


--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

