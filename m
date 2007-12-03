From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: Problem with address forwarding
Date: Mon, 3 Dec 2007 14:50:13 +0100 (CET)
Message-ID: <57523.217.166.60.19.1196689813.squirrel@ma.rtij.nl>
References: <20071203125238.GN4452@jnamobiled.ite.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071203125238.GN4452@jnamobiled.ite.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jakub Nadolny <jakub.nadolny@carrywater.pl>
Cc: netfilter@vger.kernel.org

<citaat van="Jakub Nadolny">
> Hi,
>
> I try to do simple address:port forwarding and I can not get it
> working. I want to have all traffic send to
> some.internet.address:some_port
> to be forwarded to 192.168.155.123:80.
>
> So I guess following rule should work fine:
> iptables -t nat -A PREROUTING -p tcp -d some.internet.address --dport 1234
> -j DNAT --to 192.168.155.123:80
>
> But when afterthat I enter some.internet.address:1234 in firefox I can
> not see webpage which is located at 192.168.155.123. It tries to connect
> but there is no result.
>
> What could be the reason of that?

If you are doing this from the same network the webserver is on, this will
not work. The return traffic is going straight back to the client instead
of being 'Natted-back' by the firewall.

HTH,
M4

