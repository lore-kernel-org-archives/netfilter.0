From: "Khoa Nguyen" <KNguyen@MEGISTO.com>
Subject: How to log redirected packets
Date: Wed, 8 Sep 2004 18:42:47 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <AD3C7008DB448D42ABA9346FE715E8340D335D@megisto-e2k.megisto.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Hi,

I have the following in the nat table:

[root@jungle log]# iptables -t nat -L -v
Chain PREROUTING (policy ACCEPT 6 packets, 547 bytes)
 pkts bytes target     prot opt in     out     source
destination        =20
    2   120 REDIRECT   tcp  --  any    any     anywhere
anywhere           tcp dpt:http redir ports 8081=20
    0     0 REDIRECT   tcp  --  any    any     anywhere
172.16.6.5         tcp dpt:rtsp redir ports 8081=20
    0     0 REDIRECT   tcp  --  any    any     172.16.6.5
anywhere           tcp spt:rtsp redir ports 8081=20
    0     0 REDIRECT   tcp  --  any    any     anywhere
172.16.6.6         tcp dpt:rtsp redir ports 8081=20
    0     0 REDIRECT   tcp  --  any    any     172.16.6.6
anywhere           tcp spt:rtsp redir ports 8081=20


Now I would like to log all redirected packets to a file. How do I do
that? I did try the following but it didn't work:

iptables -t nat -A PREROUTING -j LOG --log-level debug

It only logged message destined to its local interface.

Thanks,

Khoa Nguyen

