From: Tommy Sandquist <tomslists@sandquisttech.net>
Subject: Re: Ipt_random module questions
Date: Tue, 24 Oct 2006 09:53:51 -0700
Message-ID: <453E451F.1000900@sandquisttech.net>
References: <BAY103-F7AC52059E001ADA6EF7DBB20C0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F7AC52059E001ADA6EF7DBB20C0@phx.gbl>
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
To: netfilter@lists.netfilter.org

Thanks for the help! Do you know where I can find more information on 
this statistic match module in 2.6.18. I compiled IPTables 1.3.6 and 
installed it and am now able to add the module to my command line put 
there is very poor documentation on this modules use and capabilities. 
The syntax in iptables didn't help me a whole lot either. I tried using 
this module in random mode and am assuming from the error I was getting 
earlier that I must use a decimal for the probability but then I get 
errors about chain, target, or match not existing when I try to jump 
from that table to my packet marking table (for iproute2 to use). Any 
additional information or sites you can provide with information would 
be of great value.
Also, probably not for this discussion but does anyone know the proper 
way to rebuild the iptables 1.3.6 tarball in to a rpm file? I seriously 
doubt my issues are related to this but just thought I'd ask since the 
binary package is a little cleaner on the package based systems.
Thanks for all the help so far.

Tom

