From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Question about iptables and bridging
Date: Fri, 15 Dec 2006 20:05:53 -0600
Message-ID: <45835481.4090006@riverviewtech.net>
References: <C874DBE9D30B584587F8CD0EC34DA8BE0377F879@EX00.idirect.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C874DBE9D30B584587F8CD0EC34DA8BE0377F879@EX00.idirect.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Snyder, Brian wrote:
> Is there something I am missing here? I would assume there is a way to
> do this (tell direction over bridge) but I don't know what it is.... so
> any help or pointers would be greatly appreciated.

Yes.  Take a look in the mailing list archive for my post "A word about 
bridging to the wise..." 
(http://lists.netfilter.org/pipermail/netfilter/2006-December/067540.html). 
  It depends if you have your kernel configured to allow IPTables, which 
operates on OSI Layer 3 to be able to see OSI Layer 2 traffic, which is 
where bridging takes place.



Grant. . . .

