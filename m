From: Mohammad Khan <mkhan@lextranet.com>
Subject: Re: net2phone rules
Date: Mon, 14 Feb 2005 17:16:07 -0500
Message-ID: <1108419367.13080.18.camel@localhost.localdomain>
References: <55503955141a.55141a555039@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <55503955141a.55141a555039@vsnl.net>
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
To: varun_saa@vsnl.net, netfilter@lists.netfilter.org

On Tue, 2005-02-08 at 01:01, varun_saa@vsnl.net wrote:
> Hello,
>       I want my firewall to allow Net2phone.
> 
> A visit to http://web.net2phone.com/consumer/commcenter/helpfirewall.asp
> states that you need to open up at least three ports:
> tcp 80 - tcp 6800 - udp 6801.
> 
> One should use INPUT or FORWARD rule ?

Depends on where is your net2phone client.
If it is *NOT* on your firewall, use FORWARD

I visited the net2phone link, your forward rules should be

# Following two rules would allow log in,
# maintaining online status, and instant messaging
-A FORWARD -s internal_ne_ips -d relay.net2phone.com -p tcp --dport 80
-m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -s relay.net2phone -p tcp --sport 80 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

# Following two rules would allow voice packets to go out
-A FORWARD -s internal_net_ips tcp --sport 6800 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -s internal_net_ips -p udp --sport 6801 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

# Following two rules would allow voice packets to get in 
-A FORWARD -d external_ip tcp --dport 6800 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -d external_ip -p udp --dport 6801 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT


Above rules can be made more restrictive !


Enjoy firewalling.

Mohammad


-- 
"Mad cow? You'd be mad too, if someone was trying to eat you."


