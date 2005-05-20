From: Jason Opperisano <opie@817west.com>
Subject: Re: Iptables
Date: Fri, 20 May 2005 01:50:31 -0400
Message-ID: <20050520055031.GA10259@bender.817west.com>
References: <200505191945.22293.chadley@pinteq.co.za>
	<200505192213.27006.chadley@pinteq.co.za>
	<20050519214301.GA9129@bender.817west.com>
	<200505200738.57268.chadley@pinteq.co.za>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200505200738.57268.chadley@pinteq.co.za>
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

On Fri, May 20, 2005 at 07:38:57AM +0200, Chadley Wilson wrote:
> Would it be safe to set the OUTPUT default policy to ACCEPT?
> Every time I set it to DROP I get locked out, I suppose it has to do with the 
> fact that I have no rules for the OUTPUT chain.

well, if you're not going to add any rules to OUTPUT, then--yeah, leave
it at ACCEPT.  the OUTPUT policy as ACCEPT or DROP is really more of an
idealogical debate than anything else.  personally, i set mine to DROP
and only allow the traffic that is absolutely necessary to save me from
myself (i.e. don't tempt the fw admin to use the fw as a shell
account).  things i deem necessary to allow out:

  DNS
  NTP
  FTP/HTTP to update server IP's
  ICMP

this is all politic, i don't intend any decree by the statements made
here.

-j

--
"Lois: What's going on?
 Stewie: We're playing house.
 Lois: The boy is all tied up.
 Stewie: Roman Polanski's house."
        --Family Guy

