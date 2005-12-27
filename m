From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: largescale NAT
Date: Tue, 27 Dec 2005 17:44:50 +0100
Message-ID: <200512271744.51422@nienna>
References: <43B16A57.508@fiktiv.szgtikol.kando.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43B16A57.508@fiktiv.szgtikol.kando.hu>
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


  Hi,

On Tuesday 27 December 2005 17.22, DEXTER wrote:
> Why isn't there any documentation on how linux handles free, and
> occupied ports on a NAT box, how to fine tune the box when lots of user
> are behind it, etc..?
>
> So my question is: How to handle this situation? I mean, just 1 NAT
> linux box is able to handle all the 400+ users with the above
> situations? Or we have to do something like CONNLIMIT on source ips? Is
> there possibilities to balance the traffic on 2 or more NAT box?

  Whether or not your NAT box will be able to handle the situation mainly 
depends on your traffic pattern and available uplink bandwidth. For 400+ 
users the number of available ports on a single IP seems to be a serious 
limitation, so first of all you'd probably have to get multiple routable IP 
addresses and share connections between those multiple public IPs.

  The algorithm Netfilter uses to balance connections between multiple 
public IPs depends on the kernel version, so it's hard to say more about 
this without this crucial piece of information.

-- 
KOVACS Krisztian

