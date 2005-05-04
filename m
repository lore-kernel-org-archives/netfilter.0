From: Jason Opperisano <opie@817west.com>
Subject: Re: Bind and other services on a DMZ
Date: Wed, 4 May 2005 10:06:30 -0400
Message-ID: <20050504140630.GA19302@bender.817west.com>
References: <20050503174537.09D1C1CE0A@juno.tc.df.gov.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050503174537.09D1C1CE0A@juno.tc.df.gov.br>
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

On Tue, May 03, 2005 at 02:48:48PM -0300, fabricio bianco abreu wrote:
> Hi, folks
> 
> I am trying to install a iptables based firewall to protect my servers providing
> information to the Internet in a DMZ fashioned mode.
> 
> I need some help to debug the rules I have set up. 
> 
> I will provide some background information:
> 
> 1. The firewall is a box with two ethernet adapters. The external adapter piles
> two valid adresses (200.x.y.z) and the internel adapter has one invalid address
> (172.16.a.b)
> 
> 2. One DMZ machine (ip 172.16.0.5) is used to serve smtp, http, https, ftp.
> 
> 3. Another DMZ machine (ip 172.16.0.2) is a bastion host, serving dns (bind) and
> mascarading traffic from my internal network.
> 
> As for the firewall (packet filtering) configuration I have set up a bunch of
> rules. Here are the outputs to the commands "iptables -nL" and "iptables -nL -t
> nat" 

when posting rules to the list, please either use "iptables [-t
nat|mangle] -vnxL" or the output of "iptables-save."  without seeing
all the information, it's too much guess-work.

i.e., i bet the second rule in the FORWARD chain doesn't actually accept
all traffic:

  ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0

also--you say 172.16.0.2 is also running some iptables rules--you appear
to allow TCP 53 through the FORWARD chain of the first firewall, so i'd
double-check the INPUT/OUTPUT chains of 172.16.0.2 as the source of the
zone transfer issue, and then i'd check my bind ACLs.

-j

--
"Stewie: My God, I'm to entrust my life to a turtle? Nature's "D"
 student!"
        --Family Guy

