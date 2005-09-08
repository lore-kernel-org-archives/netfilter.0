From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: block internal to access external proxy server
Date: Thu, 8 Sep 2005 11:18:07 -0500
Message-ID: <200509081118.07605.rob0@gmx.co.uk>
References: <200509070738.j877ci8q020340@iris.com.my>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509070738.j877ci8q020340@iris.com.my>
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

On Wednesday 2005-September-07 02:43, Soo Chun Keat wrote:
> I just implement a center firewall (iptables) with transparent proxy
> (squid) in my company. I block the msn and yahoo chatting program in
> my iptables rules. However, the users still can use external free
> proxy to use msn and yahoo messenger. May I know got any way for me
> to block the users for doing this and force all the traffic must go
> though my proxy?

The bottom line is that you must know more than your users. Don't 
provide outbound routing (and NAT if applicable) on protocols deemed 
unwanted. Don't let them out at all, if you can.

But what is this external proxy? How can you block it?

It does appear that you're using technology to try to solve a human 
problem. If they're motivated to continue doing this, you will find it 
very difficult to stay ahead of them. The providers, particularly MSN, 
are constantly changing their protocols to be harder to block.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

