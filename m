From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing through Debian
Date: Tue, 17 Feb 2004 00:30:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402170030.56021.Antony@Soft-Solutions.co.uk>
References: <021A59AE3C21D649BCEA0B7802EC408A443142@quadnet_fs1.quadnet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <021A59AE3C21D649BCEA0B7802EC408A443142@quadnet_fs1.quadnet.co.uk>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Monday 16 February 2004 2:40 pm, Carlos Robles wrote:

> Hello my name is Carlos
> This is the first time I'm emailing here

Welcome.

> I'm trying to connect from my XP office computer to my Home (XP prof)
> computer (192.168.0.4).

How sad.   You have our sympathy.

> In my home I have a small network made out of 5 computers, they all 
> connect to internet through a Debian 2.4 box(private 192.168.0.5, public:
> 80.1.122.39) that I've configured to work as a router-firewall.
> I modified ip-tables so to let any connection coming to the router to port
> 3389 to redirect it to 192.168.0.4:
> iptables -t nat -I POSTROUTING -p tcp --sport 3389 -s 192.168.0.4 -j SNAT
> --to 80.1.122.39:3389
> iptables -t nat -I PREROUTING -p tcp --dport 3389 -d 80.1.122.39 -j DNAT
> --to 192.168.0.4:3389
> Commands go well, no problems.
> But still I can't connect, is there something that I'm missing?

You need the PREROUTING rule; you do not need the POSTROUTING rule.   You also 
need a FORWARD rule to allow traffic to actually get to 192.168.0.4 port 3389 
after the destination address has been changed:

iptables -A FORWARD -d 192.168.0.4 -p tcp --dport 3389 -j ACCEPT

Let us know how you get on with that.

Regards,

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


