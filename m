From: Rodrigo Senra <rodsenra@gpr.com.br>
Subject: Re: Path to configure stateless DNAT with iptables ?
Date: Thu, 3 Oct 2002 11:15:03 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021003141440.A753168284@engenho.terra.com.br>
References: <20021002203429.512C2681B4@engenho.terra.com.br>
	<20021002211008.SCLE28874.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021002211008.SCLE28874.mta06-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

 On Wed, 2 Oct 2002 22:10:05 +0100
 Antony Stone <Antony@Soft-Solutions.co.uk> wrote
 about Re: Path to configure stateless DNAT with iptables ?:
 --------------------------------------------
 | On Wednesday 02 October 2002 9:34 pm, Rodrigo Senra wrote:
 | 
 | >  I need to do DNAT changing destination to a single
 | >  ip-address for every non-marked packet.
 | >  I mark the packets in mangle table, I DNAT in nat table...
 | >  that would suffice but I need it to be stateless instead of
 | >  stateful! Tolerating conntrack overhead (in my case) is too
 | >  expensive.
 | 

 | 
 | 1. What overhead is connection tracking adding to simple 
 |     stateless DNAT ?

 I have a DNAT rule for a specific -s <some_ip_address>, but every
 packet shows up in /proc/net/ip_conntrack not just some_ip_addres. I expected to find there just a single entry. Is it overhead ? Is
 it mandatory to conntrack every packet ?  

 | 2. How do you propose to handle SNAT of reply packets if you
 | turn off  connection tracking (is the overhead of this 
 | acceptable) ?

 Good point. I explained it poorly. Let me try again ;o):

  - prior to adopting netfilter/iptables I did NAT by hand 
    (own implementation) in kernel 2.2.  I indeed had a table 
    to fix SNAT in replies as you pointed out in 2. But just that.
    And I used a priority queue (MRU at top) to speed up nat table
    checks.
  - after adopting netfilter/iptables I threw my code away.
    Everything got faster except when I needed to do DNAT. 
    I was blaming conntrack (and the behavior explained in 1.)
    for this speed down.

  From your answer, I believe now I cannot disable conntrack
  otherwise my DNAT will break, right ?
  Is it possible to restrict conntrack to follow just the
  rules in nat table and not every packet ?
 
 | 3. What sort of machine do you have and what volume of
 | packets are you trying to shovel through it ?

 It is a dual-processor Intel 2GHz with three 100Mbit
 ethernet interfaces. About the volume I want to shovel through
 ...  as much as possible. ;o) It is supposed to be involved
 in authetication of a big cable provider.

 | I'm intrigued as to what you are doing and why you
 | think connection tracking is generating too much overhead
 | on your machine to be acceptable.

 Ok. I have something like this:
                 
                ------------------
  clients ------| target machine |------- internet
                ------------------
                       |
                       | 
                 Authentication

  A client in a cable network try to reach the Internet
  through the target machine. Suppose it is not authenticated
  yet. Then target machine will DNAT that packet to a browser
  in 'Authentication network'. If the user authenticates, a new
  rule is added in the target machine to bypass this HTTP
  redirection for such user.

  That is the simplified scenario.

  best regards,
  Senra

-- 
Rodrigo Senra         
MSc Computer Engineer   (GPr Sistemas Ltda)   rodsenra@gpr.com.br 
http://www.ic.unicamp.br/~921234  (LinUxer 217.243) (ICQ 114477550)

