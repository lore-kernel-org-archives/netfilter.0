From: KOVACS Krisztian <piglet@sch.bme.hu>
Subject: Re: CONNMARK Target Problem
Date: Sat, 27 Mar 2004 10:50:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040327095013.GA25127@sch.bme.hu>
References: <000501c4127a$f6338c60$0200a8c0@basti79>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000501c4127a$f6338c60$0200a8c0@basti79>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian <netfilter@basti79.de>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


  Hi,

On Thu, Mar 25, 2004 at 04:07:56PM +0100, Sebastian wrote:
> Dmesg say's: 
> CONNMARK: targinfosize 8 != 12
> 
> Kernel is 2.4.25 with pom snapshot 20040319.
> Iptables is debian package 1.2.9-6:
> # iptables --version
> iptables v1.2.9
> 
> Any suggestions what i can do to get the CONNMARK target working?

  This is because iptables 1.2.9 is incompatible with the newest CONNMARK
kernel code. You should try the iptables CVS (or at least get the
CONNMARK-related files from the CVS). This was needed because there were
useful feature add-ons to CONNMARK. Now you can use a bitmask when
setting/copying the connmark value.

-- 
 KOVACS Krisztian


