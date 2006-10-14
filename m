From: "Jiann-Ming Su" <sujiannming@gmail.com>
Subject: Re: use of -m limit for Syn Flood protection
Date: Sat, 14 Oct 2006 10:17:24 -0400
Message-ID: <561dc3260610140717i45c75303weaa16bf327bd1f6d@mail.gmail.com>
References: <4530E332.4090306@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4530E332.4090306@eccotours.co.za>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On 10/14/06, Brent Clark <bclark@eccotours.co.za> wrote:
>
> # we allow 4 TCP connects per second, no more
> $IPT -N syn-flood
> $IPT -A syn-flood -m limit --limit 1/s --limit-burst 4 -j LOG --log-level info --log-prefix '#### Syn Flood ####'
> $IPT -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
> $IPT -A syn-flood -j DROP
>
>
> So my question is, have I maybe been to aggressive on the limit.
>

If you're trying to limit the SYNs to 4/sec, then the --limit should
be "--limit 4/s" along with the --limit-burst 4.  Though, 4 SYNs per
second is hardly a syn flood.  Also, you may want to specify the
destination port of the syn flood to give more grainular control.
-- 
Jiann-Ming Su
"I have to decide between two equally frightening options.
 If I wanted to do that, I'd vote." --Duckman
"The system's broke, Hank.  The election baby has peed in
the bath water.  You got to throw 'em both out."  --Dale Gribble

