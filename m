From: Alpt <alpt-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
Subject: Re: Multiple inet gw and multipath
Date: Wed, 1 Mar 2006 05:55:03 +0100
Message-ID: <20060301045503.GA7482@nihil>
References: <57F9959B46E0FA4D8BA88AEDFBE582901673AA@pxtbenexd01.pxt.primeexalia.com>
Reply-To: netsukuku-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Return-path: <netsukuku-return-480-gnpn-netsukuku=m.gmane.org-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Post: <mailto:netsukuku-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:netsukuku-help-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <mailto:netsukuku-unsubscribe-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Subscribe: <mailto:netsukuku-subscribe-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE582901673AA-pXpRIbuYcI+xSBpebk8nUM8lm8qNBeZ/JUWSQBdlaSk@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gary W. Smith" <gary-zyWbyo0F5n8lRZJAF2VpKQ@public.gmane.org>
Cc: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org, netsukuku-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org

On Tue, Feb 28, 2006 at 03:06:57PM -0800, <Gary W. Smith>:
~> Well, what we do is to mark a packet coming in an interface and use a
~> special table based on mark to decide which route to take.  Ours is a
~> little more complicated as we are nat'ing addresses internal from each
~> external interface.  We end up having servers with two internal IP's
~> which are nat'ed to an external IP.  But the logic should still hold
~> true for you.
~> 
~> Iptables sets the mark in the mangle table.
~> -A PREROUTING -i eth0 -j MARK --set-mark 0x4 
~> -A PREROUTING -i eth1 -j MARK --set-mark 0x8


Unfortunately we have to use only one IP per node because we are in an adhoc
net. If we assign different IPs to the same node conflicts will arise, 
therefore each interface and tunnel has to have the same IP.
If it hadn't been like this we would have used the source routing method
described in the lartc HOWTO.

Let's recap:
We have multiple gw. When a new connection is established through a gw,
all the packets belonging to the same connection must be sent through the
same gw. 
We cannot use the source routing method since all the IFs use the same IP,
thus in order to accomplish this we have to:
mark with the same id all the packets which belong to the same
connection.
Each connection has to have a different mark in order to go through
different gateways.

A simple idea is to assign a mark to each tunnel (outgoing IF), and
when a new connection is created through a specific tunnel, all the outgoing
packets of the connection are marked with the same id. But how?

Another idea is to conntrack the connection and marking the packets with a
4bit number which is the hash of the destination IP. Probably this requires a
new netfilter extension.

That's all,
regards and thanks
-- 
:wq!
"I don't know nothing" The One Who reached the Thinking Matter   '.'

[ Alpt --- Freaknet Medialab ]
[ GPG Key ID 441CF0EE ]
[ Key fingerprint = 8B02 26E8 831A 7BB9 81A9  5277 BFF8 037E 441C F0EE ]
