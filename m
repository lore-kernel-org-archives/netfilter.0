From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: RE: new iptables user - default options
Date: Tue, 28 Oct 2003 08:13:39 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310280811380.22631-100000@localhost.localdomain>
References: <FDB52A0429DFD31196FB0008C7D972D50EA578CB@OST_EXCH_USR5>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA578CB@OST_EXCH_USR5>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Knight, Steve" <Steve.Knight@bskyb.com>
Cc: netfilter@lists.netfilter.org

On Tue, 28 Oct 2003, Knight, Steve wrote:

> Thanks Robert - I appreciate your response.
> 
> I have to say I'd agree - it seems to be more of a belt and braces approach
> to use your suggestion, and more in the spirit of what we were told in
> checkpoint kindergarten ["deny everything unless explicitly asked" - also
> sounds a bit like being married].
> 
> Are the rules in each chain processed top down?

yup, which is why many folks recommend setting up some user-defined
chains to break the processing down into more efficient and bite-sized
pieces (unless you have a very small set of rules, then it's not
really worth it).

so far, the more comprehensive treatment of iptables i've seen is
ziegler's new riders book, particularly the lengthy examples of 
rulesets he supplies.

rday


