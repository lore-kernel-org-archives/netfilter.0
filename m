From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: iptables in promiscuous mode
Date: Thu, 7 Jul 2011 21:15:45 +0200
Message-ID: <20110707211545.421c89e5@catus>
References: <CAPR6_RB_BnxGoozDoQzyNS+Un3pERyYjpxgFHe1orMhMfj7DqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPR6_RB_BnxGoozDoQzyNS+Un3pERyYjpxgFHe1orMhMfj7DqQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrey <andrey@cs.dal.ca>
Cc: netfilter@vger.kernel.org

>Hello,

Hi,

>I have traffic that was captured in promiscuous mode, therefore it is
>not destined to my computer.
From what I understand netfilter/iptables does not work in promiscuous
>mode therefore it will not see the traffic when I replay it.

It looks like ruleset test scenario.

Option1) 

You can change mac address and/or ip address of a host you replay
traffic to to the values of original recipient of the traffic. That way
traffic should hit all apropriate netfilter hooks.

Option2)

You can:
- create bridge br0 with eth0 and tap0 up and attached to it,
- set br0 to act as a hub:
echo 0 > /sys/class/net/br0/bridge/ageing_time
- enable netfilter for bridged traffic
echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
- feed replayed traffic to eth0

You should see traffic passing some netfilter chains, but you won't see
much in INPUT/OUTPUT of filter table. Most (all) of the traffic will be
treated as forwarded, not as received localy.

Best regards,
Marek Kierdelewicz
