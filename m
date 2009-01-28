From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Blocking outgoing 802.11 ACKs
Date: Wed, 28 Jan 2009 13:00:05 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0901281257540.22626@aurora.sdinet.de>
References: <441977.39906.qm@web31604.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <441977.39906.qm@web31604.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Cc: netfilter@vger.kernel.org

On Wed, 28 Jan 2009, Kostas Pelechrinis wrote:

> I have two nodes communicating via their wireless interfaces.  Let us 
> assume that node A sends packets to node B.  Once node B is receiving 
> the packets, he transmits the 802.11 ACK frame.  What I want to do is 
> to prevent node B from sending this ACK frames once every two packets 
> for example. 

iptables does not see 802.11 ACK frames, and depending on the used 
driver they are even invisible to the layers below IP, as they are 
generated/handled in hardware/firmware of the wireless interface.

I do not see a "normal" way to block them beside modifying the wireless 
driver or mac80211 layer (if used by your driver).

c'ya
sven

-- 
The lights are fading out, once more...
