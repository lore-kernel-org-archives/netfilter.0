From: Sai Kiran <saikiranrgda@gmail.com>
Subject: Re: iptables stop/start vs restart ...
Date: Thu, 29 Sep 2005 17:46:58 +0530
Message-ID: <7c6561690509290516f38528a@mail.gmail.com>
References: <20050929095047.45779.qmail@web86503.mail.ukl.yahoo.com>
Reply-To: marlinspike_tom@yahoo.co.in
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050929095047.45779.qmail@web86503.mail.ukl.yahoo.com>
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
To: Chicken of the Apocalypse <satehen@btinternet.com>
Cc: netfilter@lists.netfilter.org

hi,

> /sbin/modprobe ip_conntrack hashsize=3D32767.


>/proc/sys/net/ipv4/netfilter/ip_conntrack_buckets the value is 32767.
If I run service iptables

try putting the following line into /etc/sysctl.conf


net.ipv4.netfilter.ip_conntrack_buckets =3D 32767

and try adding the following cmd to iptables script in /etc/rc.d/init.d

/sbin/sysctl -p


hope this would update the values.


regards,
kiran

