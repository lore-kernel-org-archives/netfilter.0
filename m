From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables Problem on DNS Server
Date: Sat, 22 Jun 2002 14:39:14 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622133916.DOTG4626.mta02-svc.ntlworld.com@there>
References: <20020622131306.987A9444F@lists.samba.org> <002d01c21a6f$86549f60$6500a8c0@systemsadmin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002d01c21a6f$86549f60$6500a8c0@systemsadmin>
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
To: netfilter@lists.samba.org

On Sunday 23 June 2002 5:36 am, Joe de Vera Jr. wrote:

> > On Sunday 23 June 2002 5:01 am, Joe de Vera Jr. wrote:
> > > here's my ruleset in my machine... seen anything wrong or lacking here?
> > > just to remind you guys my problem is that.. when my firewall is running
> > > my DNS don't work... thanks!
> >
> > Can we just clarify that last bit ?
> >
> > Do you mean that your firewall cannot resolve names by contacting an
> > external
> > DNS server, or that you are running DNS on your firewall, and other
> > machines cannot contact *it* as a DNS server ?
>
> yep,, i'm running DNS on that machine also.. an that exactly my client
> can't resolve from it.. so all the DNS record on that server can't function
> due to this problem.. so i force not to run a firewall for a meantime...

Okay - the answer is simple, then.   You have no rule allowing udp packets 
into the machine on port 53.

 

Antony.

