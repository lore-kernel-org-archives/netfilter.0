From: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Subject: RE: iptables not prevent access
Date: Mon, 15 Sep 2008 15:53:06 +0800
Message-ID: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
 <9518B26607784D55A361431633134C9B@dcyb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9518B26607784D55A361431633134C9B@dcyb.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Rob Sterenborg <rob@sterenborg.info>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org
> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Rob Sterenborg
> Sent: Monday, September 15, 2008 3:34 PM
> To: netfilter@vger.kernel.org
> Subject: RE: iptables not prevent access
>
> Is there a rule that would accept the http packet before it
> would hit this rule?

Actually, this is the only rule that exists in the server.

> Place a LOG rule identical to the REJECT rule in front of it
> and look in your messages log if it hits:
>
> $ipt -A INPUT -i eth0 -s 13.121.8.119 -p tcp --dport 80 -j LOG \
>   --log-level info --log-prefix "IPT: TEST: "
> $ipt -A INPUT -i eth0 -s 13.121.8.119 -p tcp --dport 80 -j REJECT

We don't have "ipt" command, only "iptables" command, and "iptables --help" shows it doesn't support a option of "--log-level"
=====================================
GUMP:/tmp/nvram <45> iptables -A INPUT -i eth0 -s 13.121.8.119 -p tcp --dport 80 -j LOG  --log-level info --log-prefix "IPT: TEST: "
iptables v1.2.8: Unknown arg `--log-level'
Try `iptables -h' or 'iptables --help' for more information.
=====================================

> If it doesn't hit, either the rule is incorrect (for what you
> want it to do) or another rule has already accepted the packet.

What's strange is that, when I run the same command to other machines, say 13.121.8.120, the http access is successfully rejected. Does that mean something wrong with the network configuration of the machine 13.121.8.119? What is the possible cause of that behavior?

Another thing is quite strange, when capturing network trace from and to 13.121.8.119, I can't find any packet associated with the server which runs "iptables" command. However, when I was capturing network trace from and to 13.121.8.120 (which was successfully blocked), I can see some network packets associated with the server.

Got confused...

> Grts,
> Rob
