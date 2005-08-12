From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Logging
Date: Fri, 12 Aug 2005 01:24:44 -0500
Message-ID: <42FC40AC.8020908@riverviewtech.net>
References: <42FB7394.4010203@krap.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42FB7394.4010203@krap.dk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Svenne Krap wrote:
> Hi.
> 
> I am currently working on a not so simple firewall setup on a modern 
> machine (Xeon, Gigs of memory, SCSI subsystem).
> 
> As part of it, I would like to know various "event" statistics.Questions 
> I would like to answer is "How many hits on port 1433 have i got, and 
> how is that distributed amongst the machines". Think pivot table data.
> 
> Is there some way to get netfilter to collect rule hits (like with no -j 
> clause) for a each port/ip-address individually within a range ?
> Other than creating thousands of lines of rules and add them to my 
> "firewall-startup" script (which is currently slightly less than 80 rules).
> 
> I have thought of just logging all traffic and running it through a 
> userspace program via syslog-ng, but frankly I worry about performance 
> (the firewall should be able to filter at least the 100Mbps connection, 
> it currently sits on) under flooding.
> 
> Your thoughs are apprieciated :)
> 
> Svenne
> 


You might want to take a look at the ACCOUNT match (http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-ACCOUNT).



Grant. . . .

