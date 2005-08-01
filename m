From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: MSN and Yahoo
Date: Mon, 01 Aug 2005 13:41:00 +0200
Message-ID: <42EE0A4C.3090206@lopsch.com>
References: <20050801071846.9262.qmail@web53107.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050801071846.9262.qmail@web53107.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

umar draz schrieb:
> hi dear members!
>  
>   i have a cable internet and have 300 users. I want
> block MSN and 
> Yahoo voice chat. Please help me how i can do that
> with iptables.
>  
> Please help me in this regards,
>  
> Umar Draz
> 
> 
> 		
> ____________________________________________________
> Start your day with Yahoo! - make it your home page 
> http://www.yahoo.com/r/hs 
>  
> 
> 
This shouldn't work behind NAT without UPnP or a tracking module. So no 
needs to block. This is because both send information for direct 
connections within the payload and therefor out of reach of connection 
tracking and NAT.

