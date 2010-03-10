From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: drop dhcp request from a particular mac address, after a dhcp
 relay
Date: Wed, 10 Mar 2010 09:30:26 -0600
Message-ID: <hn8duq$1kq$1@dough.gmane.org>
References: <418652.3218.qm@web31505.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <418652.3218.qm@web31505.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/10/2010 08:30 AM, Ming-Ching Tiew wrote:
>
> I would like to inhibit a dhcp request from a particular mac address, on the dhcp server.
>
> If the client is directly LAN connected, I would suppose the following will work :-
>
> iptables ....... -m mac --mac-source
>
> But to add a twist to the problem, the machine which must be blocked from obtaining a DHCP IP is connected to a DHCP relay, and therefore, the dhcp server is seeing only the mac adddress of the relay. Can this be accomplished with iptables ?
>
> Is there a match which works something like this :-
>
>    iptables ..... -m bootp --mac-source 00:08:a1:ab:75:d1 -j DROP ?
>
> Well, if 'iptables' can't serve the purpose, how about ebtables ?

Wouldn't it be a lot easier to adjust the DHCP server's configuration by
adding a "deny" statement in the pool's permit list?

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

