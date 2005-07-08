From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Starting a fw
Date: Fri, 08 Jul 2005 08:12:08 -0500
Message-ID: <42CE7BA8.30704@gmx.co.uk>
References: <9927912d0507072234673f1aa0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d0507072234673f1aa0@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Visham Ramsurrun wrote:
> I was once told that in order to start a firewall automatically when a
> machine boots, we must make sure that the init process calls the
> script by making a symbolic link to that file in the /etc/rc.d/rcX.d
> directories.

This is not an iptables / netfilter issue. Different distros do this in 
different ways. Take this up in your distro's documentation or an 
appropriate forum.

That said ... I agree with what Robert told you.

> Let's say I have a firewall script called fw.sh with the following rules in it:

This IS a netfilter issue.

> $IPT -F
> $IPT -X
> $IPT -P INPUT DROP
> $IPT -P OUTPUT DROP
> $IPT -P FORWARD DROP
> 
> $IPT -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d 192.168.10.0/24
> -m state --state NEW,ESTABLISHED,RELATED -p icmp --icmp-type echo
> request -j ACCEPT
> 
> $IPT -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d 192.168.10.0/24
> -m state --state NEW,ESTABLISHED,RELATED -p icmp --icmp-type echo
> reply -j ACCEPT

You are only planning to relay pings on your eth0 subnet, 
192.168.10.0/24. All INPUT and OUTPUT packets are dropped, including 
loopback.

This machine won't be performing any useful network service. I strongly 
suspect that your FORWARD rules will never be hit. Are other machines on 
192.168.10.0/24 (eth0) routing through this one somehow?
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

