From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: browsing the "network 'hood" from LAN <-> DMZ
Date: Fri, 5 Dec 2003 13:47:28 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57B92@OST_EXCH_USR5>
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Duh

And again I say Duh.  What a spanner.

Thanks for that Chris - I am suitably larted.

S




-----Original Message-----
From: Chris Brenton [mailto:cbrenton@chrisbrenton.org] 
Sent: 5 December 2003 12.34
To: Knight, Steve
Cc: netfilter
Subject: Re: browsing the "network 'hood" from LAN <-> DMZ


On Fri, 2003-12-05 at 07:12, Knight, Steve wrote:
>
> I'm trying to get the LAN to be able to NBT browse the boxes in the DMZ,
but
> they won't.  I'm permitting all TCP and UDP from LAN to DMZ and back again
> ...  It looks like NetBIOS isn't going to and from eth0-eth1.

First off this is a ***BAD*** idea. You've just removed all security a
DMZ can provide and IMHO you are not much better off than if hosted the
servers on your internal network.

Now with all that said, on the internal network edit the lmhosts file
and add an entry for the system(s) on the DMZ. That or you could setup a
WINS server and point all your systems at it.

HTH,
C




.


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


