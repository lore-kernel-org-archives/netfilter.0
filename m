From: SBlaze <dagent.geo@yahoo.com>
Subject: RE: ip_conntrack: table full, dropping packet. SAY WHA????
Date: Tue, 9 Sep 2003 17:53:32 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030910005332.65495.qmail@web40210.mail.yahoo.com>
References: <7C9884991ADAE0479C14F10C858BCDF52E368D@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF52E368D@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>, nf <netfilter@lists.netfilter.org>

Thanks a buntch Daniel

I boosted it up to 10,000 and that seems to have stopped the problem for now.

SBlaze


--- Daniel Chemko <dchemko@smgtec.com> wrote:
> This is telling me that you are trying to send out requests for more
> servers than you have available conntrack entries.
> 
> # This tell you how many sessions arte open right now.
> cat /proc/net/ip_conntrack | wc -l
> # This tells you the maximum number of conntrack entries you can have in
> total
> cat /proc/sys/net/ipv4/ip_conntrack_max
> 
> Once the previous number hits beyond the latter, you should start seeing
> these messages. I would increase the latter number by calling:
> 
> echo "<some_bigger_number>" > /proc/sys/net/ipv4/ip_conntrack_max
> 
> or if you want it to span reboots, you can place the following in
> /etc/sysctl.conf
> 
> sys.net.ipv4.ip_conntrack_max = <some_big_number>
> 
> 
> -----Original Message-----
> From: SBlaze [mailto:dagent.geo@yahoo.com] 
> Sent: Tuesday, September 09, 2003 3:54 PM
> To: nf
> Subject: ip_conntrack: table full, dropping packet. SAY WHA????
> 
> I have a single windows machine NATED behind my Linux
> router/gateway/firewall.
> I use iptables 1.2.8
> 
> info on the module I found is this
> 
> root@kingscross:/var/www/n00b# modinfo ip_conntrack
> filename:
> /lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_conntrack.o
> description: <none>
> author:      <none>
> license:     "GPL"
> parm:        hashsize int
> 
> I like to play CounterStrike. When I update the list from Master Servers
> 
> I get this in my /var/log/messages file and it's sent to STDOUT
> 
> Sep  8 22:18:06 kingscross kernel: NET: 347 messages suppressed.
> Sep  8 22:18:06 kingscross kernel: ip_conntrack: table full, dropping
> packet.
> Sep  8 22:18:11 kingscross kernel: NET: 392 messages suppressed.
> Sep  8 22:18:11 kingscross kernel: ip_conntrack: table full, dropping
> packet.
> Sep  8 22:18:16 kingscross kernel: NET: 371 messages suppressed.
> Sep  8 22:18:16 kingscross kernel: ip_conntrack: table full, dropping
> packet.
> Sep  8 22:18:21 kingscross kernel: NET: 414 messages suppressed.
> Sep  8 22:18:21 kingscross kernel: ip_conntrack: table full, dropping
> packet.
> Sep  8 22:18:26 kingscross kernel: NET: 467 messages suppressed.
> Sep  8 22:18:26 kingscross kernel: ip_conntrack: table full, dropping
> packet.
> Sep  8 22:18:31 kingscross kernel: NET: 436 messages suppressed.
> Sep  8 22:18:31 kingscross kernel: ip_conntrack: table full, dropping
> packet.
> 
> The suppressed messages vary..but what gives here? Here are my UDP rules
> for
> refference.
> 
> # UDP Filters
> #
> #iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j LOG
> iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j DROP
> iptables -A INPUT -p udp -i eth0 -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> 
> If someone could explain thhis to me I would appreciate it.
> 
> Thanks 
> SBlaze
> 
> =====
> In the absence of order there will be chaos.
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free, easy-to-use web site design software
> http://sitebuilder.yahoo.com
> 


=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

