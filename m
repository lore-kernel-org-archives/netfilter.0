From: Jason Opperisano <opie@817west.com>
Subject: Re: ipt_TCMSS.c -- A slight problem i'm having
Date: Mon, 1 Nov 2004 14:02:59 -0500
Message-ID: <20041101190259.GA18883@bender.817west.com>
References: <424BCB4EA242A1429A8AF0548E8CFF0E123959@apexexchange.ApexSoftware.Com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <424BCB4EA242A1429A8AF0548E8CFF0E123959@apexexchange.ApexSoftware.Com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Nov 01, 2004 at 11:50:37AM -0500, Scott Knake wrote:
<snip>
> That is a little excerpt from ipt_TCMSS.c. The problem is that somebody
> DoS'd me with syn Packets that contained data len(header) <!=
> len(packet). I have a little ServGate SG100 router that handles my T1
> connection. The router physically seized for the 5 minutes or so while
> he packeted because of the amount of logging I'm guessing. How can I
> block this with just an iptables ruleset? I'm trying not to limit the
> incoming number of syn packets and I cant recompile netfilter since it
> is running on a flavored kernel custom for the router. How am I going to
> prevent this in the future?

  iptables -t mangle -I PREROUTING -i $external_if -p tcp --syn \
    -m length ! --length 60 -j DROP

-j

--
"I bet Einstein turned himself all sorts of colors before he invented
the light bulb."
        --The Simpsons

