From: Philip Craig <philipc@snapgear.com>
Subject: Re: packet filter rules updating
Date: Thu, 01 Jun 2006 15:48:02 +1000
Message-ID: <447E7F92.7040606@snapgear.com>
References: <6770617.1149090967505.JavaMail.root@ps12>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6770617.1149090967505.JavaMail.root@ps12>
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
To: "moniacheli@tiscali.it" <moniacheli@tiscali.it>
Cc: netfilter@lists.netfilter.org

On 06/01/2006 01:56 AM, moniacheli@tiscali.it wrote:
> Is there some iptables options that I have to give to force the rules 
> updating?

No, the problem is that NAT rules are only used for the first packet
in a connection, and the conntrack table entry hasn't timed out.

You can delete the entry using the conntrack tool (requires a recent
kernel and you may need to get the conntrack tool source from svn.)

