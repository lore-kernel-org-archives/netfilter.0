From: Morphal <morphal@libertysurf.fr>
Subject: Re: How to clear conntrack table
Date: Thu, 08 Nov 2007 10:46:00 +0100
Message-ID: <4732DAD8.7000104@libertysurf.fr>
References: <7c2474d40711080134k6f255ed9hba98b7a49aa3c1fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7c2474d40711080134k6f255ed9hba98b7a49aa3c1fe@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paco Orozco <pakusland@gmail.com>
Cc: netfilter@vger.kernel.org

Look at contrack tools http://people.netfilter.org/pablo/conntrack-tools/


Paco Orozco wrote:
> Hiya,
>
> I've got a cluster of firewalls, using iptables and HA (heartbeat) in
> active - passive mode.
>
> When node 1 has de main IP address, I stablish a ssh connection from
> outside to inside.
> If node 2 takeovers this main IP address, for example with hb_takeover
> HA's command, this connection, and those has been stablished are
> maintained.
> Trully, node 2 creates a new conntrack entry, with new sequence numbers.
>
> But If I do a takeover in node 1, without rebooting it before. The
> main IP address is taken by node 1.
> The ssh connection isn't maintained, because conntrack has a ASSURED
> entry on node 1, the first one was created, that has diferents states
> (sequence numbres) from established connection in node 2.
> So, this ssh freezes and it isn't maintained. If I try to ssh again
> there's no problem.
>
> Obviously, If I reboot node 1 before taking the main IP address, all
> works correctly, but I'd like to have a better solution, for example
> I'd like to clear conntrack table before taking the main IP address.
>
> Does Anyone know It it is possible? Do you have similar environments?
>
> Thanks in advance...
>
> Paco
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
