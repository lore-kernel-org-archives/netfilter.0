From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Ip handling
Date: Thu, 19 Jun 2003 09:30:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030619133045.GA7161@cannon.eng.us.uu.net>
References: <7C9884991ADAE0479C14F10C858BCDF5122DDB@alderaan.smgtec.com> <200306190201.21883.pc-secure@home.nl> <20030619040249.GB5744@cannon.eng.us.uu.net> <200306191008.54741.pc-secure@home.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200306191008.54741.pc-secure@home.nl>
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
Content-Transfer-Encoding: 7bit
To: Pascal Italiaander <pc-secure@home.nl>
Cc: netfilter@lists.netfilter.org

On Thu, Jun 19, 2003 at 10:08:54AM +0200, Pascal Italiaander wrote:

> Op donderdag 19 juni 2003 06:02, schreef Ramin Dousti:
> > On Thu, Jun 19, 2003 at 02:01:21AM +0200, Pascal Italiaander wrote:
> > > small errors were in it, fixed:
> > >
> > >  iptables -I INPUT -p all -m mac --mac-source 10:20:30:40:05:06 -m \
> > >  	state --state NEW -j ACCEPT
> > >  iptables -I OUTPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
> >
> > Just a performance note. Since a high percentage of the packets are
> > ESTABLISHED,RELATED it is recommended to have this rule at the
> > beginning of the rule set prior to any other rule and also "-p all"
> > is redundant...
> >
> > Ramin
> >
> > > Pascal
> 
> 
> huhum....  , did you notice the -I insert rule ?
> 
> The -I rule means that the rule is placed at the beginning of the chain.  :-)

Yes, sorry. I'm used to -A... which gives you a chronological order of
the rule setup. With -I you have to read the rules in the reverse order ;-)

Ramin

> 
> Pascal
> 
> 
> 

