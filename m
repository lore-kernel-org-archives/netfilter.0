From: Feizhou <feizhou@linuxmail.org>
Subject: Re: over a 1,000,000,000 individual ips to block
Date: Mon, 28 Jun 2004 21:20:16 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E01B10.6000202@linuxmail.org>
References: <20040624145732.25300.qmail@team.outblaze.com> <20040628064501.3bab3f3c@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040628064501.3bab3f3c@mgalepc.utilitran.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Gale <michael.gale@utilitran.com>
Cc: netfilter@lists.netfilter.org

Michael Gale wrote:
> Hello,
> 
> 	Why don't you block networks ??
> 
> Firewall - SYN Cookie enabling ? 

What good is syn cookies against traffic that conform to tcp rules but 
are just too abusive?
> 
> Mail servers - use RBL list - this list will contain networks of IP's that
> belong to home users. So they do not need to connect directly to your mail
> server.

RBL does nothing against spammers who open 100 connections to each of 
your MXs and who run malware that do not understand,respect smtp 5xx. 
Dropping the connection means they keep coming at you. For these, there 
is nothing but a firewall that will keep them off your MXs.
> 
> Web servers -- rate limiting ? block networks ? Better web server ?
> 
> If you blocked networks ? The estimated max number of rules a packet might have
> to match would be 254 ... plus the rest of your filtering for ports and other
> needs. This could slow down network access because of all the rules to check for
> each packet.
> 
> If you are not using network addresses the list would become to long.

I am sure CIDRs were part of the OP's mind since iptables takes both 
individial ips and CIDRs. He probably does have a mixture of over a 
million ips/cidrs he wants to block.

