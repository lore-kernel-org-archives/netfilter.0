From: Jason Opperisano <opie@817west.com>
Subject: Re: Unable to add rule on Chain with 28 characters.
Date: Fri, 8 Jul 2005 15:50:49 -0400
Message-ID: <20050708195049.GA7221@bender.817west.com>
References: <42CECD47.5050003@interage.com.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42CECD47.5050003@interage.com.br>
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

On Fri, Jul 08, 2005 at 04:00:23PM -0300, Rafael Dreher wrote:
> Hi,
> 
> I'm trying do add a rule on a user-defined chain, on the NAT table, with 28 
> characters.

my guess is you're leaving out the '-t nat' as custom chains only exist
in the table they're created in:

  # iptables -t nat -N GqKOJUpUAOboDEbYcaVUCDqprFy
  # iptables -t nat -A GqKOJUpUAOboDEbYcaVUCDqprFy -j ACCEPT
  # iptables -t nat -A PREROUTING -j GqKOJUpUAOboDEbYcaVUCDqprFy
  # iptables -t nat -vnxL
  Chain GqKOJUpUAOboDEbYcaVUCDqprFy (1 references)
      pkts      bytes target     prot opt in     out     source
  destination
         1       78 ACCEPT     all  --  *      *       0.0.0.0/0
  0.0.0.0/0

  Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
      pkts      bytes target     prot opt in     out     source
  destination
         1       78 GqKOJUpUAOboDEbYcaVUCDqprFy  all  --  *      *
  0.0.0.0/0            0.0.0.0/0

  <--- snip --->

  # iptables -V && uname -r
  iptables v1.3.1
  2.6.11.4-21.7-default

i also tested this on:

  # iptables -V && uname -r
  iptables v1.2.11
  2.4.27-2-386

alas--i have no 2.4 + 1.3.1 combo i can test on; so i cannot say there
isn't some weird interaction between those two that causes your issue to
crop up.

-j

--
"Brian: Whose leg do I have to hump to get a dry martini around here?"
        --Family Guy

