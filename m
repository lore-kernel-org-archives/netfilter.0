From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Updating multple iptables on servers
Date: Tue, 08 Jun 2004 07:02:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086692556.23800.3.camel@localhost>
References: <E1BXbgJ-00083y-0x@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1BXbgJ-00083y-0x@vishnu.netfilter.org>
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
To: hyper@ubn.dk
Cc: netfilter@lists.netfilter.org

On Tue, 2004-06-08 at 04:09, hyper@ubn.dk wrote:
> Is it possible to update iptables from a central server. I got 25 servers
> using the same firewall and i need something to update them all from a
> central server. 
>  
> Any ideas?
>  
> Hilsen Thomas Kristensen
Although it is still a few months away from release, ISCS
(http://iscs.sourceforge.net) will help you do this.  It will also
manage any VPN and router configurations and, eventually, even the layer
two configuration.  It will do this just as easily if every firewall is
different - the work is the same - describe the environment and ISCS
automatically creates and distributes the list of rules to create that
environment.  I wish I could tell you it's here and ready for use but
it's still in very active development.  We're working on the last of the
iptables modules as I write - John
-- 
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevelopmentcorp.com


