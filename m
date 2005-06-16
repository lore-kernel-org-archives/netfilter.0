From: Jason Opperisano <opie@817west.com>
Subject: Re: multiport
Date: Thu, 16 Jun 2005 10:16:52 -0400
Message-ID: <20050616141652.GA27648@bender.817west.com>
References: <1118930391.16084.2.camel@debianbox>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1118930391.16084.2.camel@debianbox>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Jun 16, 2005 at 04:59:51PM +0300, Sadus . wrote:
> Hello i want to drop ALL connections on my internal NIC except:
> 20,21,80,443
> is this correct? (although not working)
> 
> 
> iptables -A INPUT -i eth1 -s 172.16.3.0/16 -p tcp -m multiport !
> --destination-port  20,21,80,443 -j DROP #USERS
> 
> which basicaly means if source is in 172.16.3.0 then drop all except for
> HTTP,FTP,HTTPS. that's in order for that IP range to not be able to
> connect to Instant Messenging services such as MSN, AIM, Yahoo etc...
> while keeping other IP ranges be able to use them.

unless you're trying to keep them from connecting to MSN, AIM, Yahoo etc
on your firewall vs. hosts on the internet, you want those rules in
FORWARD, not INPUT.  also, it's often much more logical to explicitly
allow what you want and then deny everything else vs. using negation in
your rules.  so *i* would do this:

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

  iptables -A FORWARD -i eth1 -p tcp -s 172.16.3.0/16 \
    -m multiport --dports 21,80,443 -j ACCEPT

  iptables -A FORWARD -i eth1 -p tcp -s 172.16.3.0/16 -j DROP

keep in mind that most messenger apps (i know msn does this) will
connect to a proxy at microsoft over port 80 if its default port (TCP
1863) is blocked.  the proper way to stop this is to force all TCP port
80 traffic through an application-level proxy such as squid.

-j

--
"Cult Leader: Are you a confused adolescent desperately seeking
 acceptance from an undifferentiated ego mass that demands conformity?"
        --Family Guy

