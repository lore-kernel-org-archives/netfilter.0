From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: Replacing firewall issues
Date: Sat, 14 Jan 2012 03:20:41 +0100
Message-ID: <1326507641.3369.15.camel@ns014530.dcyb.net>
References: <1326180504.2680.14.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1326180504.2680.14.camel@ns014530.dcyb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tue, 2012-01-10 at 08:28 +0100, Rob Sterenborg (lists) wrote:
> Hi,
> 
> I'm having trouble replacing an old server (CentOS 5) for a new one
> (CentOS 6). The layout is basically like this:

[snip rest of original post]

To follow up on this.. It may happen to someone else.

The issue here doesn't seem to be MAC addresses or ARP tables. When we
replaced the server and configured the NIC's of the new server to have
the MAC addresses from the old server, flushed all ARP caches, etc. it
still didn't work.

When I asked if the old and new server were on the same switch, I was
told they weren't. When I asked if both switches are of the same type, I
was told they aren't. (I don't know of either switch what type it is
because I don't admin them.)
So I asked to unplug the old server and plug the new server in the same
switch as the old server was. Things started working at once!

I'm sure it's some configuration error on the newer switch, but since I
don't admin the switches I can't tell. (VLAN config seems to be correct
on the switch that didn't work, because packets did arrive on the
internet NIC.. It's just that forwarding didn't work at all. Well,
anything goes, find that out later.)


--
Rob


