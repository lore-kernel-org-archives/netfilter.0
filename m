From: ard-netfilter@kwaak.net
Subject: Re: filtering asym. routing without "ip_conntrack: table full"?
Date: Tue, 21 Jan 2003 07:16:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030121061614.GA24090@kwaak.net>
References: <20030114093711.GC9940@westend.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030114093711.GC9940@westend.com>
Resent-To: netfilter@lists.netfilter.org
Resent-Message-Id: <E18ayv5-0000mb-00@mail.kwaak.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Jan 14, 2003 at 10:37:11AM +0100, Christian Hammers wrote:
> I have a border router that does dynamic and asymetric routing.
> Now, after upgrading from 2.4.19 to 2.4.20 yesterday I got the following 
> message in my syslog twice this night:
> 	kernel: ip_conntrack: table full, dropping packet.
> The /proc/net/ip_conntrack table has 36911 entries, mostly all [UNREPLIED].
Heh,
Next to the other replies:
If you do massive routing, or better: massive firewalling (a lot
of connections going through), always load the ip_conntrack
module with hashsize= .
If you don't, most of the connections have to be sequentially
searched in a linked list.
Default max setting of hashsize is 8192, with a maximum of 58000
connections being tracked. The maximum connections to be tracked
can be increased on the fly, but upping your hashsize to begin
with gives you certainly an extra performance boost.
(Heh, it can make your cpu system time go from 100% down to 5 or
so... At least it will make your ethernet driver be the bottle
neck)

-- 
mail          up   65+19:29,     4 users,  load 0.00, 0.02, 0.27
mistar1       up   18+15:59,     9 users,  load 0.00, 0.00, 0.01
Let your government know you value your freedom: sign the petition:
http://petition.eurolinux.org



