From: dir@att.net
Subject: Re: Can IPTABLES be used to send alerts!
Date: Wed, 27 Aug 2003 14:10:30 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E19s10M-00014S-Ge@kashyyyk.netfilter.org>
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
To: Deshwal Chand <CDD@kampsax.co.in>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Yes, this would be pretty straightforward to do if you are a C developer.

You can use the QUEUE target to queue all HTTP traffic to userland.  You 
would then build a userland program to monitor packets for a set of suspect 
keywords.

This approach wouldn't be bullet-proof because the HTTP traffic will be 
fragmented to the MTU size, but it would probably catch 99% of the keywords 
you care about.  With a little more code, you could demux the TCP traffic to 
rebuild the entire TCP stream, thereby making it 100%, but that's a lot more 
effort for little return IMO.

Regards, dir

> HI,
> 
> I don't know whether this is the right place to raise this post.
> 
> I am using IPTABLES and Squid. I want to monitor all the traffic going out
> of this box. Suppose someone sends his/her CV from our network using his/her
> Yahoo or Hotmail account, then I may get an alert.
> 
> Can IPTABLES do this by using some addones!!
> 
> Pls. pardon me if i am being wrong in posting this question on this list.


