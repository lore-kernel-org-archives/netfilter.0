From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Packets passing trough...
Date: Thu, 14 Nov 2002 20:00:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211142000.42011.netfilter@newkirk.us>
References: <3DD2A913.9030100@sezampro.yu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DD2A913.9030100@sezampro.yu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: strenuus <strenuus@sezampro.yu>, netfilter@lists.netfilter.org

On Wednesday 13 November 2002 02:33 pm, strenuus wrote:
> Output from iptables -L -nvx
>
> ---
> Chain FORWARD (policy ACCEPT 161696 packets, 47270419 bytes)
>      pkts      bytes target     prot opt in     out     source         =
   =20
>  destination 61547  6434012             all  --  *       eth1  =20
> 192.168.0.0/24       !192.168.1.0/24 59305 36440468             all  --=
=20
> eth1    *       !192.168.1.0/24       192.168.0.0/24 20358  1239485    =
   =20
>     all  --  *       eth1    192.168.1.0/24       !192.168.0.0/24 20322=
=20
> 3148918             all  --  eth1    *      !192.168.0.0/24      =20
> 192.168.1.0/24 3241   561174             all  --  *       *     =20
> 194.106.188.0/28      192.168.0.0/24 42     5260             all  --  *=
   =20
>   *       194.106.188.0/28      192.168.1.0/24 ---
>
> How is this possible, wouldn't all packets match first 4 rules and neve=
r
> get to 6 and 7? Interface eth1 goes to internet (snat is on) and eth0 a=
nd
> eth2 are LAN (192.168.0.0 and 192.168.1.0)

What's to stop them?  You don't have any targets, so the rules are just=20
counters.  Your FORWARD policy is ACCEPT, so they get through anyway, and=
 at=20
a quick glance it looks like you have nearly the same number of packets t=
hat=20
hit policy as your rules counted, all together.

j

