From: William Stearns <wstearns@pobox.com>
Subject: Re: iptables questions
Date: Mon, 17 Nov 2003 20:12:33 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0311172000020.22671-100000@sparrow>
References: <003601c3ab66$7396c360$2178df50@lanzor2k.com>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003601c3ab66$7396c360$2178df50@lanzor2k.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Korpela <antti.korpela@pp6.inet.fi>
Cc: ML-netfilter <netfilter@lists.netfilter.org>, William Stearns <wstearns@pobox.com>

Good evening, Antti,

On Sat, 15 Nov 2003, Antti Korpela wrote:

> I have here some questions and i hope you have some time to answer
> 
> 1. What difference and which is better between: iptables -t nat -j
> MASQUERADE or SNAT --to IP if im using it for internet gateway
> NAT-machine in big LAN-parties, over 300 IP:s.

	MASQUERADE is for situations where your outside IP address 
changes; most commonly used for modem connections.  If your outside 
address is static, use SNAT.
	http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-6.html

> 2. I have get this error often "too much work on eth0, dropping

	I _think_ this is a better question for the linux-net mailing 
list.  I have a sense this is an internal problem with the network card 
driver and not with netfilter.
	You might see if a newer kernel is available, or even consider 
using the 2.6.x test kernels; they're probably able to scale better.

> packet..." what this mean? do i have to put this on kernel: echo "65000"
> > /proc/sys/net/ipv4/ip_conntrack_max ? is there any other solutions for
> this ?

	I don't think this is related.

> 3. Do you have some other tips for MASQ ? :)

	I tend to include this line in /etc/modules.conf to increase the 
connection table size (not sure if it's truly required anymore):
options ip_conntrack hashsize=16384
	Cheers,
	- Bill

---------------------------------------------------------------------------
	"Scattered showers my ass!"
	-- Noah
(Courtesy of "Michael B. Trausch" <mtrausch@wcnet.org>)
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
Linux articles at:                         http://www.opensourcedigest.com
--------------------------------------------------------------------------


