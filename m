From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: NetBios iptables trouble with small TCP packets
Date: Sun, 4 Jan 2004 09:16:54 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401041716.i04HGlP1026392@server5.bandwidthco.com>
References: <BAY1-F494QzPW8AAkjt0000729e@hotmail.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY1-F494QzPW8AAkjt0000729e@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'sp3 sp3' <sp3@hotmail.com>
Cc: netfilter@lists.netfilter.org

OK - if I were to try and summarize all this information up and draw a
conclusion, it would be this:

You only have the problem with files < 250 KB, and the same problem cannot
be replicated on another machine with the same rule set.  That pretty much
eliminates Netfilter/Iptables as the cause of the problem. Name resolution
and authentication have been R/O as a possible cause as well.  The protocol
traces show that at "hang time", the SYN packet makes it through the
firewall, and it is properly SNATTED.  However, there is no return ACK,SYN.
I suggest this pretty much narrows the problem down to one of the network
interface cards, or their associated drivers, the packets are passing
through.  If the NIC is improperly computing the Frame CRC for packets with
small payloads, then the receiving will machine will view this as a
corrupted packet and silently drop it.  I would begin by looking there.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of sp3 sp3
Sent: Saturday, January 03, 2004 2:44 PM
To: markee@bandwidthco.com
Cc: netfilter@lists.netfilter.org
Subject: RE: NetBios iptables trouble with small TCP packets




>From: "Mark E. Donaldson" <markee@bandwidthco.com>
>Reply-To: <markee@bandwidthco.com>
>To: "'sp3 sp3'" <sp3@hotmail.com>, <netfilter@lists.netfilter.org>
>Subject: RE: NetBios iptables trouble with small TCP packets
>Date: Fri, 2 Jan 2004 19:41:02 -0800
>
>Questions:
>
>1. Are we to assume that large files (>256kb) transfer just fine? Or, 
>is there a problem with them too?

No, there is no problem with big files.

>
>2. Which direction is the transfer?  NT -> W2K or W2K -> NT?

W2K -> NT.

>
>3. By transfer, do you really mean "copy" using File & Print sharing?  
>I'm assuming this to be the case you say you are using NBT.

I map a network drive, autehntication is requested, and the network drive is
mapped with success.
Yes, copy and paste.
>
>4.  Are these machines (both NT & W2K) members of a domain, and if so 
>is it the same domain?

NT is member of a domain. W2K is not member of any domain.

>What is the setup here.

On the NT server we have some files that must be accessed by the w2k
machines (on the other network). Each w2k machine have as the default
gateway the firewall that does the source nat.
To reach the nt server, i'm not using NetBios names nor lmhosts, just plain
ip address.

>This is necessary to know because
>SMB must negotiate the means of authentication and then authenticate 
>before any transfer can take place.
>

>5.  What rules do you have in place that you feel should permit the SMB 
>packets to pass through the firewall?

I dont filter any traffic that exits the firewall via output nor via
forward.
The default policy for forward is accept, for output is accept and for input
is drop.
At the input chain i permit all the established and related traffic.
I permit just ssh on the input chain. All the rest is logged.
Any suspicios packet (invalid IP and or netmask is logged and dropped).

I have tested the same rules with another firewall runnig the same linux
version, and all is ok.

>
>6.  What does the "Windump" output on the sending machine show for the 
>packets generated during the "hang period" when run as "windump -n -vv 
>-xX -i2"?

I dont know what windump is, but it seams looking at the parametrs that it
is something like tcpdump.

I have runned a tcpdump on the exterior interface of the fw, and saw nothing
suspecios. The source IP was the firewall (source nat ok) and the
destination was ok too.
The last packet that is sent has the direction of fw->NT and i dont seen any
repply (ack) to it.
After some time the nag error message just displays it self on the W2K
machine.

I will post the windump/tcpdump result on my next message to the list.


Thanks for the repply.

_________________________________________________________________
The new MSN 8: smart spam protection and 2 months FREE*
http://join.msn.com/?page=features/junkmail




