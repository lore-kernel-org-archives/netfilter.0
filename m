From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables and TOS 15
Date: Fri, 12 Nov 2004 10:23:13 -0500
Message-ID: <1100272993.3377.9.camel@hubcap.ljm.dom>
References: <419551d1.7be0.0@australia.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419551d1.7be0.0@australia.edu>
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

On Fri, 2004-11-12 at 03:40, tepesu@australia.edu wrote:
>     hi,
> 
>  my ISP mark packets from some internet traffic with TOS 15 and i musst
> filter this traffic. how and where i must odified iptables to can do some
> filtering using this marks, TOS 15.

as far as i'm aware, "15" is not a valid TOS value.  as a result of the
way the TOS bits are set in the packet header, there are only 5 possible
TOS settings (from RFC 1349):

  1000   --   minimize delay
  0100   --   maximize throughput
  0010   --   maximize reliability
  0001   --   minimize monetary cost
  0000   --   normal service

some products configure these simply as values 1 - 5 (i.e. cisco boxes).
iptables allows you to use two different notations, decimal and hex:

  Minimize-Delay 16 (0x10)
  Maximize-Throughput 8 (0x08)
  Maximize-Reliability 4 (0x04)
  Minimize-Cost 2 (0x02)
  Normal-Service 0 (0x00)

so for the "minimize delay" TOS value, you could write your rule as:

  iptables -t mangle -A PREROUTING -m tos --tos 16 [ ... ]

or

  iptables -t mangle -A PREROUTING -m tos --tos 0x10 [ ... ]

but before you do anything--talk with your ISP and figure out what TOS
setting they are actually using (i.e. "15" is not the right answer).

-j

--
"I hope I didn't brain my damage."
	--The Simpsons


