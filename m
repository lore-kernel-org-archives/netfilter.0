From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Cross compiling, etc
Date: Fri, 25 Jun 2004 11:28:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406251128.40113.Antony@Soft-Solutions.co.uk>
References: <40DBF710.1020200@4Dllc.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40DBF710.1020200@4Dllc.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Friday 25 June 2004 10:57 am, Steve Comfort wrote:

> Hi gents,
>
> I've sorted out the problems with my cross compilation. I hadn't noticed
> that the linker was using ar instead of arm-linux-ar. So, no more
> truncations and iptables with my semi-trivial little script appears
> hunky-dory. (Just tested on ping limits so far).
>
> Next question is whether you gurus can recommend any good test app that
> I can use for checking my rules and seeing whether there any holes?

nmap?

http://www.insecure.org

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


