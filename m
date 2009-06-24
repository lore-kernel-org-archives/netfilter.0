From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 11:39:36 +0100 (WEST)
Message-ID: <1072.192.168.1.3.1245839976.squirrel@webmail.decimal.pt>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
    <33be4bb30906240322x1934b045g5e74e16f012ffcd7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <33be4bb30906240322x1934b045g5e74e16f012ffcd7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oskar Berggren <oskar.berggren@gmail.com>
Cc: netfilter@vger.kernel.org

> You need to allow the return traffic also. This can be done with
> connection tracking and the state match.
>
> /Oskar
>

Forgive me, but i'm a bit confused in a gray area right now.
With the PREROUTING it wasn't needed to add that and it worked, for this
new scenario, i tried:

#allow all (??)
iptables -t filter -A FORWARD -j ALLOW
#allow TCP PORT 22
iptables -t filter -A FORWARD -p tcp --dport 22 -j ACCEPT # ssh
#block everything else
iptables -t filter -A FORWARD -j DROP

And it allow's everything!
I must say that i'm not a big expert with iptables, if you can give me a
few more lights with this i'll thank you.

Jorge,

