From: Rio Martin <rio@martin.mu>
Subject: Re: Blocking Streaming Media (Was: Re: (no subject)..)
Date: Wed, 2 Jun 2004 14:32:36 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406021432.36436.rio@martin.mu>
References: <20040601053750.50670.qmail@web61008.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040601053750.50670.qmail@web61008.mail.yahoo.com>
Content-Disposition: inline
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

On Tuesday 01 June 2004 12:37, SBlaze wrote:
> --- Rio Martin <rio@martin.mu> wrote:
> > On Monday 31 May 2004 18:18, Ivan wrote:
> STRING matching is at best a primative method of any kind of filtration. It
> has been demonstrated and documented many times here that it's simply not
> an efficent option. However I do think I might can help with this. First
> you need to identify what and where the radio stations are coming from. If
> they are from the new Yahoo LAUNCHcast...stoping them should be fairly
> easy...with some work.
> First this is good info to know...
> http://search1.cc.dcn.yahoo.com/cct_search.php?ui_mode=answer&prior_transac
>tion_id=248668163&action_code=5&answer_id=14755094#__highlight
> It contains info for firewalls and LAUNCHcast.
> Assuming you are NATing your internal machines.... set up rules to block
> certain hosts at yahoo.

I guess, blocking ports or defining ports to be allowed to users is not 
enough. Users are clever and smart from day to day. Once the originial and 
standard ports blocked by administrator, they use port forwarding sometimes 
to some kind of hosting server or dedicated server, and they still able to do 
music streaming.

If you checkout the greatest site, let say www.shoutcast.com, u can see lots 
of stations use port 80, it means connecting to radio stations would be the 
same as clients surfing to the web. 

I'm still thinking patch-o-matic STRING would be the best solustion for now ..

Regards,
Rio Martin.

