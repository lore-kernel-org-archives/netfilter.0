From: "Ric Messier" <kilroy@WasHere.COM>
Subject: RE: syn DDoS attack solution
Date: Thu, 31 May 2007 14:08:01 -0600
Message-ID: <015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>
References: <465EF582.4070904@bgs.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <465EF582.4070904@bgs.hu>
Content-Language: en-us
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
To: 'Bgs' <bgs@bgs.hu>, netfilter@lists.netfilter.org


Bgs writes:
> 
>   We recently got under a low traffic botnet DDoS attack. All attacker
> nodes opened a single tcp session (just SYN part) and then did nothing.
> This rules out rate limiting solutions and syncookie doesn't help
> either. (Thousands of attacking nodes).
> 

This is simply a SYN flood attack. It may or may not be a botnet (though
saying botnet makes it sound sexier :-) ). A decent SYN flood attack tool
would randomize the source address anyway. 

You should try reading the following as a starting point:

http://www.securityfocus.com/infocus/1729

Your second suggestion has been implemented in the TCP/IP stack forever. The
article above gives guidance on how to tune it in a Linux implementation.

Ric


