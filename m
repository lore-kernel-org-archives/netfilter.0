From: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
Subject: Re: MRTG and IPTABLES
Date: Thu, 8 Jan 2004 07:13:18 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401080713.18385.danielf@supportteam.net>
References: <83055D4B014C9E478D2F04624B9E82CFAE9660@noveldc.novelgmt.mu> <200401080927.05649.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401080927.05649.Antony@Soft-Solutions.co.uk>
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

DOH! I do this all time, sorry.  He's right no $ign before the SNMP_POLLER_IP 

Also I never set the nat tables or mangle tables to drop unless im using them 
and I have accept rules for all my traffic in them. 

On Thursday 08 January 2004 03:27, Antony Stone wrote:
> On Thursday 08 January 2004 6:47 am, Gilles Yue wrote:
> > Dear sir,
> >
> > Have tried your commands below but when I run my iptables script,
> >
> > I get "command not found" and it points to the line
> >
> > $SNMP_POLLER_IP="xxx.xxx.xxx.xxx"
>
> There should be no $ at the beginning of this line.
>
> Shell scripts use $ when referencing a variable, not when defining it or
> assigning to it.   This is different from Perl.
>
> Antony.

-- 
Daniel Fairchild - Chief Security Officer | danielf@supportteam.net
The distance between nothing and infinity is always the same no matter how 
close you get to nothing.

