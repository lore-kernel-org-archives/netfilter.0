From: Philip Craig <philipc@snapgear.com>
Subject: Re: avoid conntrack
Date: Thu, 23 Feb 2006 10:21:19 +1000
Message-ID: <43FCFFFF.3080406@snapgear.com>
References: <200602201430.35996.clist@uah.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602201430.35996.clist@uah.es>
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
To: clist@uah.es
Cc: netfilter@lists.netfilter.org

On 02/20/2006 11:30 PM, Clist wrote:
> It is needed to do '-j NOTRACK'  in order to avoid conntracking for some 
> packets, or i can simply DROP packets on the raw table so they do not reach 
> other netfilter tables and so it is not conntracking for those packets..?

Just drop them.  The drop occurs immediately.


