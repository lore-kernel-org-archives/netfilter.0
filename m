From: Frank Gruellich <frank@der-frank.org>
Subject: Re: MAC addresses
Date: Sat, 11 Sep 2004 23:31:19 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040911213119.GT32422@der-frank.org>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200409111150.50506.bulliver@badcomputer.no-ip.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* Darren Kirby <bulliver@badcomputer.no-ip.com> 11. Sep 04:
> Hello netfilter list,

Hi,

> "6.4.3.2. MAC match
> 
> Are MAC addresses unique for all ethernet cards?

Beside some broken cards: yes.

> What I would like to know is could I use this rule to allow ssh
> connections ONLY from my notebook no matter what its current IP
> address happens to be, and drop all other connection requests?

If your notebook is in the same network: yes.  AFAIK you get the MAC
from the next hop.  BTW: MACs can be changed.  You still need a good
password.

HTH,
 regards, Frank.
-- 
Sigmentation fault

