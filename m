From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Paching...
Date: Thu, 20 May 2004 10:21:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40ACE904.4030905@shorewall.net>
References: <7C9884991ADAE0479C14F10C858BCDF5679359@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5679359@alderaan.smgtec.com>
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
To: Sez <sezmillenium@yahoo.es>
Cc: netfilter@lists.netfilter.org

Daniel Chemko wrote:

> 
> When the kernel is installed, there should be a module called
> ip_conntrack_pptp,  ip_conntrack_gre, ip_nat_pptp, and ip_nat_gre. 

The gre modules are actually named ip_conntrack_proto_gre and 
ip_nat_proto_gre.

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net


