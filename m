From: Jason Opperisano <opie@817west.com>
Subject: Re: clampmss only partially working on 2.6 kernelmode pppoe?
Date: Sat, 12 Feb 2005 09:14:51 -0500
Message-ID: <1108217691.4462.37.camel@hubcap.ljm.dom>
References: <afcf620205021122413dd5dd6d@mail.gmail.com>
	<1108217321.4462.34.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108217321.4462.34.camel@hubcap.ljm.dom>
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

On Sat, 2005-02-12 at 09:08, Jason Opperisano wrote:
> tcpdump the external interface of the firewall for icmp type 3 code 4
> packets.

left this part out--the command for that would be:

  tcpdump -n -nn -p -i $EXTIF \
    'icmp[icmptype] = icmp-unreach and icmp[icmpcode] = 4'

-j

--
"Mr. Simpson, why are you here?
 Don't say revenge! Don't say revenge!
 Revenge?
 That's it! I'm outta here!"
	--The Simpsons


