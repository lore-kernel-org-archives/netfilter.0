From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 20:55:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406152055.30204.Antony@Soft-Solutions.co.uk>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108> <200406151952.48641.Antony@Soft-Solutions.co.uk> <1921.64.2.245.108.1087327479.squirrel@64.2.245.108>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1921.64.2.245.108.1087327479.squirrel@64.2.245.108>
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
To: netfilter <netfilter@lists.netfilter.org>

On Tuesday 15 June 2004 8:24 pm, Jonathan Villa wrote:

> > The output from "iptables -L -nvx" would be useful, as it shows us the
> > rules
> > in the correct order, which interfaces they apply to, and the packet /
> > byte
> > counts so we can see how many times particular rules have been matched.
>
> here is the output for iptables -L -nvx. I've also attached a txt file in
> case you want to see a cleaner output

Nice.   The .txt file was much easier to read :)

The first thing I notice about the ruleset you have posted is that none of the 
rules which included your network range matched any packets at all.

Therefore that doesn't tell us much about what source address/es the packets 
you are having problems with are coming from.

Maybe the timing was just unfortunate, but I can't see any TCP port 3306 
packets at all.   Therefore I think a LOG rule would be a good idea, to try 
and track down where the packets are coming from, which your 
carefully-crafted -s xxx.xxx.xx.0/24 rules aren't apparently matching.

Try something like the following:

iptables -A INPUT -p tcp --dport 3306 -j LOG

The -A will ensure that the rule comes after all your other rules (which are 
supposed to ACCEPT the packets one way or another).   However, I notice you 
have a default ACCEPT policy (ugh) and a final rule which DROPs all 
non-loopback packets.   I suggest you change this to a default DROP policy 
and a final rule which ACCEPTs all the loopback packets.   Then the rule 
above will become the final rule in your chain, guaranteeing that you LOG any 
packets destined for MySQL just before they get (unfortunately) DROPped.

Regards,

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


