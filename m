From: Andy Walden <andy@tigerteam.net>
Subject: Re: libipt_drop.so: cannot open shared object file
Date: Tue, 29 Jun 2004 08:01:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E15A11.1050900@tigerteam.net>
References: <40E10006.3060805@tigerteam.net> <20040629070152.GA2037@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040629070152.GA2037@zion.homelinux.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org

Sven Schuster wrote:

>Hi Andy,
>
>On Tue, Jun 29, 2004 at 01:37:10AM -0400, Andy Walden told us:
>  
>
>># ./iptables -I INPUT -s 217.238.177.2 -j drop
>>iptables v1.2.11: Couldn't load target 
>>`drop':/usr/local/lib/iptables/libipt_drop.so: cannot open shared object 
>>file: No such file or directory
>>    
>>
>
>try DROP instead of drop, then it should work.
>  
>
That was it, thank you!

>
>Sven
>
>  
>
>>I just started getting this one day. Searches show only three hits for 
>>that file and there is no sign of it in my distrobution or the source 
>>package. Any ideas as to what I'm seeing here? Thanks for the time.
>>
>>-- 
>>Best Regards,
>>Andy Walden
>>
>>    
>>
>
>  
>


-- 
Best Regards,
Andy Walden


