From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Need help with rate-limiting NTTP traffic
Date: Thu, 1 Apr 2004 09:16:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404010916.58286.Antony@Soft-Solutions.co.uk>
References: <20040331165409.0d498074@daneel.volumen.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040331165409.0d498074@daneel.volumen.net>
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
To: netfilter@lists.netfilter.org

On Thursday 01 April 2004 12:54 am, Shane Hickey wrote:

> 	Basically, I have a fat upstream pipe and I can use it basically
> all I want, except that my NNTP traffic seems to really clobber
> everything else.  Also, since my NNTP traffic is pretty much constantly
> ongoing, I'd like to limit it to 800kbit.

What are you using as your NNTP server?   If it's INN, I'm pretty sure that 
has its own rate-limiting mechanism as a configuration parameter, and you'd 
be better off doing rate limiting in the application itself if it's at all 
possible.

Even if you're using something other than INN, have a look at the 
configuration options for the server and see if you can solve this problem 
there before resorting to netfilter and tc.

Regards,

Antony.

-- 
This email was created using 100% recycled electrons.

                                                     Please reply to the list;
                                                           please don't CC me.


