From: Samuel Jean <sj-netfilter@cookinglinux.org>
Subject: Re: Performance isues related to a large number of iptables rules
Date: Thu, 13 Jan 2005 20:32:46 -0500
Message-ID: <41E7213E.9080202@cookinglinux.org>
References: <41E6FA0E.2060707@intellitree.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E6FA0E.2060707@intellitree.com>
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
To: henry <info@intellitree.com>
Cc: netfilter@lists.netfilter.org

henry wrote:
> Does anyone know what the real numbers are, and 
> what numbers are feasible and what numbers aren't?
> 

Not me. But if blocking large amount of subnets and host addresses is
your issue here. Only one rule is sufficient. See ipset 2.0

http://people.netfilter.org/kadlec/ipset/

Sorry if am out of topic.

Samuel

