From: Jason Opperisano <opie@817west.com>
Subject: Re: FW: Setting up 1:1 NAT for DMZ (Repost w/o HTML)
Date: Wed, 5 Jan 2005 17:13:08 -0500
Message-ID: <20050105221308.GA25690@bender.817west.com>
References: <FC8AF9F27A8C6E4DAB2072FC162C421CFC2E5B@HILLEX.HILLNET.ad.hsd.k12.or.us>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <FC8AF9F27A8C6E4DAB2072FC162C421CFC2E5B@HILLEX.HILLNET.ad.hsd.k12.or.us>
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

On Wed, Jan 05, 2005 at 02:02:06PM -0800, Spidal, Glen wrote:
> >> Jason,  
> >> Thanks so much.  I'm new to bash scripting.  In the statement below,
> >>for i in `seq 11 23`;
> >>which digits are the starting point and which ones are the number of
> loops?

the `seq 11 23` generates a list starting at 11, stopping at 23.  "seq"
is an external linux command.

> >>Also, how do I set the subnet on the public Ips added using the ip add
> command 
> >>in the script?  Mine happens to be 255.255.255.192.

the "ip addr add 1.2.3.${i} dev $EXT_IF" statements will add the IP
addresses with a /32 mask--which is fine for the purposes of an alias
for NAT.  it also keeps the firewall from ever using one of the alias IP's
as a source address when communicating on the locally-attached network.
only your primary IP on $EXT_IF needs to have the /27 mask.

-j

--
"Here we have an ordinary square.
 Whoa! Slow down egghead!"
        --The Simpsons

