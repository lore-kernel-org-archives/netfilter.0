From: Jason Opperisano <opie@817west.com>
Subject: Re: Redirect local OUTPUT attempt
Date: Fri, 28 Jan 2005 10:33:50 -0500
Message-ID: <20050128153350.GA14470@bender.817west.com>
References: <200501281250.08563.tommy@svearike.sytes.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200501281250.08563.tommy@svearike.sytes.net>
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

On Fri, Jan 28, 2005 at 12:50:08PM +0100, Tommy W wrote:
> I have a rather easy question , I hope !
> I'm trying to make a local connection attempt (specific port) to be redirected 
> to (local computer, different port)
> When configuring my gateway (another case and another computer)
> I can use
> iptables -t nat -I PREROUTING -s $IP -d $IP2 -p tcp -m tcp --dport 3434 -j 
> --to-destination $IP3:$PORT
> 
> that works perfectly, but it's not working now.. I guess it's because it's a 
> local connection (!?) as opposed to nat ,as it is in the gateway 
> configuration.
> What am I missing ?
> 
> I want 192.168.0.8:25 to be redirected to localhost:2525 basically.. (but only 
> locally)

to modify the destination of locally-generated packets--you need to
modify the OUTPUT chain of the NAT table.  also--your kernel needs to be
compiled with:

  CONFIG_IP_NF_NAT_LOCAL=y

and don't try and use 127.0.0.1--use:

  iptables -t nat -I OUTPUT -p tcp -d 192.168.0.8 --dport 25 \
    -j DNAT --to-destination 192.168.0.8:2525

-j

--
"Ah, beer, my one weakness. My achilles heel, if you will."
        --The Simpsons

