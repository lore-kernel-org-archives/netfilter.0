From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: quickie - exclamation point with multiport
Date: Wed, 17 Dec 2003 10:00:34 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57C60@OST_EXCH_USR5>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Aha - that would explain why I was confused ....



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Laurence J. Lane
Sent: 17 December 2003 9.32
To: netfilter@lists.netfilter.org
Subject: Re: quickie - exclamation point with multiport


On Wed, Dec 17, 2003 at 09:49:37AM +0100, Cedric Blancher wrote:

> > Justa quick one - I use $DMZPORTS to define the ports I wish to be
allowed
> > inbound on the forward chain - can I use 
> > ! -m multiport --dports $DMZPORTS
> > to mean "any port that isn't specified by $DMZPORTS"?

> Match is called "mport", not "multiport". So you call it using :

FWIW, multiport is the stock match. mport is an enhancement to
multiport and is currently supplied in patch-o-matic base.



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


