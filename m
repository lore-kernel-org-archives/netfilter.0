From: Moritz Gartenmeister <moritz.gartenmeister@access.unizh.ch>
Subject: Re: dummy target?
Date: Fri, 18 Mar 2005 15:52:25 +0100
Message-ID: <423AEB29.1070209@access.unizh.ch>
References: <423ADBAC.4020406@uplink-verein.ch>
	<20050318144126.GA2604@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050318144126.GA2604@zion.homelinux.com>
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

Hi all

Thanks for your (Sven and Steven) help!

regards
moritz

Sven Schuster wrote:
> Hi Moritz,
> 
> On Fri, Mar 18, 2005 at 02:46:20PM +0100, Moritz Gartenmeister told us:
> 
>>hi all
>>
>>i want to use the counters for statistic stuff. i already have a working 
>>example. but i want to get numbers for pakets, which i acutally have no 
>>rule for (e.g. all incoming traffic).
>>is there a dummy target? like:
>>$IPTABLES -t mangle -A PREROUTING -m physdev --physdev-in $INET_IF -j DUMMY
>>
>>dummy target: do nothing, do not terminate, do just increment counters.
> 
> 
> just don't provide the '-j TARGET' on the commandline, then you'll
> have a rule (with its counters) which "does" nothing...
> 
> 
> HTH
> 
> Sven
> 
> 
>>cheers
>>moritz
>>
>>
> 
> 

