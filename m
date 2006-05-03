From: Thomas Kuiper <tkuiper-netfilter@inxsoft.net>
Subject: Re: about dettecting different TTL value
Date: Wed, 03 May 2006 13:18:24 +0800
Message-ID: <44583D20.6010703@inxsoft.net>
References: <1154.202.22.193.97.1146631315.squirrel@202.22.193.97>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1154.202.22.193.97.1146631315.squirrel@202.22.193.97>
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
To: isp@cgscomm.net, netfilter@lists.netfilter.org

Hi Hasan,

I think you want to filter with ebtables (like some cable ISP's do) based on 
the mac address. ttl is not good for that.

BR,
Thomas

isp@cgscomm.net wrote:
> Hello,
> 
> I am new here. I am working in an ISP. I like to know that how can I
> prevent user to use multiple computer with single internet connection? I
> have searched on the web and found nothing.
> 
> I think it is only possible by detecting different TTL value that comes
> from same IP address. And I didn't get any thing from the web. I like to
> know that is it possible to do with IPTABLES? And how can I detect
> defferent TTL Value with IPTABLES?
> 
> Please someone help me on this matter.
> 
> Thanks.
> 
> Hasan Syed Jowhor.
> 
> 
> 
> 
> 
> 
> 


