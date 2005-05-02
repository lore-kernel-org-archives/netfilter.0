From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: rules for skype
Date: Mon, 02 May 2005 11:48:54 -0500
Message-ID: <427659F6.30703@riverviewtech.net>
References: <20050502150901.DAEF39E9F4@dd6816.kasserver.com>	<42764919.60507@lopsch.com>
	<42764E36.7080300@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42764E36.7080300@riverviewtech.net>
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

> What about for example online browsing the Netfilter Mailinglist? It 
> uses https too and the meg of data could fast be reached.

Hmm.  Maybe filtering would have to be done based on duration.  Hmm, the more that I look at it the more that I think that you would have to limit the number of times that the rule did natch.  You would probably want to set a limit (limit, dstlimit, connlimit, hashlimit, etc) on on the number times (per some duration) that a person is allowed to have an HTTPS connection that is larger than 1 MB.



Grant. . . .

