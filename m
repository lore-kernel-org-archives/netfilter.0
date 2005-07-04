From: "John Sasso Jr" <jsassojr@nycap.rr.com>
Subject: RE: Problem w/ iptables on FC3
Date: Mon, 4 Jul 2005 14:36:03 -0400
Message-ID: <001701c580c7$3c53cfa0$644ba8c0@sassoj>
References: <200507040949.36383.rob0@gmx.co.uk>
Reply-To: jsassojr@nycap.rr.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <200507040949.36383.rob0@gmx.co.uk>
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
To: '/dev/rob0' <rob0@gmx.co.uk>, netfilter@lists.netfilter.org

Thank-you for the helpful response!

I'm curious - for the sample configuration I gave in my original posting,
why would:

iptables -A OUTPUT -o eth0 -s 192.168.50.100 -p icmp --icmp-type
echo-request -j ACCEPT

fail to permit a packet originating from my system out?  I understand what
"iptables -P OUTPUT ACCEPT" does, and I am not arguing the logic behind
using that instead for my situation, but I'm wondering if packet filtering
operates differently for traffic originated by a firewall as opposed to
traversing a firewall.

I looked through the Packet Filtering HOWTO, as well as Ziegler's "Linux
Firewalls" book but could not find an answer.  Thanks!

--john


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of /dev/rob0
> Sent: Monday, July 04, 2005 10:50 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: Problem w/ iptables on FC3
>
>
> On Monday 04 July 2005 09:25, John Sasso wrote:
> > avail. Is this a bug?
>
> Not likely.
>
> > iptables --policy OUTPUT   DROP
>
> Don't do this. How do you think it will help? Do you have untrusted
> local shell users? If so, you are doomed anyway. They will find an
> opening, get root, and get out as they wish. If it's just you on the
> machine, OUTPUT filtering is silly. Use self-control, not netfilter.
>
> iptables -P OUTPUT ACCEPT
>
> For the return packets, go stateful. An example is posted in
> the thread
> earlier today, Subject: help me. It's also given and explained in the
> Packet Filtering HOWTO.
> --
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>
>



