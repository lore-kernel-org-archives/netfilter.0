From: "Alex Bennee" <alex@bennee.com>
Subject: Re: Should forwarded packets ever hit the OUTPUT chain?
Date: Fri, 8 Nov 2002 09:53:42 -0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <37149.217.42.120.194.1036749222.squirrel@www.bennee.com>
References: <20021108092009.TZSK3711.mta02-svc.ntlworld.com@there>
Reply-To: alex@bennee.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021108092009.TZSK3711.mta02-svc.ntlworld.com@there>
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
To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org

Antony Stone said:
> On Friday 08 November 2002 8:31 am, alex wrote:
> <snip>
>> In trying to debug my firewall (see earlier message on the user list)
>> I can see the final rule of my to-lan chain (attached to output)
>> dropping packets when the incomming web connection hangs.
>
> What are your FORWARDing rules ?

    # FORWARD is used for NAT/MASQ stuff - anything thats not destined for
this machine
    /sbin/iptables -P FORWARD DROP

    # Now create some forwarding chains
    /sbin/iptables -N fw-to-lan
    /sbin/iptables -N fw-to-inet

    # Forwarding rules. Allow our external services access but not much else
    # Allow access to web/secure web/smtp/ssh on zheer (remember the
destination is now translated)
    /sbin/iptables -A fw-to-lan -d $ZHEER -p tcp --dport 22 -j ACCEPT
    /sbin/iptables -A fw-to-lan -d $ZHEER -p tcp --dport 25 -j ACCEPT
    /sbin/iptables -A fw-to-lan -d $ZHEER -p tcp --dport 80 -j ACCEPT
    /sbin/iptables -A fw-to-lan -d $ZHEER -p tcp --dport 443 -j ACCEPT
    /sbin/iptables -A fw-to-lan -d $ZHEER -m state --state
ESTABLISHED,RELATED -j ACCEPT
    # and stuff on TRENT (ssh:22, fileshare:6346, freenet:7000)
    /sbin/iptables -A fw-to-lan -d $TRENT -p tcp --dport 22 -j ACCEPT
    /sbin/iptables -A fw-to-lan -d $TRENT -p tcp --dport 6346 -j ACCEPT
    /sbin/iptables -A fw-to-lan -d $TRENT -p tcp --dport 7000 -j ACCEPT
    /sbin/iptables -A fw-to-lan -d $TRENT -m state --state
ESTABLISHED,RELATED -j ACCEPT

    # ESTABLISHED and RELATED connections allowed through as well
    /sbin/iptables -A fw-to-lan -d $INTNET -m state --state
ESTABLISHED,RELATED -j ACCEPT
    # Log any spoofed packets
    /sbin/iptables -A fw-to-lan -s $INTNET -m limit -j LOG --log-prefix
"[Spoofed packets from $EXTIF]"
    # and anything INVALID should get dropped
    /sbin/iptables -A fw-to-lan -d $INTNET -m state --state INVALID -j DROP

    # Dump everything else
    /sbin/iptables -A fw-to-lan -j DROP
    # enable
    /sbin/iptables -A FORWARD -o $INTIF -j fw-to-lan

    # Forwarding rules for outgoing connections - split to make debugging
easier for now
    /sbin/iptables -A fw-to-inet -s $ZHEER -p tcp --sport 22 -j ACCEPT
    /sbin/iptables -A fw-to-inet -s $ZHEER -p tcp --sport 25 -j ACCEPT
    /sbin/iptables -A fw-to-inet -s $ZHEER -p tcp --sport 80 -j ACCEPT
    /sbin/iptables -A fw-to-inet -s $ZHEER -p tcp --sport 443 -j ACCEPT
    /sbin/iptables -A fw-to-inet -s $ZHEER -j ACCEPT
    # and TRENT
    /sbin/iptables -A fw-to-inet -s $TRENT -p tcp --sport 6436 -j ACCEPT
    /sbin/iptables -A fw-to-inet -s $TRENT -p tcp --sport 7000 -j ACCEPT
    /sbin/iptables -A fw-to-inet -s $TRENT -j ACCEPT
    # and everyone else
    /sbin/iptables -A fw-to-inet -j ACCEPT
    # enable
    /sbin/iptables -A FORWARD -o $EXTIF -j fw-to-inet

    # Log anything else
    /sbin/iptables -A FORWARD -m limit -j LOG --log-prefix "[Packet lost
forwarding]"

But I never see the default FORWARD policy exercised (unsuprisingly all
traffic should end up on the fw-to-inet or fw-to-lan chains)

Alex
www.bennee.com/~alex/



