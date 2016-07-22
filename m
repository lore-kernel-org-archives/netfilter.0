From: Guy German <guy_g@rad.com>
Subject: How does iptables NAT handle IPsec ESP with NAT-T UDP header ?
Date: Fri, 22 Jul 2016 11:45:35 +0000
Message-ID: <AM4PR0301MB227595822291E80D8CFB861A910A0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rad365.onmicrosoft.com; s=selector1-rad-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Li5t0qJL9o0FEp0J7jaYiHC+0iZneYsavB0sQjhXCBA=;
 b=RFcWFajI2Rcs44KobxENB6LzDUAqB4mMOXuaB0QVazdcDWBdMCUP65x7AYTqllgt7FK66m3gEmM9mRbf24EVxPue8e7k2RUc3nOWf5NsUyeKjpgEWzCWqw31hHVOLAqusSI4YRwrRyAoI8vSuubf7eXdvpOJ8iHAXViSyZ9BRJM=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hi,

We have a Linux based device which implements NAT by iptables.
We are currently checking a scenario in which 4 independent IPSEC ESP tunnels are
entering the device (with private IP addresses) where we use NAT as the device has only single public IP address.

While observing the data it seems that the incoming IPSEC tunnels are using
NAT-T as a UDP header (with both src/dst ports equal 4500) is present before the ESP header.
The NAT itself seems to be working well (we can ping from side to side for each IPSEC tunnel).
Still, the packets headers are not as we expected and we need to understand what exactly is going on.

When we look at the outgoing packets we see the following: 
In some cases, the src UDP port is changed to 1024 as regular SNAT is taking place.
However, it seems that in most of the times (we performed several tests, each after rebooting the setup) the
UDP header is left untouched (i.e. both src/dst ports equal 4500) while we were expecting that the src UDP port will be changed after SNAT.

The designer which wrote the module is unavailable currently and the module which implements the NAT is quite big/complex,
but as far as we could see the typical syntax is similar to:
iptables -t nat -D POSTROUTING -j MASQUERADE -o eth2

I'll really appreciate if you could help me with following:
Why is the src UDP port unchanged ?
Is it possible that iptables is using the ESP SPI field as source identifier in the NAT table ?
If so, why do we still have situations in which for some tunnels the src UDP port 4500 does change ?
Is there a way (i.e. iptable syntax) to control this ?
Is there a way to view the current NAT table contents ?

Many thanks,
Guy
