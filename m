From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: Info STRING PATCH
Date: Wed, 18 Sep 2002 09:24:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020918132409.GC801@Ajftl1.ajfthome.on.ca>
References: <3D886FB0.3090907@assephira.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3D886FB0.3090907@assephira.com>; from francois.lacroix@assephira.com on Wed, Sep 18, 2002 at 08:21:04 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Lacroix francois <francois.lacroix@assephira.com>
Cc: netfilter@lists.netfilter.org



	*code maturity level not set to experimental on*
	 
	-- are my mime types b0rked??? the attachment shows
	up as a java applet in my balsa?? 
On 2002.09.18 08:21 Lacroix francois wrote:
> hello,
> 
> Hi, sorry to bother you, but it has been 2 weeks that i am working on 
> a netfilter patch firewall.
> I would like to had the H323 tftp and string netfilter patch.
> I am done with the H323 and tftp. I follow the instruction and 
> everything did go well.
> But i have a problem with the string netfilter patch.
> I had it to the kernel with out any problem as you can see it below.
> But i can't check the option in my kernel as the picture, i join to 
> this mail.
> Could anybody help me with that. I don't undestand why?
> 
> Thanks for awnsering and sorry to take your time.
> 
> @+
> Francois
> 
> 
> Here is how i had it to the kernel
> 
> I  lauch this command
> 
> ./runme --batch extra/string.patch
> 
> Testing... string.patch NOT APPLIED ( 2 missing files)
> The extra/string patch:
>  Author: Emmanuel Roger <winfield@freegates.be>
>  Status: Working, not with kernel 2.4.9
>    This patch adds CONFIG_IP_NF_MATCH_STRING which allows you to
>  match a string in a whole packet.
>    THIS PATCH DOES NOT WORK WITH KERNEL 2.4.9 !!!
>  Testing patch extra/string.patch...
>  Placed new Config.in line
>  Placed new Configure.help entry
>  Placed new Makefile line
>  Patch extra/string.patch applied cleanly.
> Applying patch extra/string.patch...
>  Patch extra/string.patch applied cleanly.
>  Placed new Config.in line
>  Placed new Configure.help entry
>  Placed new Makefile line
> 
> Excellent! Kernel is now ready for compilation.
> 
> 
> 


