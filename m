From: Samuel Jean <sj-netfilter@cookinglinux.org>
Subject: Re: Public IP Confusion
Date: Wed, 17 Nov 2004 17:19:09 -0500
Message-ID: <419BCE5D.90908@cookinglinux.org>
References: <cbbdce6c04111713523d175e8f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cbbdce6c04111713523d175e8f@mail.gmail.com>
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
To: Todd L <00todd@gmail.com>
Cc: netfilter@lists.netfilter.org

Todd L wrote:

>What I though I could do is have ISP ethernet to  Eth0 on linux box.
>Eth1 on linux box to switch and then somehow make the linux box
>transparent to the network. From what I have read it almost seems like
>I need a mix of SNAT and NAT but I am unsure on how to proceed. I have
>read a lot of the documentation and HOWTOs  and I have not found any
>examples of this type of a scenario.
>
>Any Advice?
>
>  
>
The ebtables project is exactly for doing some transparent filtering.
Just set up a bridge between your ISP and your network depending
on your Internet connection type.
(ex.: you wouldn't be able to filter PPPoE stream yet.)

For more information :

http://ebtables.sourceforge.net/

*note:* bridging filtering is part of the linux 2.6 series
             there's a patch for 2.4


>Thank you,
>
>Todd
>
>  
>
HTH,

Samuel

