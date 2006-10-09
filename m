From: aoliva <aoliva@it.uc3m.es>
Subject: How to find the chain which calls the match
Date: Mon, 09 Oct 2006 17:20:30 +0200
Message-ID: <452A68BE.8030605@it.uc3m.es>
References: <1160405480.28977.201.camel@mfarooq-1.tango-networks.com>
	<452A6714.5030709@it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <452A6714.5030709@it.uc3m.es>
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
Cc: netfilter@lists.netfilter.org

Sorry if you receives multiple copies,

Hi all, I am writing a match for iptables and I would like it to have a 
different behaviour when it is called from different chains (e.g. 
different behaviour when called from INPUT than OUTPUT) anyone knows how 
to check in the match which is the chain that is calling it?

Thanks in advance.

Antonio de la Oliva




