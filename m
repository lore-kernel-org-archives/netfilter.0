From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: over a 1,000,000,000 individual ips to block
Date: Mon, 28 Jun 2004 06:45:01 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040628064501.3bab3f3c@mgalepc.utilitran.com>
References: <20040624145732.25300.qmail@team.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040624145732.25300.qmail@team.outblaze.com>
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

Hello,

	Why don't you block networks ??

Firewall - SYN Cookie enabling ? 

Mail servers - use RBL list - this list will contain networks of IP's that
belong to home users. So they do not need to connect directly to your mail
server.

Web servers -- rate limiting ? block networks ? Better web server ?

If you blocked networks ? The estimated max number of rules a packet might have
to match would be 254 ... plus the rest of your filtering for ports and other
needs. This could slow down network access because of all the rules to check for
each packet.

If you are not using network addresses the list would become to long.

Michael.


On Thu, 24 Jun 2004 22:57:32 +0800
"Timothy Webster" <timothyw@outblaze.com> wrote:

> I have a need to block 1 -> 2 million ips. 
> This edge firewall will be blocking dos attackers, spammers
> from hitting our proxys, and mail/web servers.
> I also need to be able to reload the 1 -> 2 million blocked 
> ips from time to time as they change. 
> But this list is not changing continuously.
> 
> Thoughts how to do this?
> What would you recommend for a hardware?
> The iptables set patch, what else?
> 
> 
> I need to come of with a plan so I can begin testing for
> deployment.
> 
> Thanks,
> 
> -Tim
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

