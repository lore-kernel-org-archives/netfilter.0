From: Jason Opperisano <opie@817west.com>
Subject: RE: iptables source net and layer7
Date: Sun, 24 Oct 2004 21:42:34 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098668553.9024.40.camel@hubcap.ljm.dom>
References: <200410241528.i9OFSXnn021412@post.webmailer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200410241528.i9OFSXnn021412@post.webmailer.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sun, 2004-10-24 at 11:28, Marco wrote:
> Hello!
> 
> Thanks for your answer. I tried this but do not work.
> I used tcpdump to verify the packets and saw the problem.

[ snip ]

you're trying to change horses mid-stream.  a normal TCP session looks
like:

CLIENT		SERVER
---------------------------
1) SYN ->
2) 		<- SYN-ACK
3) ACK ->
4) GET / ->

my questions for you:

at which point in this conversation does your firewall make a routing
decision for the session flow, choose a SNAT, and enter the connection
into the conntrack table?  (my answer is step 1)

at which point in this conversation can it be determined what layer 7
protocol is being spoken over this port?  (my answer is step 4)

you are applying a SNAT to a connection at packet 1, and then trying to
change the source IP of the connection at packet 4.

-j

-- 
Jason Opperisano <opie@817west.com>


