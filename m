From: Jason Opperisano <opie@817west.com>
Subject: Re: Can anyone tell me how to do this?
Date: Wed, 22 Sep 2004 10:29:43 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095863383.1891.18.camel@wolfpack.ljm.dom>
References: <20040922140922.36826.qmail@web51301.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040922140922.36826.qmail@web51301.mail.yahoo.com>
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

On Wed, 2004-09-22 at 10:09, Dominic Iadicicco wrote:
> Hello all,
> 
> Can anyone tell me how to do this so that I may ask
> some questions afterword's in hopes to learn a little
> more about iptables.

learning more about iptables is a nice goal to have.  sometimes i wish
it was just as glamorous for people to want to learn more about routing
and the OSI model, before becoming super l33t firewall gurus...but i
digress...

> This is what I would like to try. I think this would
> get me to the next level.
> 
> My devil-Box is at 172.16.12.130 and I want all ssh
> request to this .130 address, to go to address
> 172.16.12.212.   How do I do this?  All machines are
> on the 172.16.12.x subnet for right now.

  iptables -t nat -A PREROUTING -p tcp --dport 22 \
    -d 172.16.12.130 -j DNAT --to-destination 172.16.12.212

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

  iptables -A FORWARD -p tcp -d 172.16.12.212 -j ACCEPT

  iptables -t nat -A POSTROUTING -p tcp --dport 22 \
    -d 172.16.12.212 -j SNAT --to-source 172.16.12.130

  sysctl -w net.ipv4.ip_forward=1

-j

-- 
Jason Opperisano <opie@817west.com>


