From: Jason Opperisano <opie@817west.com>
Subject: Re: Inbound port mapping blocks outbound connection?
Date: Mon, 20 Dec 2004 08:22:14 -0500
Message-ID: <1103548934.3264.6.camel@hubcap.ljm.dom>
References: <4CE68372-5207-11D9-BA43-000A95CFE5AA@latencyzero.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4CE68372-5207-11D9-BA43-000A95CFE5AA@latencyzero.com>
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

On Sun, 2004-12-19 at 16:45, Rick Mann wrote:
> As I was writing this email about a problem connecting outbound, I 
> discovered what my problem was. Now I have a  new problem: Why would an 
> inbound port mapping prevent an outbound connection on one of those 
> ports, as described below? TIA!

well--you provide pretty much zero detail, so i'm going to have to put
my funny-looking kreskin hat on...

the powers-that-be are telling me that you (like many other people that
as this question), did not specify "-i $OUTSIDE_IF" in your PREROUTING
nat rule, and therefore packets that arrive inbound on the inside
interface match and disappear into the ether.

  iptables -t nat -A PREROUTING -i $OUTSIDE_IF -p tcp \
    -d $OUTSIDE_IP --dport 6969 -j DNAT --to-destination $INSIDE_HOST

-j

--
"I'm a well-wisher, in that I don't wish you any specific harm."
	--The Simpsons


