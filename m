From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: NetBios iptables trouble with small TCP packets
Date: Fri, 2 Jan 2004 19:41:02 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401030341.i033f1P1016102@server5.bandwidthco.com>
References: <BAY1-F21Thriq1KIvQi00024cab@hotmail.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY1-F21Thriq1KIvQi00024cab@hotmail.com>
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
To: 'sp3 sp3' <sp3@hotmail.com>, netfilter@lists.netfilter.org

Questions:

1. Are we to assume that large files (>256kb) transfer just fine? Or, is
there a problem with them too?

2. Which direction is the transfer?  NT -> W2K or W2K -> NT?

3. By transfer, do you really mean "copy" using File & Print sharing?  I'm
assuming this to be the case you say you are using NBT.

4.  Are these machines (both NT & W2K) members of a domain, and if so is it
the same domain?  What is the setup here.  This is necessary to know because
SMB must negotiate the means of authentication and then authenticate before
any transfer can take place.

5.  What rules do you have in place that you feel should permit the SMB
packets to pass through the firewall?

6.  What does the "Windump" output on the sending machine show for the
packets generated during the "hang period" when run as "windump -n -vv -xX
-i2"?



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of sp3 sp3
Sent: Friday, January 02, 2004 6:54 PM
To: netfilter@lists.netfilter.org
Subject: NetBios iptables trouble with small TCP packets

I,

I have two networks connected with a linux firewall/router that is running
RH8 and a firewall script.
I'm having a problem with the transfer of small files (<256kb) using NetBios
over TCP/IP between a NT4 machine and a win2k machine.
The fw is doing source nat.
The problem is that when i transfer a small file, the win2k machine seams to
hang for a moment ( 10 seconds ) and displays an error.
I have searched the MS site for the error and i have found that it's related
to a time out.

I have searched the logs, and nothing unusual is reported.
I have checked the firewall logs also, and no drop packet is found ( i log
all "can't happened" rules ).

I have tried many things, like:
- checking the MTU of the interfaces
- cheching the mss value using ifconfig
- each NIC uses a separate IRQ

The problem is on the fw/router machine 'im shure. I know it, because a have
tried to put the same machines on the same LAN and there is no problem.

Does any one have any sugestion for this stange problem?

Best regards,
Sp3

_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE*
http://join.msn.com/?page=features/junkmail




