From: The Media Server <info@themediaserver.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Thu, 15 Jan 2015 21:24:47 -0500
Message-ID: <CAJb3rWCR1R0kmY9u+MUUvS7Eo133zcp4u63hBSwno2L+mbXEiw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> A hint:
> I think you have to send packets from another host to this host
> to let the pkts go thru the PREROUTING chain of the mangle table.

I am accessing my port 81 from another computer via my public ISP address..
http://198.xx.x.xx.x

I can see my connection in tcpdump port 80 trying to get in and the
MARK packet increasing in iptables -t mangle -nvL. But my connection
is still timing out.

my goal is to bypass my vpn for a specific port..
