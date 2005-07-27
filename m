From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: RST packets
Date: Wed, 27 Jul 2005 00:28:03 -0500
Message-ID: <42E71B63.90606@riverviewtech.net>
References: <Pine.LNX.4.61.0507181604210.26471@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507181604210.26471@yvahk01.tjqt.qr>
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
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

>
>
>a simple question, though I could not clearly read it from the TCP RFC...
>do RST packets always have ACK set?
>
If memory serves me right the appearance of the ACK flag in a packet 
with the RST flag is based on the packet that the packet with the RST 
flag is setting.  In other words if the packet that is being reset has 
the ACK flag set then the ACK flag will not be set in the packet with 
the RST flag.  Conversely if the packet that is being reset does not 
have the ACK flag set then the ACK flag will be set in the packet with 
the RST flag.  Translation I think it is an XOR issue.

Note:  This was based on many hours of reading and following RFCs and 
other things.  This was the simplest summarization that I could find at 
the time.  I think I have a different reply to this mail list talking 
about using the recent match extension to test for stray RST packets, I 
could look back and see what I can find in my notes if you would like me to.



Grant. . . .

