From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: howto bind Mac to ip address
Date: Mon, 11 Aug 2003 09:05:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030811130508.GA11493@cannon.eng.us.uu.net>
References: <007601c35fe1$01eb3d20$142a45ca@shahid>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <007601c35fe1$01eb3d20$142a45ca@shahid>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tariq Anwer <alien@aol.com.pk>
Cc: netfilter@lists.netfilter.org

On Mon, Aug 11, 2003 at 01:17:28PM +0500, Tariq Anwer wrote:

> Hi!

Hello,

You know that the MAC address is only visible on the same ethernet link.
Having said this, How are the IP addresses being assigned? If it's by
DHCP, then you can assign each MAC, a well-known IP and filter based on
that IP... If not, then you must be on the same ethernet link and just
use the the mac module (see "man iptables" and look for mac).

Ramin

> 
> I'm a new to Linux, I want to setup Linux NAT box for a small LAN with selective services to allow like only browsing for staff and other services for management like ftp msn chatting etc.
> 
>  
> 
> 1.>  I want to bind each MAC address to his or her assigned IP address so nobody should mess around to change his or her IP's.
> 
>  
> 
> 2.> I want to allow selective MAC addresses each time, so they are not allowed to use it all the time or I can block them whenever I want to.
> 
>  
> 
> I will highly appreciate if anybody could help me or direct me to any web site or article to build this Box successfully.
> 
>  
> 
> Best regards,
> 
>  
> 
> Alien

