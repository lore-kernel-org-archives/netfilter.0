From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: MAC address and iptables
Date: Sun, 29 Feb 2004 16:16:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402291616.53538.Antony@Soft-Solutions.co.uk>
References: <4041ED0A.9070001@stupar.homelinux.net> <200402291555.02977.Antony@Soft-Solutions.co.uk> <40420D1E.7090400@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40420D1E.7090400@stupar.homelinux.net>
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
To: Netfilter-List <netfilter@lists.netfilter.org>

On Sunday 29 February 2004 4:02 pm, Sasa Stupar wrote:

> What I want is to accept connections only from those listed in the rules
> and drop others. But with the current config it accepts connectins also
> from others which are not in the rules.

In that case, either:

a) add the -s a.b.c.d -m mac --mac aa:bb:cc:dd:ee:ff to each rule which you 
only want to match a specific machine

or

b) put all your rules into a user-defined chain, and then jump to that chain 
only for packets which match the required IP/MAC combination:

iptables -N myrules
iptables -A myrules -p tcp --dport 21 -j ACCEPT
iptables -A myrules -p tcp --dport 23 -j ACCEPT
etc
iptables -A INPUT -s a.b.c.d -m mac --mac aa:bb:cc:dd:ee:ff -j myrules

With this design you can also easily allow more than one machine to connect if 
you wish, by adding another INPUT rule:

iptables -A INPUT -s w.x.y.z -m mac --mac uu:vv:ww:xx:yy:zz -j myrules

Regards,

Antony.

-- 
Programming is a Dark Art, and it will always be. The programmer is
fighting against the two most destructive forces in the universe:
entropy and human stupidity. They're not things you can always
overcome with a "methodology" or on a schedule.

 - Damian Conway, Perl God

                                                     Please reply to the list;
                                                           please don't CC me.


