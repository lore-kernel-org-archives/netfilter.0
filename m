From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: RE: dnatted interface showing up as FW interface
Date: Thu, 11 Dec 2003 16:38:51 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57C06@OST_EXCH_USR5>
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

Ah, OK - so I need to do a SNAT rule for JUST that host?

Never read about DNAT and SNAT - although I did consider it to be a logical
way of dealing with it...



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: 11 December 2003 4.31
To: netfilter@lists.netfilter.org
Subject: Re: dnatted interface showing up as FW interface


On Thursday 11 December 2003 4:20 pm, Knight, Steve wrote:

> Why would an address that DNATs quite happily inbound
>
> 217.x.x.138 -> 192.168.1.2
>
> show up as the router address when performing outbound traffic - for
> example when delivering mail it is connecting from 137, instead of 138?

Probably because you have a general-purpose SNAT rule for outbound packets, 
setting the source address on everything to 217.x.x.137?

> Is there a forward rule I've forgotten?  Or do I need to do another DNAT
> rule translating 192.168.1.2 -> 217.79.119.138?

Change DNAT into SNAT in the above sentence, and yes.

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of
the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the
list;
                                                           please don't CC
me.




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


