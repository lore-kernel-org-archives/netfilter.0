From: Jason Opperisano <opie@817west.com>
Subject: Re: Giving trouble when blocking MSN messenger
Date: Mon, 1 Nov 2004 10:23:37 -0500
Message-ID: <20041101152337.GA18057@bender.817west.com>
References: <20041101142101.25476.qmail@web50505.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041101142101.25476.qmail@web50505.mail.yahoo.com>
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

On Mon, Nov 01, 2004 at 06:21:01AM -0800, Nilesh wrote:
> Hello All,
> 
> I am not able to block MSN Messenger when I put this
> rule in rc.firewall script 
> This rule is required for to connect VPN sever at
> client side.
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to
> $EXTIP

that rule translates the source address of all packets routed out $EXTIF
to $EXTIP.  it is not a filter rule, so there's no reason to think it
would have anything to do with blocking MSN messenger.

> Could any one tell me what needs to be change in
> Squid.conf for blocking MSN messenger or tell me the

this is not a squid list, nor does cross-posting to the squid list make
this a squid list.

> way to block it.

without your current ruleset, no.  i can give you the necessary
information you need to incorporate the proper rule into your specific
configuration.

MSN Messenger client connects to the server on TCP Port 1863.  block
access to this port, and the client will not be able to connect over its
native transport.

in the event that TCP port 1863 is filtered, MSN Messenger client will
attempt to connect over TCP Port 80 with an HTTP CONNECT request that
looks something like:

http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com 

in the future, things you could do before cross-posting:

go to http://google.com and type 'iptables block msn messenger' or
'squid block msn messenger' as this question is asked approximately
every 43 seconds, and many people have taken the time to answer it many
times before.

go to http://marc.theaimsgroup.com/ and search the 'netfilter' or
'squid-users' lists for 'msn messenger'

-j

--
"Oh, so they have internet on computers now!"
        --The Simpsons

