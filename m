From: "Shaun T. Erickson" <ste@smxy.org>
Subject: [SOLVED] Re: incoming interface confusion question
Date: Mon, 21 Jun 2004 20:13:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D779AA.4040905@smxy.org>
References: <40D71EC4.7090900@smxy.org> <1087849139.17067.25.camel@localhost> <40D74F60.6030105@smxy.org> <200406212328.19329.Antony@Soft-Solutions.co.uk> <40D76A3F.90503@smxy.org>
Reply-To: ste@smxy.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D76A3F.90503@smxy.org>
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
To: netfilter@lists.netfilter.org

Thanks for your comments and questions, everyone - they got me onto a 
different train of thought which quickly led me to a resolution - I'm in 
your debt. :)

The traffic was indeed response packets to connections made from systems 
on my lan. It seems that I put in a rule on my netfilter box, Friday, 
that allowed out some traffic that had been bottled up, just waiting to 
get to the internet. This traffic turned out to be windows servers 
looking for updates from microsoft. The firewall did let the return 
packets back, but logged them as if it hadn't. The log rule was supposed 
to log anything that was about to hit the default chain policy of drop, 
but the rule I added Friday got added after the logging rule, instead of 
before it. So, it was logged, then accepted.

Mystery solved.

Now, if I were a networking guy, instead of a sysadmin, or at least one 
with more networking knowledge, I'd've figured this out this morning, 
and saved myself a day's wild goose chase, and the additional gray 
hairs. Sigh.

Again, thanks.

	-ste

