From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Newbie: need help with table rules
Date: Sat, 15 Feb 2003 02:44:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302150244.23476.netfilter@newkirk.us>
References: <3E4C9197.6000806@mega-bucks.co.jp>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E4C9197.6000806@mega-bucks.co.jp>
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
To: Jean-Christian Imbeault <jc@mega-bucks.co.jp>, netfilter@lists.netfilter.org

On Friday 14 February 2003 01:49 am, Jean-Christian Imbeault wrote:
> I've written my first set of iptable rules but they're still buggy =3D)
> I keep locking myself out. So I'm trying to enable logging to see why
> I can't SSH to my box but I can't seem to get logging to work.
>
> I have set the default policy to DROP and added only ACCEPT rules, so
> nothing gets DROPPED or REJECTED before making to the last (logging)
> rule. The last rule should LOG anything that didn't match ... but I
> can't find any iptables entries in /var/log/messages ...
>
> Two questions:
>
> #1 why isn't logging working

Check /etc/syslog.conf, which controls what messages are logged, and=20
where.  You should probably try inserting something like this:

> #2 What is wrong with my rules :)
>
>
> My network setup is like this:
>
>
> LAN ---- FIREWALL ---- WAN
>
>
> JC        LINUX
>
> I don't control the Firewall. But it's settings are fine I think since
> I can connect from JC <-> LINUX just fine. But if I try my iptable
> rules I lock myself out.
>
> The services I'd like to allow access to are:
>
> HTTP, HTTPS, SMTP, DNS from anywhere and
> SSH from JC --> LINUX
>
> My rules are:
>
> IPT=3D"/usr/local/sbin/iptables"
> LINUX=3D"x.x.x.x"
> JC=3D"x.x.x.x"
>
> for i in filter
> do
>    $IPT -t $i -F
>    $IPT -t $i -X
> done
>
> $IPT --policy INPUT   DROP
> $IPT --policy OUTPUT  DROP
> $IPT --policy FORWARD DROP
>
> # Loopback accepts everything
> $IPT -A INPUT  -i lo   -j ACCEPT
> $IPT -A OUTPUT -o lo   -j ACCEPT
>
> # Allow all other icmp
> $IPT -A INPUT  -p icmp -j ACCEPT
>
> # Allow previously established connections
> $IPT -A OUTPUT -m state --state ESTABLISHED,RELATED        -j ACCEPT
>
> # HTTP, HTTPS
> $IPT -A INPUT  -p TCP -s 0/0 -i eth0 -d $LINUX --dport 80  -j ACCEPT
> $IPT -A INPUT  -p TCP -s 0/0 -i eth0 -d $LINUX --dport 443 -j ACCEPT
>
> # SSH FROM JC --> LINUX
> $IPT -A INPUT  -p TCP -s $JC -i eth0 -d $LINUX --dport 22  -j ACCEPT
>
> # SMTP
> $IPT -A INPUT  -p tcp --dport 25 --syn -m limit --limit 1/s
> --limit-burst 10 -j ACCEPT
> $IPT -A INPUT  -p tcp --dport 25 -j ACCEPT
>
> # DNS
> $IPT -A INPUT  -p tcp --dport 53 -j ACCEPT
> $IPT -A INPUT  -p udp --dport 53 -j ACCEPT
>
> # LOG anything that didn't get accepted ...
> $IPT -A INPUT  -p tcp --syn -m limit --limit 5/minute -j LOG
> --log-level debug --log-prefix "Firewalled packet:"
>
> My /etc/syslog.conf has this entry to send all debug messages to
> /var/log/firewall:
>
> kern.debug /var/log/firewall
>
> Yet even when I telnet to my machine I don't see any iptables related
> messages ...
>
> What did I miss to get logging enabled? (and if anyone can spot why I
> can't SSH to my box from my PC (JC) please let me know ;)
>
> Thanks,
>
> Jc


