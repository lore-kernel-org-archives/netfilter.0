From: ads nat <adsnat@yahoo.com>
Subject: Re: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 07:30:18 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031223153018.33886.qmail@web60406.mail.yahoo.com>
References: <1072191976.2184.355.camel@grendel>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072191976.2184.355.camel@grendel>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org

Ya,
Following worked from command line :
#######
iptables -A INPUT -p tcp ! --tcp-flags SYN SYN -m
state --state NEW -j LOG --log-prefix " New not syn: "

#######


Does this means that I should enter all rules from
command line.
Please guide me.
Thanks

--- Chris Brenton <cbrenton@chrisbrenton.org> wrote:
> On Tue, 2003-12-23 at 08:37, ads nat wrote:
> > I modified rules as follows :
> > 
> > ###########
> > -A INPUT -p tcp ! --tcp-flags SYN SYN -m state
> --state
> > NEW -j LOG --log-prefix " New not syn: "
> 
> <snip>
> 
> > Applying iptables firewall rules: iptables-restore
> > v1.2.6a: Unknown arg `--tcp-flags'
> 
> Well this could be your problem. Try upgrading to
> 1.2.8 or later. Could
> be the option is not supported in older version,
> especially as an
> inverse. 
> 
> To isolate whether its your script or a version
> issue, try running the
> iptables command straight from the command line and
> see if you get the
> same error.
> 
> HTH,
> C
> 
> 


__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

