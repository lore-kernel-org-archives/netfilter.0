From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Kazaa Ports
Date: Tue, 09 Sep 2003 09:51:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5DDAF7.1030602@Loudoun-Fairfax.com>
References: <Sea1-F28DUggCXOFTYv00010938@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Sea1-F28DUggCXOFTYv00010938@hotmail.com>
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
To: jimbo jones <jdvuyk_crap@hotmail.com>
Cc: netfilter@lists.netfilter.org



jimbo jones wrote:

>
> Have you fiddled with the firewall settings in Kazaa that supposedly 
> let you change the outgoing port to anything you like.


I don't know if Kazaa Lite has that option, but I'll look for it. We did 
set the maximum number of connections to 10 with the hopes that it would 
be happy with the ports I'd already opened. Unfortunately it appears to 
use source ports in sequence and doesn't reuse them, so all I did was 
delay the problem a few minutes.

> I have heard in cases that you can change this to, say, port 80 and 
> suddenly everything goes (web port and all).  However I have exactly 
> the same setup with exactly the same issue and this option didnt work 
> for me.  But maybe it will for someone else.


I posted an article a couple of days ago about this very issue: the 
ability of some programs to use commonly open ports for other types of 
connections and the ramifications this has on firewalling. Now we're on 
the other side of the fence viewing this as a "feature" rather than a 
threat. Of course if Kazaa didn't behave this way in the first place we 
wouldn't need to use other ports. Still the irony of the situation isn't 
lost on me.

>   Would also like to get this solved.
>
> Suggestions appreciated.
>
> Cheers
>

Ditto. SBlaze had an idea to use DNAT in PREROUTING, but I don't think 
that will work here. I can't predict which ports would need to be natted 
and if I nat every port it'll break all the other services. Something 
tells me the developers of Kazaa Lite just aren't too concerned about 
the security of our proprietary information ;-)

Jeff


