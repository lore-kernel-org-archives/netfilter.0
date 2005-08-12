From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Transparent proxy where source IP address remains unchanged --
 possible?
Date: Fri, 12 Aug 2005 00:02:40 -0500
Message-ID: <42FC2D70.7000701@riverviewtech.net>
References: <20050809012914.GA23108@bostoncoop.net>	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>	<20050811130700.GA15463@bostoncoop.net>	<Pine.LNX.4.61.0508112117380.23117@yvahk01.tjqt.qr>
	<42FBB957.30003@rosi-kessel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42FBB957.30003@rosi-kessel.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

>>Then just use DNAT.

This will not work because it causes a routing triangle.  Consider the packet traversal with associated addresses here:

usrbox -> faketarget
faketarget -DNAT-> realtarget
realtarget -> userbox

What is most likely happening (verifiable via TCPDump) is that the traffic IS getting DNATed as you want.  However when the realtarget replies to the traffic it will go directly to the userbox with out being unDNATed.  Thus the source address on the reply packet is from the realtarget, a box which userbox was not talking with and thus the standard TCP/IP stack will DROP and disregard the packet.  TCPDump should see these replies coming back in.

> Right, that's where I started. What I'm trying to figure out is why when
> I only use DNAT packets don't seem to get forwarded to the new
> destination. They only show up if I also change the source IP to be the
> address of the proxy.
> 
> Is this because the final destination is rejecting the packets, or the
> proxy server is not actually passing them on?

I would bet that the final destination userbox is rejecting what it believes to be half open connections that it does not know any thing about.

> I think I may not properly understand some architectural detail here.  I
> am changing the destination IP in DNAT/PREROUTING.  Is there anything
> else I need to do to make sure the packet is properly passed on to the
> destination, where the proxy basically "disappears" as a middleman?

Is the faketarget and realtarget on the same subnet or are they on different subnets?  The reason that I ask is if you could make the traffic returning from realtarget back to userbox pass through faketarget it could be unDNATed and then sent back to the userbox.  However to pull this off you would have to play with the routing on the realtarget to make it use faketarget as it's upstream gateway and then do postrouting SNATing of the source IP back to that of the faketarget as the traffic left the faketarget.  This same idea can be expanded upon if the faketarget and realtarget are not on the same subnet, but it is not easy.



Grant. . . .

