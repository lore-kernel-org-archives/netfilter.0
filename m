From: Pascal Italiaander <pc-secure@home.nl>
Subject: Re: Ip handling
Date: Thu, 19 Jun 2003 10:08:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306191008.54741.pc-secure@home.nl>
References: <7C9884991ADAE0479C14F10C858BCDF5122DDB@alderaan.smgtec.com> <200306190201.21883.pc-secure@home.nl> <20030619040249.GB5744@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030619040249.GB5744@cannon.eng.us.uu.net>
Content-Disposition: inline
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

Op donderdag 19 juni 2003 06:02, schreef Ramin Dousti:
> On Thu, Jun 19, 2003 at 02:01:21AM +0200, Pascal Italiaander wrote:
> > small errors were in it, fixed:
> >
> >  iptables -I INPUT -p all -m mac --mac-source 10:20:30:40:05:06 -m \
> >  	state --state NEW -j ACCEPT
> >  iptables -I OUTPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> Just a performance note. Since a high percentage of the packets are
> ESTABLISHED,RELATED it is recommended to have this rule at the
> beginning of the rule set prior to any other rule and also "-p all"
> is redundant...
>
> Ramin
>
> > Pascal


huhum....  , did you notice the -I insert rule ?

The -I rule means that the rule is placed at the beginning of the chain.  :-)

Pascal




