From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Using old CPU for 100s of clients
Date: Fri, 3 Dec 2004 12:22:11 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E3A1@alderaan.smgtec.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: swright@sls.bc.ca, netfilter@lists.netfilter.org

The Speed problems may not be isolated to your CPU. You'll want to make
sure your conntrack table isn't getting full, and that conntracks are
safely getting expired from your system. Are you using a custom kernel,
or a stock distro one?

Just for fun, could you forward me the following:

# cat /proc/loadavg
# free
# iostat 20 2 (sysstat package is nice for accounting)
# top (grab the CPU lines, over time is best)
# cat /proc/slabinfo
# cat /proc/net/ip_conntrack | wc -l
# hdparm /dev/<your disk(s)>
# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
# w
# netstat -i
# mii-tool

wow.. there are a lot of areas to look into.. Anyways, hope to find
something.

> Thanks.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Shawn Wright, I.T. Manager
> Shawnigan Lake School
> http://www.sls.bc.ca
> swright@sls.bc.ca

Good ol' BC boy!

