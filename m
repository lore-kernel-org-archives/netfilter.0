From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: NAT Helpers?
Date: Sun, 11 Sep 2005 07:08:54 -0500
Message-ID: <200509110708.54551.rob0@gmx.co.uk>
References: <43226984.5070607@cp.centennialcollege.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43226984.5070607@cp.centennialcollege.ca>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Saturday 2005-September-10 00:05, James Stickland wrote:
> My problem with this network setup is that when the terminal server

With WHAT network setup? I saw no information about a network.

> attempts to join the domain, or do such things as browse all the
> network shares (as opposed to typing in their ip address), it
> attempts connections to the 10.10.10.7 broadcast address.  The
> problem lies within the router  - it does not forward broadcasts.

Why not? A broadcast is just another IP. This is sometimes true but not 
always true. It might depend on your rules. A clear explanation of the 
issue helps in finding a resolution.

> With netfilter, are there any nat helpers I can use  for forwarding 
> broadcasts between interfaces? Im looking for something similar to
> the  cisco ip nat helpers.

Apparently no one knows. I've been fortunate to avoid Cisco routers, 
myself, so I don't know what they do with broadcasts. (I bet few Cisco 
admins would know, either!)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

