From: david@dark.x.dtu.dk
Subject: Re: Stopping greedy http clients!
Date: Tue, 24 Sep 2002 13:58:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020924115818.GA23587@dark.x.dtu.dk>
References: <F76qUlyunxtkVO4alvo00004b24@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <F76qUlyunxtkVO4alvo00004b24@hotmail.com>
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
To: J and T <j_and_t@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Mon, Sep 23, 2002 at 05:52:50PM -0700, J and T wrote:
> Is there a way to set a "speed limit" on tcp port 80 requests? Here's my 
> problem:
> 
> I have a very popular site with hundreds of pages updated dynamically every 
> 4 hours. Since high-speed internet access has become more popular, I have 
> found more and more visitors using robots to download all pages in one 
> quick multi-threaded connection. When you have a 1,000 people downloading 
> 100 pages all at once you end up with a problem. I can't just block them by 
> their IP because their IPs are dynamic.

I would take a look at iplimit from patch-o-matic, which "allows you to
restrict the number of parallel TCP connections to a server per client IP
address (or address block)". It will not block the access to your site, but
you can use it to limit the number of parallel downloads the clients can
use.

- David

