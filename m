From: Jason Opperisano <opie@817west.com>
Subject: Re: how to match connection tracker's flows?
Date: Wed, 3 Nov 2004 14:02:21 -0500
Message-ID: <20041103190221.GA27201@bender.817west.com>
References: <20041103181718.GA16850@oasis.frogfoot.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041103181718.GA16850@oasis.frogfoot.net>
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

On Wed, Nov 03, 2004 at 08:17:18PM +0200, Abraham van der Merwe wrote:
> Hi!
> 
> If I add
> 
> # rules to track ftp
> iptables -t mangle -A POSTROUTING -p tcp -j CONNMARK --restore-mark
> iptables -t mangle -A POSTROUTING -p tcp -m mark ! --mark 0 -j RETURN
> iptables -t mangle -A POSTROUTING -p tcp --dport 21 -j MARK --set-mark 2
> iptables -t mangle -A POSTROUTING -j CONNMARK --save-mark
> 
> # a rule to see how much ftp traffic is matched
> iptables -t mangle -A POSTROUTING -m mark --mark 2
> 
> Now if I ftp some data I can see that all of the traffic is not matched by
> looking at the byte counter of the rule above.
> 
> What am I doing wrong? I am pretty sure the ftp-data connection is not being
> tracked, but surely the conntrack_ftp module should do all the hard work for
> me?

try using helper to match FTP traffic:

  iptables -t mangle -A POSTROUTING -m helper --helper ftp

-j

--
"Dear Mr. President, there are too many states nowadays, please
 eliminate three. I am not a crackpot."
        --The Simpsons

