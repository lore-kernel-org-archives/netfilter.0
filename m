From: Jason Opperisano <opie@817west.com>
Subject: Re: Re: iptables and TOS 15
Date: Mon, 15 Nov 2004 08:53:53 -0500
Message-ID: <1100526832.6982.6.camel@hubcap.ljm.dom>
References: <41996f3e.2305.0@australia.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41996f3e.2305.0@australia.edu>
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

On Mon, 2004-11-15 at 06:35, tepesu@australia.edu wrote:
>     first i use imq patch for kernel 2.6.9 and htb for some traffic
> management and i want to redirect this kind of trafic to imq1 or imq0 and
> then to came with some htb rules. just this ...
> 
> #iptables -t mangle -A PREROUTING -m tos --tos 0x15 -j IMQ --todev 0
> iptables v1.2.11: Bad TOS value `0x15'
> Try `iptables -h' or 'iptables --help' for more information.
> 
> #iptables -t mangle -A PREROUTING -m tos --tos 15 -j IMQ --todev 0
> iptables v1.2.11: Bad TOS value `15'
> Try `iptables -h' or 'iptables --help' for more information.

the problem is that "15" is not a valid TOS value as far as iptables is
concerned.  your choices are:

  Minimize-Delay 16 (0x10)
  Maximize-Throughput 8 (0x08)
  Maximize-Reliability 4 (0x04)
  Minimize-Cost 2 (0x02)
  Normal-Service 0 (0x00)

a previous poster said that your ISP's value of 15 is most likely
equivalent to 0.

-j

--
"I am so smart, I am so smart, s-m-r-t....I mean s-m-A-r-t."
	--The Simpsons


