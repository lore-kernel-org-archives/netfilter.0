From: Mariusz Kruk <Kruk@epsilon.eu.org>
Subject: Re: 2 subnets
Date: Thu, 21 Apr 2005 16:25:15 +0200
Message-ID: <20050421142515.GA15572@epsilon.rdc.pl>
References: <a3382a6979.a6979a3382@vsnl.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <a3382a6979.a6979a3382@vsnl.net>
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

On Thu, Apr 21, 2005 at 07:18:33PM +0500, varun_saa@vsnl.net wrote:
> Hello,
>       My server is on Mandrake10.1
> eth0 is WAN with static IP connected to 512Kbps DSL.
> 
> We have two subnets :
> 
>    192.168.0.0/24
>    192.168.21.0/24
[...]
> My question is having seperate network card 
> for each subnets a better option.
> 
> eth1 and eth2.
> 
> Or eth1 and eth:1 is also fine

This depends on two things:
1. Do you want to physicaly separate these two network segments?
2. If you want to, for example, shape the traffic, you'll have a more
complicated setup if you have separate interfaces.

Therefore it's up to you and depends only on your needs in this matter.

-- 
/\-\/\-\/\-\/\-\/\-\/\-\/\ Always  remember  that you are unique.  Just
\  Kruk@epsilon.eu.org   / like everyone else.
/ http://epsilon.eu.org/ \ 
\/-/\/-/\/-/\/-/\/-/\/-/\/ 

