From: "Ian! D. Allen" <idallen@idallen.ca>
Subject: Re: Differences between -j MARK and -j CONNMARK
Date: Sun, 20 Feb 2005 18:33:04 -0500
Message-ID: <20050220233304.GB21766@elm.home.idallen.ca>
References: <009f01c5101f$6302ddd0$910010ac@coco>
	<1108125634.4489.24.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1108125634.4489.24.camel@hubcap.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org


> i have found that version 1; i.e using -j MARK --set-mark instead of
> -j CONNMARK --set-mark, is more reliable.  i have no idea why this is.

Here's why:

Version 1:
a) iptables -A POSTROUTING -t mangle -j CONNMARK --restore-mark
b) iptables -A POSTROUTING -t mangle -m mark ! --mark 0 -j ACCEPT
c) iptables -A POSTROUTING -t mangle -m ipp2p --ipp2p -j MARK --set-mark 30
d) iptables -A POSTROUTING -t mangle -m ipp2p --bit -j MARK --set-mark 30
e) iptables -A POSTROUTING -t mangle -j CONNMARK --save-mark

Version 1 Explanation:
 a) copy the connection mark (may or may not be zero) to the packet mark
 b) if this packet now has a mark, accept it (and leave the chain)
 c+d) possibly set the packet mark using the ipp2p module
 e) copy the packet mark (may or may not be zero) to the connection mark

In other words, the above marks a packet and then copies the mark to
the connection mark.  That means *all* the packets are marked, even
the very first one.  Once a connection is marked, all further packets
inherit that mark.  This is what you want.

Version 2:
a) iptables -A POSTROUTING -t mangle -j CONNMARK --restore-mark
b) iptables -A POSTROUTING -t mangle -m mark ! --mark 0 -j ACCEPT
c) iptables -A POSTROUTING -t mangle -m ipp2p --ipp2p -j CONNMARK --set-mark 30
d) iptables -A POSTROUTING -t mangle -m ipp2p --bit -j CONNMARK --set-mark 30
e) iptables -A POSTROUTING -t mangle -j CONNMARK --save-mark

Version 2 Explanation:
 a) copy the connection mark (may or may not be zero) to the packet mark
 b) if this packet now has a mark, accept it (and leave the chain)
 c+d) possibly set the connection mark using the ipp2p module
 e) copy the zero packet mark to the connection mark, overwriting the
    good work just done by c) and d) with zero [THIS IS BAD]

In other words, Method #2 doesn't work.  It never sets any new connection
marks.  The only time it might stagger along is if you happen to already
have some connection marks from some other rules - Method 2 will use
those existing connection marks to mark packets.  But it will never
create any new connection marks.

If you replace the last rule in either version with this one:

e) iptables -A POSTROUTING -t mangle -m mark ! --mark 0 -j CONNMARK --save-mark
   (only transfer the packet mark to the connection mark if it is not zero)

then you'll have a count of the number of *new* connection marks being
created.  You'll see that Version 2 always creates zero new marks...

-- 
-IAN!  Ian! D. Allen   Ottawa, Ontario, Canada
       EMail: idallen@idallen.ca   WWW: http://www.idallen.com/
       College professor (Linux) via: http://teaching.idallen.com/
       Support free and open public digital rights:  http://eff.org/

