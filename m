From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: FORWARD rules
Date: Wed, 10 Sep 2003 14:44:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030910184430.GB24654@cannon.eng.us.uu.net>
References: <20030910175253.GA2752@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030910175253.GA2752@linux.local>
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
To: netfilter@lists.netfilter.org

On Wed, Sep 10, 2003 at 11:22:53PM +0530, Payal Rathod wrote:

> Hi,
> I had kept the default policy of FORWARD as drop.
> Now, I wanted to see an internal machine from internet. So, I used
> DNAT as,
> 
> iptables -A PREROUTING -t nat -d <ext ip> -j DNAT --to <int ip>
> It didn't work. When I set the default FORWARD policy to ACCEPT it
> worked.
> 
> What is a better approach? I want to have a default DROP in FORWARD
> chain. My FORWARD chain looked like this,

Keep the default "DROP" policy and just open whatever is needed
including the DNAT'ed packets coming in.

The place of the ESTABLISHED,RELATED rule should be at the top of
your rule set.

Ramin

