From: Jason Opperisano <opie@817west.com>
Subject: Re: LAN Proxy - iptables gateway
Date: Fri, 10 Sep 2004 08:16:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094818572.1900.38.camel@wolfpack.ljm.dom>
References: <20040910053608.7FBE0716@mail.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040910053608.7FBE0716@mail.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 2004-09-10 at 01:36, Manikandan wrote:
> How do I stop this? I don't want users in other network to access internet
> through my iptables. Please help me. Thanks in advance. 

apply the bat-upside-the-head patch from the "maybe you want i should
break your freakin' legs?" repository.

a short term solution would be to identify the proxy machine (which you
seem to have done) and block access from it either by IP address or MAC
address.

-j

-- 
Jason Opperisano <opie@817west.com>


