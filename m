From: Gavin Henry <ghenry@suretecsystems.com>
Subject: Re: Script review please
Date: Tue, 14 Jun 2005 23:22:30 +0100
Message-ID: <200506142322.30630.ghenry@suretecsystems.com>
References: <20050614213233.91352.qmail@web54301.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050614213233.91352.qmail@web54301.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 14 Jun 2005 22:32, Scott wrote:
> I would add the following at the end (for safety's
> sake):
>
> $t --policy INPUT DROP
> $t --policy FORWARD DROP
> $t --policy OUTPUT ACCEPT
>
> -Scott

Thanks Scott.

What would be the best logging options to add to these and what is the best 
way to pick these up via syslog and chuck them into a separate file?

Thanks again,

Gavin

-- 
Kind Regards,

Gavin Henry.

Open Source. Open Solutions(tm).

http://www.suretecsystems.com/

