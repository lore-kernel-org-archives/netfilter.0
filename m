From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: over a 1,000,000,000 individual ips to block
Date: Mon, 28 Jun 2004 10:31:10 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040628103110.4acb1485@mgalepc.utilitran.com>
References: <20040624145732.25300.qmail@team.outblaze.com>
	<20040628064501.3bab3f3c@mgalepc.utilitran.com>
	<40E01B10.6000202@linuxmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E01B10.6000202@linuxmail.org>
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
To: Feizhou <feizhou@linuxmail.org>, netfilter@lists.netfilter.org

Hello,

	If you allow a simple IP to make a 100 smtp connections to your mail server
then you have other problems. Why you would allow any IP to make more then 10-15
connections is beyond me. Also .. if you set a error limit (example mine is 5)
when that limit is reached the smtp and tcp connection are dropped. 

There are also other SMTP server restrictions you can take place. How do you
think mail appliances that are designed to be placed on the outside of a network
to filter traffic between the outside world and exchange work ??? Do you think
they rely solely on some other firewall to handle DOS's ??? I can tell you that
they don't. 

I am not saying that you should not block abusive IP's or network's at the
firewall. But to rely only on the firewall to solve this problem. Plus using 1
million rules ... how long would your load time be ? What about changes and
administration ? 

Also what about ESTABLISHED connections ??? If you do not use a ESTABLISHED
state -j ACCEPT at the top ... then each IP would then in theory have to match 1
million rules every time it came in.

I am sure there is a better answer then to create 1 million iptable rules. 

Michael. 


On Mon, 28 Jun 2004 21:20:16 +0800
Feizhou <feizhou@linuxmail.org> wrote:

> Michael Gale wrote:
> > Hello,
> > 
> > 	Why don't you block networks ??
> > 
> > Firewall - SYN Cookie enabling ? 
> 
> What good is syn cookies against traffic that conform to tcp rules but 
> are just too abusive?
> > 
> > Mail servers - use RBL list - this list will contain networks of IP's that
> > belong to home users. So they do not need to connect directly to your mail
> > server.
> 
> RBL does nothing against spammers who open 100 connections to each of 
> your MXs and who run malware that do not understand,respect smtp 5xx. 
> Dropping the connection means they keep coming at you. For these, there 
> is nothing but a firewall that will keep them off your MXs.
> > 
> > Web servers -- rate limiting ? block networks ? Better web server ?
> > 
> > If you blocked networks ? The estimated max number of rules a packet might
> > have to match would be 254 ... plus the rest of your filtering for ports and
> > other needs. This could slow down network access because of all the rules to
> > check for each packet.
> > 
> > If you are not using network addresses the list would become to long.
> 
> I am sure CIDRs were part of the OP's mind since iptables takes both 
> individial ips and CIDRs. He probably does have a mixture of over a 
> million ips/cidrs he wants to block.
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

