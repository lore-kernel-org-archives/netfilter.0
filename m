From: Jason Opperisano <opie@817west.com>
Subject: Re: http connection hangs when connecting to forwarded IP
Date: Sat, 14 May 2005 18:01:23 -0400
Message-ID: <20050514220123.GA25471@bender.817west.com>
References: <148eea710505131027505dc087@mail.gmail.com>
	<20050514065902.GA23344@bender.817west.com>
	<148eea710505141452252090ad@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <148eea710505141452252090ad@mail.gmail.com>
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

On Sat, May 14, 2005 at 02:52:44PM -0700, gerardo arnaez wrote:
> aah so while I was forawrdin all from internal nic to external, I was
> fowarding anything omfr extermal to inernter,
> 
> but I thought NAT did the forwarding as part of being NAt

NAT rewrites source and destination IP addresses (and ports) in packet
headers, that is all.

-j

--
"Narrator: Remember, nothing says "good job" like a firm, open-palm
 slap on the behind."
        --Family Guy

