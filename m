From: Matthew Smith <gizmosmith@gmail.com>
Subject: Re: Packets being reflected back from firewall unintentionally...
Date: Mon, 27 Apr 2015 07:01:01 -0700
Message-ID: <CANDZmsXpyk9VjKHzSMVxww_gFwTb3hopBv-vVD2pafxv8CtDAA@mail.gmail.com>
References: <CANDZmsURcr3k3msVhHe4ZUrHEW_B8kbHHNMom_uByWPcr2eoKA@mail.gmail.com>
	<CAEzD07+js1g2-1BEDnS2bDPNDDL52KG-fP55+UBBhU+aLcTOog@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=EQ3oRWltEFfEgp7e0Mqa2M1+EPZ3sWFZgIMRi/zlTLk=;
        b=C39xxPnjA4fCo2n15I+TRbPTWNTqOGDSmwkmrnkm8+WzinJGPrwuiNk1K6XNZ7Silq
         C43i3lgLAcQWCgxn3a20467MOzIpKw4WBQcs9sqC3TldMuIiMbY9yvOVs72OagrI0IM0
         FwwTyHdP34otNMAtyTMj5U+Pujhgzx4iEUvcnR1v6YosmYaYcGXlFQHZ5WuwWPXZz5Sp
         1MUUIdrSN677wIzGUBhs580Vq18yyEZKLVJ6m4ZTCd8aUMXSkUKVYLwgQ0WC66Dw4zGe
         65kh9G6TvTfNKc2SGKclVODNI6CK6hc0fCOApubxVDda9DYNdt6rI1F3P+89kCj6k+qo
         Obnw==
In-Reply-To: <CAEzD07+js1g2-1BEDnS2bDPNDDL52KG-fP55+UBBhU+aLcTOog@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

I'll see if I can gather enough smarts together to try what you
suggest.  I did find a workaround though:

If I stay with port 4569 to go from asterisk#1 to asterisk#2 but then
use port 4570 to go the reverse direction, it works.  The nat rules no
longer conflict and cause problems since the port is different.

Basically, I think there is a conflict between the prerouting and
postrouting nat rules. They seem to be incompatible if the same port
number is used to forward in as call out from. Obviously, you should
be able to port forward to a host inside a nat'd network (any
commercial router I've used can do that) but I just can't do so with
iptables.

I don't like this because I shouldn't have to do this but I'll go with
it for now while I keep researching.

On Mon, Apr 27, 2015 at 3:46 AM, Anton Danilov
<littlesmilingcloud@gmail.com> wrote:
>
> Hello.
> Check the full ruleset (iptables-save -c).
> If you wont find the issue, use the TRACE target for packets from
> internal LAN Asterisk server.
> Also, you can ask the help on #netfilter irc-channel at freenode.
>
> 2015-04-27 8:03 GMT+03:00 Matthew Smith <gizmosmith@gmail.com>:
> > I have a 192.168.1.14 host behind a linux firewall with ip
> > 192.168.1.1.  The interface of the firewall facing the internet is
> > "em1" and the private interface is "p1p1"
> > I've enabled "masquerading" via SNAT for the whole 192.168.1/24 subnet
> > with the following iptables rules:
> >
> > -t nat -A POSTROUTING -s 192.168.1/24 -o em1 -j SNAT --to (MY_PUBLIC_IP)
> > -A FORWARD -i em1 -o p1p1 -m state --state RELATED,ESTABLISHED -j ACCEPT
> > -A FORWARD -i p1p1 -o em1 -j ACCEPT
> >
> > This works fine as all hosts in the 192.168.1/24 subnet can get out to
> > the internet just fine.
> >
> > I opened a port forward up to an asterisk server inside the subnet to
> > allow a remote asterisk server to connect to my asterisk server
> > inside:
> >
> > $IPT -t nat -A PREROUTING -i em1 -s (REMOTE_ASTERISK_SERVER_IP) -d
> > (MY_PUBLIC_IP) -p udp --dport 4569 -j DNAT --to-destination
> > (PRIVATE_INTERNAL_ASTERISK_IP)
> > $IPT -A FORWARD -s (REMOTE_ASTERISK_SERVER_IP) -p udp --dport 4569 -j ACCEPT
> >
> > So, the remote asterisk server can connect in just fine.  Packets
> > coming from it to my asterisk server are handled perfectly accoridng
> > to tcpdump.  The trouble is my internal asterisk server can't get out
> > port 4569.  If it tries to send a packet to REMOTE_ASTERISK_SERVER_IP
> > it gets reflected back from interface p1p1 on the firewall.  The
> > packet doesn't even make it to em1 of the firewall.
> >
> > Here's the header of the packet leaving the asterisk server:
> > Source: (PRIVATE_INTERNAL_ASTERISK_IP)
> > Destination: (REMOTE_ASTERISK_SERVER_IP)
> >
> > This packet hits p1p1 and is immediately returned back to the internal
> > asterisk server with the following header:
> > Source:  (MY_PUBLIC_IP)
> > Destination:  (PRIVATE_INTERNAL_ASTERISK_IP)
> >
> > So, both addresses are changed and the packet never gets past the
> > firewall.  Any reason why this happens?
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Anton.
