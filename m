From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: Iptables Reject with TCP Reset
Date: Fri, 6 Jan 2017 15:30:35 -0200
Message-ID: <20170106153035.336da335@pulsar.inexo.com.br>
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
        <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
        <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Killock <matt.killock@praemium.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 6 Jan 2017 16:28:31 +0000
Matt Killock <matt.killock@praemium.com> wrote:

> > Depends on your rule set. Check and fix it. The target usually works.  
> 
> As a test, I made the very first FORWARD rule this:
> 
> iptables -A FORWARD -i eth1 -p tcp -s 192.168.20.0/24 -d 212.58.244.71
> --dport 80 -j REJECT --reject-with tcp-reset
> 
> 'iptables -n -L' output:
> 
> Chain FORWARD (policy DROP)
> target     prot opt source               destination
> REJECT     tcp  --  192.168.20.0/24      212.58.244.71        tcp dpt:80
> reject-with tcp-reset
> 
> 
> However, no Reset packets can be observed:
> 
> # tcpdump -ni eth1 host 192.168.20.164
> 16:23:00.706667 IP 192.168.20.164.50105 > 212.58.244.71.80: Flags [SEW], seq
> 2763730948, win 8192, options [mss 1460,nop,wscale 8,nop,nop,sackOK], length
> 0 16:23:02.717733 IP 192.168.20.164.50106 > 212.58.244.71.80: Flags [SEW],
> seq 2464499683, win 8192, options [mss 1460,nop,wscale 8,nop,nop,sackOK],
> length 0
> 
> If this does usually work then could you give me a clue on what ruleset it
> does work with?
> 

Is the 192.168.20.0/24 network at the "same side" of eth1 ??

The rule, as it is written, expects an incoming packet thru eth1 and outgoing
thru any interface towards port 80. Therefore 192.168.20.0/24 must be at the "same side" of the eth1.

Ethy

