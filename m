From: "Moti Levy" <moti@flncs.com>
Subject: Re: top level rules
Date: Mon, 12 May 2003 09:24:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b701c31889$d6b63f40$0901010a@bvg6>
References: <ABEKJILKOKKGGDJKHKDFEEAICBAA.patrick@vikus.com> <1052743756.1399.0.camel@xbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter EMAIL <netfilter@lists.netfilter.org>

iptables -L -n --line0numbers will list the rule numbers 
iptables -I CHAINNAME rulenumber_to_insert REST OF RULE

----- Original Message ----- 
From: "Filip Sneppe" <filip.sneppe@cronos.be>
To: "Patrick Ahler" <patrick@vikus.com>
Cc: "netfilter EMAIL" <netfilter@lists.netfilter.org>
Sent: Monday, May 12, 2003 8:49 AM
Subject: Re: top level rules


> On Mon, 2003-05-12 at 14:25, Patrick Ahler wrote:
> > Is there any way to insert a new rule at the top of a table...
> > 
> > For instance, I have rules...
> > 
> > RULE 1
> > RULE 2
> > RULE 3
> > RULE 4
> > 
> > in order... but what if I want to place a rule before rule 1? Is that
> > possible?
> 
> Yes, just use the -I (insert) option of iptablesinstead of -A (append).
> 
> Regards,
> Filip
> 
> 
> 
> 

