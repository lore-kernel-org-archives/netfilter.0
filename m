From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DNAT and IP aliasing - how?
Date: Tue, 11 Mar 2003 09:10:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303110910.10681.netfilter@newkirk.us>
References: <001701c2e6f4$79edee00$85200f0a@smaug>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001701c2e6f4$79edee00$85200f0a@smaug>
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
To: Henning Riis Rasmussen <hrr@indbakke.dk>, netfilter@lists.netfilter.org

On Monday 10 March 2003 06:02 am, Henning Riis Rasmussen wrote:

>   LAN0  (Local protected network)
>   WAN1  (Sister organisation)
>   INET2 (Internet)

> Hence, I need WAN1 to have more than one IP address (i.e. 10.0.0.1/24,
> 10.0.0.2/24 and 10.0.0.3/24).
>
> I assume I should use DNAT to provide the address translation needed
> for the hosts on the LAN that must be visible on the WAN. But what am
> I supposed to do about getting arp responses for the extra IP
> addresses on the WAN1 interface? I recall using the kernel IP aliasing
> option in previous setups, but this is no longer an option in kernel
> 2.4.20 (as far as I can tell).
>
> What is the "correct" way to set this up?

if WAN1 is eth0 with 10.0.0.1 presently, then try this:

ifconfig eth0:1 10.0.0.2 netmask 255.255.255.0
ifconfig eth0:2 10.0.0.3 netmask 255.255.255.0

This creates an alias on eth0 adding 10.0.0.2 as an additional IP for=20
that interface, then again for 10.0.0.3.  Obviously the root interface=20
needs to match the WAN interface.  A subsequent 'ifconfig' will show=20
these as additional interfaces on the same MAC.  Packet info (RX and TX=20
statistics) will show only on the root interface.  In an iptables rule=20
you can only use the root interface (eth0 in the above example) but can=20
still match source or dest IP to distinguish one from another in most=20
cases.

j


