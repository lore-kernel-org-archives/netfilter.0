From: Jan Du Caju <Jan.DuCaju@kuleuven.net>
Subject: Re: how many rules can be added?
Date: Fri, 17 Sep 2004 11:33:20 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040917093320.GA8651@kuleuven.net>
References: <1314.81.10.7.66.1095343827.squirrel@81.10.7.66>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1314.81.10.7.66.1095343827.squirrel@81.10.7.66>
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
To: Alaadin <alaadin@alaadin.org>
Cc: netfilter@lists.netfilter.org

On Thu, Sep 16, 2004 at 05:10:27PM +0300, Alaadin wrote:
> Hello,
> 
> how many ip tables rules can i add ?
> i added already 40
> if i added untill 100 or 500 rule
> would this make problems ?
> would this make the system lag ?
> would this make the system hang
> how many ip tables rules can i add ? or its unlimited?

If you have many rules and/or high bandwidth you should consider hipac
(High Performance Packet Classification) It uses the netfilter hooks 
and ... checkout yourself at http://www.hipac.org
There is also a performance comparison with iptables ...
It exists for a 2.4 kernel. A 2.6 version is promissed for october 2004.
As we (our university http://www.kuleuven.be/english) have many rules 
we use it and with success

Hope this helps,
Jan.
--------------------------------------------------- KULeuvenNet ----
Jan.DuCaju@kuleuven.net		http://www.KULeuven.Net/e_index.html
K.U.Leuven BELGIUM		      http://www.kuleuven.be/english
--------------------------------------------------------------------

