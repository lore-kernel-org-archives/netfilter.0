From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Interesting article about punching holes in firewalls...
Date: Mon, 18 Dec 2006 23:34:30 +0100
Message-ID: <45871776.20402@rtij.nl>
References: <45860240.2040102@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45860240.2040102@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Linux Advanced Routing and Traffic Control <lartc@mailman.ds9a.nl>, Mail List - Netfilter <netfilter@lists.netfilter.org>

Grant Taylor wrote:

> I ran across an interesting article 
> (http://www.heise-security.co.uk/articles/print/82481) (1) that I 
> think any and all firewall administrators should take a few moments to 
> read.
>
> I personally have known that using "-m state --state 
> ESTABLISHED,RELATED" was not the most secure thing to use for 
> returning traffic.  Namely this will allow you to make a valid 
> connection to a web server, say to retrieve a picture.  Then said web 
> server could send malicious traffic back to your computer and pass 
> through your firewall.  This is because the traffic coming from the 
> web server to your computer is now deemed as RELATED.  Previously I 
> have written this off as not needing to worry about this (much) YET.  
> Yet being the operative word.  I have long known that I would, 
> especially on more secure installs (read not SOHO) need to filter 
> inbound traffic based on source / destination port.  I just have not 
> thought that it was important enough to do presently for my 
> clientele.  Unfortunately, the day where we do as much filtering on 
> related traffic as we do on non related traffic may be closer at hand 
> than we all would like to admit.  :(
>
>

Well, this only works for UDP, and only if you allow everything out. 
Fortunately, on any non-soho setup, you should not allow everything out, 
only what you really need to leave the network. problem solved.

(Well the only problem solved is hole punching, not that skype, 
messenger, etc can use about any transport that is open. The only thing 
they don't do yet is tunnel over DNS I think :-).

HTH,
M4


