From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP server behind NAT
Date: Fri, 29 Apr 2005 01:32:57 -0400
Message-ID: <20050429053257.GA32428@bender.817west.com>
References: <4271C141.5050008@logix.cz>
	<20050429052310.GA32353@bender.817west.com>
	<4271C6B4.8070808@logix.cz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4271C6B4.8070808@logix.cz>
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

On Fri, Apr 29, 2005 at 05:31:32PM +1200, Michal Ludvig wrote:
> Jason Opperisano wrote:
> > On Fri, Apr 29, 2005 at 05:08:17PM +1200, Michal Ludvig wrote:
> > 
> >>3) ip_conntrack_ftp is loaded
> > 
> > maybe you're just leaving this out, but is ip_nat_ftp loaded as well?
> 
> Ehm, no. Shame on me. Now it works, thanks a lot!

/me loves the low hanging fruit.

-j

--
"Quagmire: Hello, 911? It's Quagmire. Yeah, it's caught in the
 window this time."
        --Family Guy

