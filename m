From: "Gavin Henry" <ghenry@suretecsystems.com>
Subject: Re: Why do I have 'MARK' all over my logs?
Date: Fri, 10 Jun 2005 12:03:27 +0100 (BST)
Message-ID: <33734.193.195.148.66.1118401407.squirrel@webmail.suretecsystems.com>
References: <42A972F7.1020101@compugenic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A972F7.1020101@compugenic.com>
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
To: netfilter@lists.netfilter.org

<quote who="CompuGenic">
> Hello all.
> I use a basic iptables ruleset to perform SNAT on all outgoing
> connections from my LAN, and to drop all NEW connections coming from the
> Internet.
> However, my logs are constantly filled with entries as follows:
> Jun 9 8:51:12 host -- MARK --
> Jun 9 9:11:12 host -- MARK --
> Jun 9 9:31:12 host -- MARK --
> Jun 9 9:51:12 host -- MARK --
> Jun 9 10:11:12 host -- MARK --
> Jun 9 10:31:12 host -- MARK --
>
> Notice the time patterns? I have no idea where these are coming from? Is
> there a way to know if it's from my firewall, or to track the source?

Hi Pablo,

You can switch this off in your /etc/init.d/syslogd or on RH based systems
in /etc/sysconfig/syslog

e.g.

# Options to syslogd
# -m 0 disables 'MARK' messages.
# -r enables logging from remote machines
# -x disables DNS lookups on messages recieved with -r
# See syslogd(8) for more details
SYSLOGD_OPTIONS="-m 0"

HTH.




-- 
Kind Regards,

Gavin Henry.
Managing Director.

T +44 (0) 1224 279484
M +44 (0) 7930 323266
F +44 (0) 1224 742001
E ghenry@suretecsystems.com

Open Source. Open Solutions(tm).

http://www.suretecsystems.com/

