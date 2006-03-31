From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: Gateway cluster using iptables and CLUSTERIP
Date: Fri, 31 Mar 2006 11:54:41 +0200
Message-ID: <200603311154.41560@nienna>
References: <A78C6C481BFAE949BC5990E1EEB2FE125715@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A78C6C481BFAE949BC5990E1EEB2FE125715@q.LeBlancNet.us>
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


  Hi,

On Thursday 30 March 2006 18.31, Robert LeBlanc wrote:
> iptables -A INPUT -I eth1 -d 10.0.0.1 -j CLUSTERIP -new -hashmode
> sourceip -clustermac 01:83:91:A7:0D:33 -total-nodes 1 -local-nodes 1
>
> I have entered only one node in the cluster so that I would not have to
> bring up both nodes during the testing or remember to add the other node
> to /proc/net/ipt_CLUSTERIP/10.0.0.1.

  Strange. Please note that apparently there are very few CLUSTERIP users 
out there, so this might also be a bug. Does setting total-nodes to 2 help?

-- 
 Regards,
  Krisztian Kovacs

