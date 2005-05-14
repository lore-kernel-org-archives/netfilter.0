From: Jason Opperisano <opie@817west.com>
Subject: Re: Internal PC/external Gateway
Date: Sat, 14 May 2005 11:36:08 -0400
Message-ID: <20050514153608.GA24455@bender.817west.com>
References: <1116061176.12835.20.camel@debianbox>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1116061176.12835.20.camel@debianbox>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, May 14, 2005 at 11:59:36AM +0300, Sadus . wrote:
> Hello,
> So here's my current setup at home.
> I control Provider 2. (which is not more than a simple box taking
> internet from provider 1 and that internet sharing enabled, restricted
> to the box' internal network and my IP which is on the external
> interface).
> I also control the Linux GW.
> 
>                                                                  
>                                           +------------+        
>                                           |            |       |
>                                       ----+ Provider 1 +-------
>         __                            |   |            |     /
>   PC1__/  \_         +------+-------+ |   +------------+    |
>   _/        \__      |              | |                    /
>  /             \     |              | |                    |
> | Local network -----+Linux GW  eth0|-                     |Internet
>  \_           __/    |              | |                    |
>    \__     __/       |              | |                    \
>   PC2 \___/          +------+-------+ |   +------------+    |
>                                       |   |            |     \
>                                       ----+ Provider 2 +-------
>                                           |            |       |
>                                           +------------+        

how about following the instructions in the document you copied that
ASCII art from [1]?

to paraphrase the openbsd folks, "don't ask how to do something, explain
to us what you've done and where you got stuck."

-j

[1]:  http://lartc.org/howto/lartc.rpdb.multiple-links.html

--
"Stewie: For God's sake, shake me. Shake me like a British nanny."
        --Family Guy

