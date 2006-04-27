From: michael@grife.net
Subject: Re: Login load balancing
Date: Thu, 27 Apr 2006 20:31:45 +1000 (EST)
Message-ID: <Pine.LNX.4.64.0604272026100.18949@amp.grife.net>
References: <444FAEFF.1040100@uvic.ca> <444FE835.2010007@gmx.net>
	<444FEC93.6070101@uvic.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <444FEC93.6070101@uvic.ca>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, 26 Apr 2006, Drew Leske wrote:

> Unfortunately we don't control the DNS--another group here has
> responsibility for that.  I'll chat with them and see if they have provision
> for remote updates.

There is another possibility you could consider. Instead of having them 
enable remote updates, get them to delegate a new zone for you.

All you would need to do then is setup some bind servers. You would then 
have direct access to update the A records.

--
Michael
michael@grife.net

