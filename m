From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Using mangle table to change source address, how?
Date: Mon, 4 Nov 2002 16:05:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211041605.54443.netfilter@newkirk.us>
References: <m3vg3d84fo.fsf@khem.blackfedora.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <m3vg3d84fo.fsf@khem.blackfedora.com>
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
To: Mark Atwood <mra@pobox.com>, Netfilter <netfilter@lists.netfilter.org>

On Monday 04 November 2002 03:28 pm, Mark Atwood wrote:
> I have an interface eth1, with an IP address 192.168.23.100
>
> I've configured eth1 to have a subinterface eth1:0, and
> have given that subinterface an IP address 172.23.1.3.
>
> There is a host on the segment that this interface is connected to
> with an IP address of 172.23.1.2.
>
> If I send packets to that host 172.23.1.2, the packets from me have a
> source address of 192.168.23.100, not 172.23.1.3!
>
> Can I use the mangle table to rewrite the source address?  If so,
> what is the iptable command line?
>
> Or is there an easier way?

It would be the NAT table, postrouting chain, not mangle.  something like=
:

/sbin/iptables -t nat -A POSTROUTING -d 172.23.1.2 -j SNAT --to-source 17=
2.23.1.3

j

