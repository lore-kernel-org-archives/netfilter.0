From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: matching the first packet of a connection
Date: Wed, 04 May 2005 14:37:49 -0500
Message-ID: <4279248D.9090903@riverviewtech.net>
References: <1115220105.26791.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115220105.26791.25.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> I'm trying to match the first packet of a connection : for a TCP
> connection I want to match the first SYN packet received by the firewall
> and ignore the possible reemission, in fact I want to accept them.
> 
> Is this possible ?
> 
> I've try to use the conntrack module but I was not successful.

Question:  Are you wanting to just silently DROP the first connection attempt and force people to try to reconnect via retransmission of the SYN packet?  If that is the case you will want to do something out side of the connection tracking match extensions that exist because (as far as I know and understand) they all deal within a given connection.  You are really wanting to break / prevent one connection attempt and then allow the subsequent ones.  Or at least that's how I understand what you have written.  I have a feeling that you will be playing with the recent or set match extensions where you add a connection attempt to a recent list or set list while dropping the first connection attempt packet.  Subsequent connection attempt packets can then be matched against the recent list or set list to see if there has been a connection attempt dropped and if so accept the present connection
  attempt.

If you give me more to work with I might be able to come up with a rule set to help you out.



Grant. . . .

