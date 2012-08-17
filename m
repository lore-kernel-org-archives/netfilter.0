From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: netfilter packetflow
Date: Fri, 17 Aug 2012 16:04:16 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208171601510.25050@frira.zrqbmnf.qr>
References: <COL124-W20E1581415198E1293F5D484B40@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <COL124-W20E1581415198E1293F5D484B40@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: A G <utopian201@hotmail.com>
Cc: netfilter@vger.kernel.org

On Friday 2012-08-17 14:48, A G wrote:

>This diagram shows the packetflow
>http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg
>
>1. Does this mean that when I set my computer to bridge mode for 
>example The packet goes through all of the link layer chains? That is, 
>it will go through nat/PREROUTING (ebtables), raw/PREROUTING 
>(iptables), mangle/PREROUTING (iptables) Or does it only go through the 
>ebtables (blue coloured) chains in the link layer?

If the "net.bridge.bridge-nf-call-ip6tables" sysctl is enabled (this is 
the defualt), it will go through both blue boxes and green boxes. If 
disabled, only blue boxes will be processed in the blue layer.

>2. If it only goes through the blue chains only, if I want it to go 
>through the iptables chains in the link layer (green coloured), I am 
>required to have a rule with a DROP target to push it up to to the 
>higher network layers, is this correct?

Using DROP in broute would indeed be the necessary prerequisite, 
however, that will force routing and deactivate bridging for the packet.

