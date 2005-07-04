From: Lluis Batle <viriketo@gmail.com>
Subject: Problem with routing decisions, and multihop
Date: Mon, 4 Jul 2005 17:32:40 +0200
Message-ID: <45219fb0050704083253774af5@mail.gmail.com>
References: <45219fb00507040715442f52cf@mail.gmail.com>
	<45219fb00507040732192b77e0@mail.gmail.com>
	<200507041007.06513.rob0@gmx.co.uk>
	<200507041010.13653.rob0@gmx.co.uk>
	<45219fb005070408323197bfa4@mail.gmail.com>
Reply-To: Lluis Batle <viriketo@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45219fb005070408323197bfa4@mail.gmail.com>
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

No, everything is right in its output:
1.1.1.1 via 192.168.16.2 dev eth1  src 192.168.16.1
    cache  mtu 1500 advmss 1460 metric10 64
2.2.2.2 via 192.168.17.2 dev eth2  src 192.168.17.1
    cache  mtu 1500 advmss 1460 metric10 64
3.3.3.3 via 192.168.16.2 dev eth1  src 192.168.16.1
    cache  mtu 1500 advmss 1460 metric10 64
4.4.4.4 via 192.168.17.2 dev eth2  src 192.168.17.1
    cache  mtu 1500 advmss 1460 metric10 64
5.5.5.5 via 192.168.16.2 dev eth1  src 192.168.16.1
    cache  mtu 1500 advmss 1460 metric10 64
6.6.6.6 via 192.168.17.2 dev eth2  src 192.168.17.1
    cache  mtu 1500 advmss 1460 metric10 64
7.7.7.7 via 192.168.16.2 dev eth1  src 192.168.16.1
    cache  mtu 1500 advmss 1460 metric10 64
8.8.8.8 via 192.168.17.2 dev eth2  src 192.168.17.1
    cache  mtu 1500 advmss 1460 metric10 64
9.9.9.9 via 192.168.16.2 dev eth1  src 192.168.16.1
    cache  mtu 1500 advmss 1460 metric10 64
10.10.10.10 via 192.168.17.2 dev eth2  src 192.168.17.1
    cache  mtu 1500 advmss 1460 metric10 64

About the 16.x and 17.x addresses... yes, there are other routers,
which make NAT (192.168.16.2 and 192.168.17.2) to internet.

On 7/4/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Monday 04 July 2005 10:07, I wrote:
> > Are multiple "ip route get ip.add.re.ss" commands in sequence showing
> > routes out the same interface?
>
> for X in `seq 10` ; do /sbin/ip route get $X.$X.$X.$X ; done
> --
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>
>

