From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [OT] Hello?
Date: Thu, 27 May 2004 17:06:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405271706.08491.Antony@Soft-Solutions.co.uk>
References: <FLECICIIDHIEIENHHOOLMEOLCAAA.esanz@minorplanetusa.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLECICIIDHIEIENHHOOLMEOLCAAA.esanz@minorplanetusa.com>
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

On Wednesday 26 May 2004 4:57 pm, Erick Sanz wrote:

> Since the gurus are bored and looking forward to help...

If you mean me (I posted the "Hello?" message), no, not getting bored, just 
testing the list to see if there was a server problem.

On Thursday 27 May 2004 3:50 am, Mark E. Donaldson wrote:

> I noticed the same thing myself. In fact yesterday I went as far to make
> sure I hadn't inadvertently been removed from the list. But Nope - all is OK
> - just quiet.

That doesn't explain why my posting on Monday evening didn't appear on the 
list until Wednesday lunchtime.....

Anyway, back to Erick's question...

> 	I was wondering what would be the best way to avoid DOS against
> a server that has a web site on it with SSL ( ports 90 and 443 )...
>
> 	I have seen several ideas; what is everybody using?
>
> 	I believe the accept so many connections a second and then drop
> might be the best...

I would say so, yes.   After all, you need to allow connections (fairly 
frequently, too, for a web server), but you don't want to allow a flood, so 
restricting maximum rate is a good approach.

What's TCP port 90 used for, by the way?

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


