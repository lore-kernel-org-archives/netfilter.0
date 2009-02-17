From: tengaman@wolke7.net
Subject: Re: NAT not for filtering - problem
Date: Wed, 18 Feb 2009 00:27:44 +0100
Message-ID: <20090217232744.GA5471@localhost>
References: <20090217152840.GA3683@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: attachment; filename="mail.1"
In-Reply-To: <20090217152840.GA3683@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello again,
being more graphic this time:

>--uid-owner debian-tor does not match the redirected traffic.
>Meaning although the traffic is processed by a process owned by a
>different user --uid-owner still maches the orignal user of the data.

I figured out myself, that can't be, because:
After redirecting the traffic the packages are used by the
tor-programm not 'piped through'!
tor generates completely new packages that should be matched by
"--uid-owner 'user of the daemon process'" - am I right?

Original Setup: all tables empty with POLICY ACCEPT
>iptables -t nat -A OUTPUT -p tcp -m owner --uid-owner tor-user -j \
>REDIRECT --to-ports 9040

>iptables -t nat -A OUTPUT -p udp -m owner \
>--uid-owner tor-user -m udp --dport 53 -j REDIRECT --to-ports 53

>iptables -t nat -A OUTPUT -m owner --uid-owner \
>tor-user -j DROP

The funny thing is, it isn't working: I'm able to ping a remote host
although ICMP should be dropped, why is that?
But the transparent-proxy does work!

By the way, the hole concept comes from:
https://wiki.torproject.org/noreply/TheOnionRouter/TransparentProxy?highlight=%2528transparent%2529


Ok, new idea: again all tables empty with POLICY ACCEPT

>iptables -t nat -A OUTPUT -p tcp -m owner \
>--uid-owner tor-user -j REDIRECT --to-ports 9040

>iptables -t nat -A OUTPUT -p udp -m owner \
>--uid-owner tor-user -m udp --dport 53 -j REDIRECT --to-ports 53

>iptables -t filter -A OUTPUT -m owner --uid-owner \
>debian-tor -j ACCEPT

>iptables -t filter -A OUTPUT -m owner --uid-owner \
>debian-tor -j DROP

I don't get any connection with this setup.

I also tried to mark the traffic but - yeah - I don't understand whats
happening - any idea?


regards
Sebastian R.
