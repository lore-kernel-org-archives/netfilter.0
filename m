From: Ed W <lists@wildgooses.com>
Subject: Re: Source MAC address through bridged connection
Date: Sat, 21 May 2011 13:47:38 +0100
Message-ID: <4DD7B46A.3020607@wildgooses.com>
References: <BANLkTikbqMrGCThuiFZRCtB6Mrf_+mcXNg@mail.gmail.com>	<1305821120.8149.1094.camel@tardy> <BANLkTikujJHoQv1hb-PdaAYyPukOpei4XA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTikujJHoQv1hb-PdaAYyPukOpei4XA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kelbel Junior <kelbel02@gmail.com>
Cc: rick.jones2@hp.com, netfilter@vger.kernel.org

On 19/05/2011 17:11, Kelbel Junior wrote:
> Well, being more specific...
> The computer between the clients and the Mikrotik (border gateway) is
> a squid proxy operating in bridge, to intercept all traffic on the
> port 80

Then it's not a bridge because squid intercepts all packets and
generates new packets in response

However, there is an interesting new feature of squid, which was
discussed a couple of days ago, which allow squid to remark packets with
an outgoing firewall mark based on the incoming mark. With some thought
you might be able to leverage this to mark the packets in some way to
indicate they are valid to your next router (vlan tag, mac adjustment,
something else...)

Good luck

Ed W
