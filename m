From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: prevent script kiddies to abuse my ppp connection
Date: Fri, 11 Oct 2002 18:16:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210111717.g9BHH1L19776@vulcan.rissington.net>
References: <15781.58154.125224.618756@juliva.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <15781.58154.125224.618756@juliva.com>
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

On Thursday 10 October 2002 9:29 pm, Ivan Kanis wrote:

> Hello,
>
> I left my computer for an hour and I was
> surprised to see that the connection was still on! I thought that one
> of my proces was using the connection so i did a quick dump of ppp0. I
> was surprise to see that some script kiddy was looking at my netbios
> port!
>
> Now I have been thinking of ways to prevent these silliness from
> shutting down my conneciton within 3mn. If I firewall these incoming
> packets I believe that it won't help me. The blocked packet will still
> traverse the ppp link. So it will still be seen as "activity" to the
> ppp daemon. Correct me if I am mistaken.

I don't know - try it and see.

Set a simple ruleset in netfilter, such as:

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

(assuming netfilter and you applications, are running on the machine with the 
dialup connection).

Then set up an inbound ping from some remote machine and see if your 
connection times out...

If not, maybe you can adjust your ppp daemon to only count outgoing packets 
as contributing to a connection which should be kept alive ?   Then inbound 
packets which get no response won't count...

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them

