From: "Carlos Pastorino" <carlos.pastorino@gmail.com>
Subject: Re: It seems I've found why conntrack blocks some packets
Date: Tue, 4 Apr 2006 09:36:24 -0300
Message-ID: <cc4fcc140604040536l21166fd3j489ef6b1619c11b@mail.gmail.com>
References: <57F9959B46E0FA4D8BA88AEDFBE582901674BC@pxtbenexd01.pxt.primeexalia.com>
	<cc4fcc140603300601j169864eexddc8fe3dd06c1a24@mail.gmail.com>
	<442D2C8F.1020505@SCampbell.net> <442D320E.7070301@SCampbell.net>
	<cc4fcc140604011259m3ee3a19coa5aac5a34ba3f66e@mail.gmail.com>
	<442F4E53.9060501@SCampbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <442F4E53.9060501@SCampbell.net>
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
To: Steven M Campbell <Netfilter@scampbell.net>
Cc: netfilter@lists.netfilter.org

Hi Steven,

> To see how many you are using at a given moment
>
> # wc  -l /proc/net/ip_conntrack
> 16 /proc/net/ip_conntrack

I checked the conntrack table. I setup a cron job to look at it every
minute, for 24 hours. You'll be surprised: the top number, around peak
time, is:

255 /proc/net/ip_conntrack

So, it can't be the limit on the conntrack table.

I've found another clue though. When I first configured this firewall,
I enabled rp_filter, with the command below:

echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter

And I've found this text on the Internet about it:

"If instead you decide to enable forwarding, you will also be able to
modify the rp_filter setting; something which is often misunderstood
by network administrators. The rp_filter can reject incoming packets
if their source address doesn't match the network interface that
they're arriving on, which helps to prevent IP spoofing. Turning this
on, however, has its consequences: If your host has several IP
addresses on different interfaces, or if your single interface has
multiple IP addresses on it, you'll find that your kernel may end up
rejecting valid traffic. It's also important to note that even if you
do not enable the rp_filter, protection against broadcast spoofing is
always on. Also, the protection it provides is only against spoofed
internal addresses; external addresses can still be spoofed.. By
default, it is disabled."

And that's what's been happening: The firewall has been rejecting a
few valid packets.

I'll disable it and see what happens, and then I'll let you know.

By the way, do you keep rp_filter enabled or disabled?

