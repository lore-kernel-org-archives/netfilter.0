From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: question about String
Date: Sun, 26 Aug 2007 17:05:44 -0400
Message-ID: <20070826210544.GB11193@minastirith>
References: <620717.8047.qm@web43138.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <620717.8047.qm@web43138.mail.sp1.yahoo.com>
Content-disposition: inline
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
To: netfilter@lists.netfilter.org

On Aug 24, 2007, Allan Parreno wrote:

> Hello,
> 
> how do i configure that all mp3 extention will block using iptables --string value?
> 
> is this correct?
> 
> /sbin/iptables -I INPUT -j DROP -p tcp -s 0.0.0.0/0 -m string --string "*.mp3"

The string match extension does not support wildcard operators; just
strings.  An equivalent rule to what you are trying to accomplish above
would be to just remove the "*" from "*.mp3".  However, you may find
that this is too broad a rule and that it starts to mess with legitimate
communications since ".mp3" is not a very specific search criteria.

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F

