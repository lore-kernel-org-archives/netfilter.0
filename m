From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Rule Set Size vs Performance Follow-up
Date: Fri, 30 Jul 2004 00:46:31 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410929E7.5040708@linuxmail.org>
References: <1091113691.9879.9.camel@dchws.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1091113691.9879.9.camel@dchws.tqmcube.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: NetFilter List <netfilter@lists.netfilter.org>

David Cary Hart wrote:
> The issue was a large number of dpt 80 rules that are added by a script
> from Snort exploits.
> 
> The suggested solution was to move these to a new chain so that only
> packets destined for httpd would have to traverse several hundred
> (hopefully temporary) rules.
> 
> Not only does this make logical sense but I notice a definite
> improvement in DNS (which is the most apparent performance issue).

You'd probably also want to make sure you don't use any connection 
tracking rules and therefore not load the conntrack module. In my case, 
dns queries took seconds (as opposed to milliseconds) to get an answer 
back from the dnscache.

