From: Patrick McHardy <kaber@trash.net>
Subject: Re: iptables MARK + ip rule fwmark on locally generated packets
Date: Fri, 22 Jan 2010 12:41:07 +0100
Message-ID: <4B598ED3.9060109@trash.net>
References: <20100122100755.GB23731@ioi.dk> <4B597967.3060603@trash.net> <20100122103118.GG23731@ioi.dk> <4B5983B9.2010106@trash.net> <20100122111257.GH23731@ioi.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100122111257.GH23731@ioi.dk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fredrik Ax <frax@axnet.nu>
Cc: netfilter@vger.kernel.org

Fredrik Ax wrote:
> On Fri, Jan 22, 2010 at 11:53:45AM +0100, Patrick McHardy wrote:
>>> So, to accomplish this I would have to oute it through a dummy
>>> interface to make iptables able to mark it before it goes out?
>> You need some criteria for your routing rules that is available
>> when the socket is routed. That's everything but the packet mark.
>> Using a seperate device will work.
>>
>> For ethernet, the macvlan device might be a good choice if you
>> don't mind using different MAC addresses for each IP.
> 
> Thanks, I'll have a look at it ... 
> 
> Just one more question, the host is actually run as a domU on XEN and
> all of the eth2-4 interfaces are on a in dom0 created bridge, bridging
> in a vlan where the tagged traffic is on a blanace-rr bond-device.
> 
> Would it create any problems creating a macvlan device on top of this?

No, that should be fine.
