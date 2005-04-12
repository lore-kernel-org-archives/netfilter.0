From: Jason Opperisano <opie@817west.com>
Subject: Re: stop uptime and name + version querying
Date: Tue, 12 Apr 2005 08:48:18 -0400
Message-ID: <20050412124818.GA26130@bender.817west.com>
References: <425B9FCE.7050105@eccotours.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <425B9FCE.7050105@eccotours.dyndns.org>
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

On Tue, Apr 12, 2005 at 12:15:42PM +0200, Brent Clark wrote:
> Hi
> 
> I would like to know if iptables is the correct tool to stop people from 
> retriving data, such as what "NAME" of services I run (e.g vsFTPd) and 
> other things like (Uptime 90.302 days (since Wed Jan 12 03:08:12 2005)) etc
> 
> And if so, how would you go about stoping the querys etc.
> 
> Does anyone know what service nmap talks to, to determine how long the 
> box has been up and running for.
> Just something I was thinking, kind regards

just a stab in the dark, but what does:

  sysctl net.ipv4.tcp_timestamps

have to say?

-j

--
"Janet: Hi. Cookie?
 Stewie: Well, it's Stewie, but... you can call me "cookie" if you like.
 Yes, I also answer to "Artemis," "Agent Buckwald" and "Snake." Yes,
 I rather like "Snake." Snake."
        --Family Guy

