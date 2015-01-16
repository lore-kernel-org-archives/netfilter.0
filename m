From: The Media Server <info@themediaserver.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Thu, 15 Jan 2015 22:12:55 -0500
Message-ID: <CAJb3rWA+2mHMZh3BUVkvmv_ok0pnvx5kavFx3esOBupnFh600g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

both port are forwarded to my linux pc 80 and 22 in my router ;)

Public ip address is block because of my vpn enabled...

like i said if I deviate my connections to my table 2 like so with vpn enabled:
ip rule add from 192.168.2.0/24 table 2
all my inbound connection works with my public ip address and that is the goal.
I just want the thing to work on a port basis.


Anyways i'll experiment.. i will try to remove all table, stop vpn.
make an empty or wrong table main..
and try to mark my packets and forward them to table 2

I will give you the results.. if that doesn't work we will know there
is problem with the marking system, if it works, the problem is
somewhere in my vpn setup..

thks again!
