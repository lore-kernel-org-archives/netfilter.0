From: Kiran Kumar Immidi <immidi@spymac.com>
Subject: Re: connection tracking without iptables?
Date: Fri, 15 Oct 2004 10:46:21 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410151046.21604.immidi@spymac.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E37C@alderaan.smgtec.com>
	<561dc326041014113163a6a9eb@mail.gmail.com>
	<20041014185758.GA4057@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041014185758.GA4057@bender.817west.com>
Content-Disposition: inline
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

On Friday 15 October 2004 00:27, Jason Opperisano wrote:

> i'm not aware of any way that reading /proc/net/ip_conntrack would
> prevent the system from creating new conntrack entries, but there's lots
> of things that i'm not aware of...

  AFAIR, the proc interface for the ip conntrack contents was considered 
broken and was moved to use the seq_file interface.  The patch to this effect 
went into 2.6.9-rc1. 

  http://lists.netfilter.org/pipermail/netfilter-devel/2004-July/016149.html

  I am not sure, but may be this patch could help you.

-- 
Regards,
Kiran Kumar Immidi


