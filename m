From: Robert White <rwhite@pobox.com>
Subject: Re: How to count access attempts per ip and block automatically
Date: Thu, 22 Jun 2017 09:19:55 +0000
Message-ID: <d04c4efe-1e3a-6224-2982-6bb943e85bbf@pobox.com>
References: <1497998962.14144.1.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1497998962.14144.1.camel@gmail.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: evan <composingmotion@gmail.com>, netfilter@vger.kernel.org

On 06/20/2017 10:49 PM, evan wrote:
> however I would also like monitor the evaluation set and automatically
> add to the blacklist any address that for example 
> 
> attempts more than 25 connections on port 22 per hour.

In iptables I use a side chain and a limit/return rule.

So I create a specific chain who's terminal condition adds the address
to a block list, but then uses a limit to return from the chain early if
they are in the fair-play range.

# new chain
iptables --new-chain SSHTHROTTLE

# If they are in the naughty list then update their membership
# then drop the connection. The "update" will fail if they are not
# already in the set, and so the DROP will _NOT_ take place.
iptables --append SSHTHROTTLE --match recent --name bad_actors --update
--seconds 86400 --reap --jump DROP

# If the connection attempt hasn't exceeded five goes in an hour then
# accept the connection. (Use RETURN if you have more logic you want
# to go through before the final verdict.)
iptables --append SSHTHROTTLE --match hashlimit --hashlimit-name
ssh_throttle --hashlimit-upto 5/hour --hashlimit-mode srcip
--hashlimit-htable-expire 7200000 --jump ACCEPT

# Add the bad actor to the bad_actors set and then drop the packet.
iptables --append SSHTHROTTLE --match recent --name bad_actors --set
--jump DROP

So the above logic puts a bad_actor into a penalty box, but they get out
of the penalty if they stop trying for at least 86400 seconds (one day).
But as long as they keep trying they stay banned.


Meanwhile, that chain is really controlled by the invocation context.
That is, I use the chain name SSHTHROTTLE but the only thing that makes
this SSH specific is the invoking rule.

iptables --append INPUT --in-interface ext+ --proto tcp --match
conntrack --ctstate NEW --dport 22 --syn --jump SSHTHROTTLE


So you can direct all manner of sessions through just the one table if
you consider other connections just as onerous.

In NFTables you can do something similar using limits and sets, but I
haven't constructed the logic to share here.

--Rob.
