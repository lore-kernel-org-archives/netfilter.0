From: Patrick McHardy <kaber@trash.net>
Subject: Re: how to add packet or byte couters to connection tracking module
Date: Fri, 21 Feb 2003 01:49:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5577AE.9000309@trash.net>
References: <Pine.LNX.4.44.0302200959310.13403-100000@ski.isi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0302200959310.13403-100000@ski.isi.edu>
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
To: Xuan Chen <xuanc@isi.edu>
Cc: netfilter@lists.netfilter.org

Xuan Chen wrote:

>Hi,
>
>I want to add a packet or byte counter to the connection tracking module 
>in netfilter. That is, I want to track how many packets and bytes having 
>been sent through one connection. Where should I start? Any examples will 
>be very helpful!
>
>btw, is there a search engine on netfilter's web page? I think that's 
>really helpful if people want to search for previous work and discussions.
>
>Thanks,
>-chen
>
>  
>

http://www.google.com/search?hl=en&lr=&ie=ISO-8859-1&q=conntrack+match+bytes+per+connection&btnG=Google+Search
Doesn't apply clean to 2.4.20 iirc, but very easy to fix.

Patrick


