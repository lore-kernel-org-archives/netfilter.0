From: Jason Opperisano <opie@817west.com>
Subject: Re: redirect to 127.0.0.1 [corrected]
Date: Tue, 17 May 2005 15:15:20 -0400
Message-ID: <20050517191520.GA2038@bender.817west.com>
References: <BAY16-F138F014D31905BBA75CC46BA160@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY16-F138F014D31905BBA75CC46BA160@phx.gbl>
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

On Tue, May 17, 2005 at 05:04:30PM +0000, bagwan ali wrote:
> Hi All,
> 
> I have a problem redirecting traffic from $SERVER:11000 to 127.0.0.1:10001. 
> The situation is that I need more than one serverprocess listening to ONE 
> specific port in this case port 11000. Ofcourse this is  not possible, but 
> there is only ONE client connection at a time to ONE serverprocess. So 
> instead that the process is listening on $SERVER:11000, it is listening on 
> 127.0.0.1:10001 and the second serverprocess is listening on 
> 127.0.0.1:10002 and so on. So I can depending on the source IP address 
> redirect traffic from $SERVER:11000 to 127.0.0.1:$FREEPORT. Let me give an 
> example in pseudo firewall rules:

is it a new quarter already?

1) REDIRECT does not rewrite the dst IP to be 127.0.0.1, it rewrites the 
   dst IP to be IP of the inbound interface.  this is *not*
   configurable.
   
2) DNAT allows you to configure the IP address that the dst IP will be 
   re-written to; however, a DNAT --to 127.0.0.1 will *not* work, as the 
   packet will be dropped by the linux kernel's martian routing code 
   (packets destined for 127/8 must not be received "on the wire.")
   
3) since it's been a quarter or so since someone's asked this, i just 
   had an idea--this comes with no guarantee or warranty express nor
   implied:

   # change the input interface on packets to be DNAT-ed to 127.0.0.1
   # to be the loopback interface
   iptables -t mangle -A PREROUTING -p tcp -s $CLIENT_ONE \ 
     -d $SERVER --dport 11000 -j ROUTE --iif lo --continue
     
   # DNAT packets to 127.0.0.1
   iptables -t nat -A PREROUTING -p tcp -s $CLIENT_ONE \ 
     -d $SERVER --dport 11000 -j DNAT --to 127.0.0.1:11001

i don't even know if the above rules will apply, much less work.

-j

--
"Lois: Peter, you're drunk again.
 Peter: No, I'm just exhausted because I've been up all night drinking."
        --Family Guy

