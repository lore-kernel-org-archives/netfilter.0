From: Jason Opperisano <opie@817west.com>
Subject: Re: droping too many ports
Date: Thu, 23 Sep 2004 17:01:06 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095973266.8527.6.camel@wolfpack.ljm.dom>
References: <a0f69e504092313454a9090b3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e504092313454a9090b3@mail.gmail.com>
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

On Thu, 2004-09-23 at 16:45, Askar wrote:
> hi all
> 
> what if I do (and im doing this from last two hours ;))
> 
> iptables -A FORWARD -p tcp --dport 31000:65500 -j DROP
> iptables -A FORWARD -p udp --dport 31000:65500 -j DROP
> 

uh...depending on your other rules--you could be dropping tons o'
legitimate traffic; i.e, inbound replies to your outbound requests.

how's about showing us:

  iptables -vnxL FORWARD

a better approach (in general) is to set the policy of FORWARD to DROP,
and only allow through that which you need to allow through.  it keeps
you from getting tempted to do what you just did, as well.

-j

-- 
Jason Opperisano <opie@817west.com>


