From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables not prevent access
Date: Mon, 15 Sep 2008 09:33:43 +0200
Message-ID: <9518B26607784D55A361431633134C9B@dcyb.net>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

netfilter-owner@vger.kernel.org <> wrote on :

> Hi, all:
> 
> I am running the command "iptables -p tcp -j REJECT -A INPUT
> -i eth0 -s 13.121.8.119/32 --dport 80", to reject http access
> from the host "13.121.8.119". The command returns without any
> error message. However, I still can acess the linux server from
> "13.121.8.119". 
> 
> Anything goes wrong here?

Is there a rule that would accept the http packet before it would hit this
rule?

> Any method to debug?

Place a LOG rule identical to the REJECT rule in front of it and look in
your messages log if it hits:

$ipt -A INPUT -i eth0 -s 13.121.8.119 -p tcp --dport 80 -j LOG \
  --log-level info --log-prefix "IPT: TEST: "
$ipt -A INPUT -i eth0 -s 13.121.8.119 -p tcp --dport 80 -j REJECT

If it doesn't hit, either the rule is incorrect (for what you want it to do)
or another rule has already accepted the packet.


Grts,
Rob

