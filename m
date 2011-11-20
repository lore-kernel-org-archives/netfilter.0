From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: trouble setting default route for load-balancing routing tables
Date: Sun, 20 Nov 2011 14:57:38 -0600
Message-ID: <op.v49i6cbxx1lyi3@debiandesk2.net>
References: <op.v4721hs0x1lyi3@debiandesk2.net>
 <1321798603.2382.987.camel@andybev-desktop>
 <op.v482atdzx1lyi3@debiandesk2.net> <op.v4823hgfx1lyi3@debiandesk2.net>
 <1321821246.2382.1044.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1321821246.2382.1044.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Sun, 20 Nov 2011 14:34:06 -0600, Andrew Beverley <andy@andybev.com> wrote:

> On Sun, 2011-11-20 at 09:10 -0600, Lloyd Standish wrote:
>> Now that the default routes are set in tables T1 and T0, the above
>>  rules to "override" the load-balancing appear to work perfectly.  The
>>  router will ONLY send packets to T1 (eth1) for those subnets,
>
> Ah, got you. So you're splitting the network by subnets and routing over
> the link depending on the subnet. Therefore packets from one client PC
> will always go over the same link?
>

No, the subnets define destination IPs, not LAN IPs.  The subnets for a Costa Rican bank that chokes if traffic from a user during a "session" changes source IP.  The rules force all connections to those subnets to go out through the same IP, so the bank won't see an change in source IP due to my router's load-balancing.

(A change in IP to a given destination over a short period would not be likely to happen even *without* this rule, since routes are cached, and cached routes are not subject to load-balancing.)

--
Lloyd
