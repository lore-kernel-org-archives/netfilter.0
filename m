From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: ip alias
Date: Tue, 28 Sep 2004 00:57:23 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096351043.4158fd43638a8@webmail2>
References: <002a01c4a509$74f94b40$936ffea9@alpha>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002a01c4a509$74f94b40$936ffea9@alpha>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: John Black <black@arbbs.net>
Cc: netfilter@lists.netfilter.org

Quoting John Black <black@arbbs.net>
Date: Mon, 27 Sep 2004 22:15:50

> I'm tryint to setup ip alias with iptables on fedora core 2.
> 
> Is this right?  For some reason it will not let me out?
> 
> ifconfig eth0:0 192.168.1.23 netmask 255.255.255.0
> iptables -t nat -A PREROUTING -d 192.168.1.23 -i eth0 \
>                 -j DNAT --to-destination 161.31.31.23

Not quite sure what are you trying to do with above.  You don't need iptables to
set up an alias.  The ifconfig or ip commands will suffice.

What do you want to achieve with iptables command?  What it will do is that all
packets addressed for 192.168.1.23 that arrive into box (not generated on the
box) on interface eth0 will be sent to 161.31.31.23 (with that IP address as
destination).  Is that what you wanted to do?

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7



