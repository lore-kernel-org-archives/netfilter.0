From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Sun, 2 Oct 2005 12:18:26 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510021142470.6283@filer.marasystems.com>
References: <dhmn38$hsk$1@sea.gmane.org> <200510011907.27026.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0510020410200.21519@filer.marasystems.com>
	<dhnoqq$bq8$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dhnoqq$bq8$1@sea.gmane.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Robert Nichols <rnicholsNOSPAM@comcast.net>
Cc: netfilter@lists.netfilter.org

On Sat, 1 Oct 2005, Robert Nichols wrote:

> Actually, I find that an unsolicited TCP SYN/ACK packet matches state
> INVALID and does not match state NEW.

Right.. this is one of very few exceptions (SYN/ACK, FIN, RST) where 
otherwise valid TCP packets gets handled as INVALID if there is no 
existing session. A lonely SYN/ACK is nearly always "bad", and in worst 
case the SYN will need to be retransmitted for the session to get 
established when it is for real.

I am not entirely sure about the reasoning why a lone FIN is seen as 
invalid. The comment only says "Too late and no reason to do anything...". 
Also not entirely sure why a lone RST is seen as invalid. Both FIN and RST 
carries valuable meaning when resuming forgotten sessions.

> I receive a handful of packets like that each day. I see the same thing
> with packets having a bad TCP checksum.  They also get classified as
> INVALID.

Packets with bad checksums should be INVALID as these can by definition 
not be part of a valid session (the packets are not valid).

Regards
Henrik

