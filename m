From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: iptables and DNS
Date: Tue, 4 Jun 2002 14:09:32 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020604180932.GW29214@cannon.eng.us.uu.net>
References: <scfc997d.097@pzsj-office.pzs.com> <20020604185223.T27307@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020604185223.T27307@funkyjesus.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Drage <nickd@funkyjesus.org>, netfilter@lists.samba.org

On Tue, Jun 04, 2002 at 06:52:23PM +0100, Nick Drage wrote:

> On Tue, Jun 04, 2002 at 10:41:58AM -0700, Brian Ugie wrote:
> > Below  is the hosts portion of nsswitch.conf.  The actual hosts file is
> > below that. I have also included the simple config that I am using for
> > iptables. I have seen the -n option but it is not relevant for appending,
> > inserting or replacing. It only applies to listing (output)
> 
> Er, unless I'm missing something, you're using hostnames in your IPTables
> rules, and then complaining that IPTables is resolving those hostnames?

Good catch, Nick. I thought brain wanted to "-L" the iptables command
to check out the rules. In order to set the rules, follow the below guidline.

Ramin

> 
> Excuse me if this sounds obvious, but why not use IP addresses in the rule
> specifications.  If you're worried about having to alter all the relevant
> rules if an IP address changes then just assign it to a variable...
> 
> #!/bin/sh -x
> 
> WEBSERVER="10.10.10.13"
> 
> iptables -A INPUT -p tcp -d $WEBSERVER --dport 80 -j ACCEPT
> iptables -A INPUT -p tcp -d $WEBSERVER -j REJECT --reject-with tcp-reset
> 
> etc. 
> 
> <snip>
> 
> -- 
> FunkyJesus System Administration Team
> 

