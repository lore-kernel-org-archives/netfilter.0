From: netfilter@lists.netfilter.org
Subject: Re: FORWARD rules
Date: Thu, 11 Sep 2003 07:45:38 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030911021538.GA2104@linux.local>
References: <20030910175253.GA2752@linux.local> <20030910184430.GB24654@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030910184430.GB24654@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

On Wed, Sep 10, 2003 at 02:44:30PM -0400, Ramin Dousti wrote:
> On Wed, Sep 10, 2003 at 11:22:53PM +0530, Payal Rathod wrote:
> 
> Keep the default "DROP" policy and just open whatever is needed
> including the DNAT'ed packets coming in.

Please explain in a bit more detail relating to my data. Will keeping
the ESTABLISHED,RELATED rule at top and putting default DROP policy set
it right?

Thanks a lot and waiting for the reply.
With warm regards,
-Payal

> The place of the ESTABLISHED,RELATED rule should be at the top of
> your rule set.
> 
> Ramin
> 

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

