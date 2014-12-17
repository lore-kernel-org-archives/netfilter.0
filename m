From: Tim Nelson <tnelson@rockbochs.com>
Subject: Re: Bridging / VLANs / ebtables
Date: Wed, 17 Dec 2014 11:30:39 -0600 (CST)
Message-ID: <5298570.350969.1418837439866.JavaMail.root@rockbochs.com>
References: <549119ce.ca25e00a.053d.1a62@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <549119ce.ca25e00a.053d.1a62@mx.google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

----- Original Message ----- 
> I get the scenario but not the why. Is it a subset of specific things
> you need to do a layer 2 bridge for or do you need it for something
> else.
>
> For example I have a firewall where I need to forward broadcast (
> 255.255.255.255 ,xxx.xxx.xxx.255) messages between different
> segments in the network. Most people would think of bridging for
> this but I did something completely different involving setting both
> interfaces to a /32, adding a static route for each subnet, adding a
> static arp table entry on each interface for the broadcast IP
> addresses mapped to the broadcast mac addresses then simple iptables
> rules.

In this case, there is a device on a switchport (untagged VLAN 3) which needs to have layer 2 access to/from devices connected to a different broadcast domain, available on a different switchport. Both the untagged network, as well as VLAN3 networks are available to this 'host in the middle'. Given an inability to manage the switch in this very specialized case, I'd like to make that bridge happen within the connected host.

Would you be open to providing more specifics on your /32 setup you noted?

--Tim
