From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: Logging only the first 20 packets of a new connection
Date: Fri, 07 Jan 2005 12:46:22 -0700
Message-ID: <41DEE70E.8050807@utilitran.com>
References: <200501071829.j07ITSXH082515@jkcpub.iserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501071829.j07ITSXH082515@jkcpub.iserver.net>
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
To: Deepak Seshadri <dseshadri@broadbandmaritime.com>, netfilter@lists.netfilter.org

Hello,

	I think you could use mark and limit to come up with something ... but 
why on the first 20 packets ??

I have a rule that logs all SYN packets coming from a certain end point 
that SNAT's ... so we can later track with PC made the connection if needed.

Michael.



Deepak Seshadri wrote:
> Hello everybody,
> 
> Could someone suggest how would I log only the first 15 or 20 packets of any
> new connection?
> 
> Thanks in advance,
> 
> Deepak Seshadri
> 
> 
> 

-- 
Michael Gale
Lan Administrator
Utilitran Corp.

I make better friends with those who think for them selves

