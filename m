From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: dnatted interface showing up as FW interface
Date: Thu, 11 Dec 2003 16:20:01 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57C04@OST_EXCH_USR5>
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

hi list - hope everyone's feeling christmassy!

This is another of my dumbo questions, I've had a good look through the
archives and googled but haven't turned up much helpful [maybe my search
syntax wasn't good?], so ....

Why would an address that DNATs quite happily inbound

217.x.x.138 -> 192.168.1.2

show up as the router address when performing outbound traffic - for example
when delivering mail it is connecting from 137, instead of 138?

Is there a forward rule I've forgotten?  Or do I need to do another DNAT
rule translating 192.168.1.2 -> 217.79.119.138?

Thanks for any pointers

Steve


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


