From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: to use or not to use stateful capabilities
Date: Mon, 5 Apr 2004 14:19:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404051419.11291.Antony@Soft-Solutions.co.uk>
References: <28662.1081169609@zworg.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <28662.1081169609@zworg.com>
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
To: netfilter@lists.netfilter.org

On Monday 05 April 2004 1:53 pm, __ Radien__ wrote:

> Antony, I made mistake in specifying the port greater than 1024, and I
> meant  >1024.

Good, but remember that not all client connections will come from source
ports >1024 - some will be from ports <=1024, so you have to allow for both.

> Anyway, for a more complex configuration same as example you wrote,
> can you tell me what is the benefit?

Suppose you have the five servers I mentioned: web, dns, ftp, mail and news.

Let's see what rules we would need:

1. Stateful

iptables -A FORWARD -i $DMZ -o $EXT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p tcp --dport 80 -d $WEB -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p tcp --dport 53 -d $DNS -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p udp --dport 53 -d $DNS -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p tcp --dport 21 -d $FTP -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p tcp --dport 25 -d $MAIL -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p tcp --dport 119 -d $NEWS -j ACCEPT

2. Non-stateful

iptables -A FORWARD -i $EXT -o $DMZ -p tcp --dport 80 -d $WEB -j ACCEPT
iptables -A FORWARD -i $DMZ -o $EXT -p tcp --sport 80 -s $WEB -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p tcp --dport 53 -d $DNS -j ACCEPT
iptables -A FORWARD -i $DMZ -o $EXT -p tcp --sport 53 -s $DNS -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p udp --dport 53 -d $DNS -j ACCEPT
iptables -A FORWARD -i $DMZ -o $EXT -p udp --sport 53 -s $DNS -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p tcp --dport 21 -d $FTP -j ACCEPT
iptables -A FORWARD -i $DMZ -o $EXT -p tcp --sport 21 -s $FTP -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p tcp --dport 25 -d $MAIL -j ACCEPT
iptables -A FORWARD -i $DMZ -o $EXT -p tcp --sport 25 -s $MAIL -j ACCEPT
iptables -A FORWARD -i $EXT -o $DMZ -p tcp --dport 119 -d $NEWS -j ACCEPT
iptables -A FORWARD -i $DMZ -o $EXT -p tcp --sport 119 -s $NEWS -j ACCEPT

... and these rules don't even allow for the second data channel on FTP, and
active connections (which are very difficult to do with non-stateful rules)

You see how the stateful version is simpler, easier to understand, and in the
case of ftp, actually makes full use of the protocol *possible*?


The other example I quoted was internal clients.   Suppose for a moment that
you want to allow internal clients to access any service they like out on the
Internet.

1. The stateful version:

iptables -A FORWARD -i $EXT -o $LAN -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $LAN -o $EXT -j ACCEPT

2. The non-stateful version:

iptables -A FORWARD -i $LAN -o $EXT -j ACCEPT
... and then you have to work out a way for reply packets to come in from
the outside, without simply opening up your entire network to the Internet
using a rule such as:

iptables -A FORWARD -i $EXT -o $LAN -j ACCEPT

I really wouldn't know how to do this securely, therefore I always use
stateful rules for the reply packets.

Hopefully this answers your question?

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


