From: Ben Russo <ben@umialumni.com>
Subject: Re: arptables
Date: 22 Nov 2002 11:01:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037980891.14335.5.camel@ben.mis.tnsi.com>
References: <200211152128.58239.sysadmin@hnoe1.sth.ac.at>
	 <047701c28f97$895afb30$ac01a8c0@monday>
	 <1037960290.8909.1.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037960290.8909.1.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Toshihiro Sonoda <toshihiro@jp.fujitsu.com>, netfilter@lists.netfilter.org

On Fri, 2002-11-22 at 05:18, Cedric Blancher wrote:
> Le mar 19/11/2002 =E0 07:47, Toshihiro Sonoda a =E9crit :
> > I can find the arp_filter.c and arp_tables.c in "net/ipv4/netfilter/" o=
f kernel tree (2.4.18).
> > But, I can not find the document about how to use the arp filtering.
> > How can I use the arp filtering in linux.
>=20
> Akaik, there's still no userland tool to configure ARP filtering into
> kernel (aka arptables tool) and associated library.
>=20
> So the first step would be implementing kernel/userland interface...

Just a half baked idea....

I havent tested this, but the /etc/ethers (man 5 ethers)
is used for storing arp cache information statically, like /etc/hosts
in /etc/rc.local you could call:

/sbin/arp -f /etc/ethers

The /etc/ethers file might contain:
	00:08:02:88:88:88 10.10.10.10

If you had no 10.10.10.10 anywhere on your network!
Then you could set rules in your iptables that DROP all 10.10.10.10=20
packets from source and destination, in all tables.

From the "arp" man page "If the temp flag is
              not supplied entries will be permanent stored  into
              the ARP cache."

-Ben.



