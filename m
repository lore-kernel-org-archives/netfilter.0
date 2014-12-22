From: Tim Nelson <tnelson@rockbochs.com>
Subject: Re: Bridging / VLANs / ebtables
Date: Mon, 22 Dec 2014 09:24:14 -0600 (CST)
Message-ID: <14852223.382712.1419261854310.JavaMail.root@rockbochs.com>
References: <CAPJdpdD+Ziiy_keV=Re92-v53PtMA8N7XK6rKXYHvzj3QJcOQg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPJdpdD+Ziiy_keV=Re92-v53PtMA8N7XK6rKXYHvzj3QJcOQg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

----- Original Message -----
> I get the scenario but not the why. Is it a subset of specific things
> you need to do a layer 2 bridge for or do you need it for something
> else.
> 
> For example I have a firewall where I need to forward broadcast
> (255.255.255.255,xxx.xxx.xxx.255) messages between different segments
> in the network. Most people would think of bridging for this but I
> did
> something completely different involving setting both interfaces to a
> /32, adding a static route for each subnet, adding a static arp table
> entry on each interface for the broadcast IP addresses mapped to the
> broadcast mac addresses then simple iptables rules.
> 

Greetings Paul-

I believe you mentioned this previously. While the mechanism is 'different', does the end result still operate the same, allowing a device on one interface to have an IP from the other interface, and still operate as though a bridge was in place?

Thank you,

--Tim
