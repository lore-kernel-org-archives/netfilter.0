From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: No PREROUTING for OUTPUT?
Date: Mon, 18 Oct 2004 09:51:07 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4173D85B.8060908@pbl.ca>
References: <5FCB4E67C52322BD4ABBF882@[10.0.0.4]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5FCB4E67C52322BD4ABBF882@[10.0.0.4]>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users <netfilter@lists.netfilter.org>

Kenneth Porter wrote:
> Can anyone confirm that the PREROUTING chain is absent from the OUTPUT 
> packet path? I wanted to tag my UDP packets with TOS Minimize-Delay so 
> that they'd go in my high-priority traffic shaping queues, but if 
> PREROUTING isn't used in the output path, the packets can't be tagged 
> until after they've been through the shaper. (Isn't the shaper part of 
> "routing decision" in the diagrams?)

The equivalent of PREROUTING chain for locally generated packets would 
be OUTPUT chain.  It exists in filter, nat, and mangle tables.  I'd 
guess what you need is something like:

    iptables -t mangle -A OUTPUT -p udp -j TOS --set-tos Minimize-Delay
    iptables -t mangle -A PREROUTING -p udp -j TOS --set-tos Minimize-Delay

First line would handle locally generated packets, second would handle 
forwarded packets (it would catch incoming too, but I guess it can be 
safely ignored in this case).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

