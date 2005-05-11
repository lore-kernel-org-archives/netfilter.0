From: Jason Opperisano <opie@817west.com>
Subject: Re: Can anyone tell wat's going on here?
Date: Wed, 11 May 2005 14:30:15 -0400
Message-ID: <20050511183015.GA13507@bender.817west.com>
References: <Pine.LNX.4.63.0505111249010.3025@palangana>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0505111249010.3025@palangana>
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

On Wed, May 11, 2005 at 12:49:39PM -0300, Sergio Penkale wrote:
> Hi, I have a problem that's driving me crazy:
> I have a nat box running Debian Sarge under a 2.6.11.7 kernel. I compiled
> this kernel myself, which could be the source of problems.
> The nat box itself works great, but masquerading has a strange problem,
> some things work and others don't. For example some web pages (like google)
> work great, and some others (like hotmail for example), don't work at all,
> while in the nat box all of them work. 
> I've tried https pages on the clients and they work, so the problem seems to
> be at the level of packets, and it only affects the traffic that gets 
> masqueraded.
> I have a lot of iptables rules, but it makes no difference using only 
> trivial
> masquerading rules. That is: flushing everything, setting all policies to 
> ACCEPT
> and adding "-A POSTROUTING -s 10.10.10.0/255.255.255.0 -o ppp0 -j 
> MASQUERADE" in nat.
> Usinf SNAT instead of MASQUERADE doesn't make any difference either
> 
> The problem also arises when doing ssh: i login to a remote machine and do 
> an ls
> of a directory with many files. If i make this from the nat box it works 
> fine,
> but if i repeat those same steps from a masqueraded client i only get one or
> two listing lines and then it just hangs.
> Here's the tethereal output of this: 201.252.166.212 is my ip and 
> xxx.xxx.xxx.xxx
> is a remote machine, i've already loged in and i start capturing when i 
> send the
> ls command. From the nat box it works ok:

your symptoms scream 'MTU Issue' at me.  try this rule and see if it
fixes it:

  iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
    -j TCPMSS --clamp-mss-to-pmtu

-j

--
"Brian: Seriously, who buys a novelty fire extinguisher?
 Peter: I'll tell you who: someone who cares enough about physical
 comedy to put his entire family into serious danger, that's who."
        --Family Guy

