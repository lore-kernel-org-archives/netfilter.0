From: "Joe de Vera Jr." <jhoedv@we-amuse.com>
Subject: Re: Iptables Problem on DNS Server
Date: Sun, 23 Jun 2002 02:26:40 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <000601c21a98$162eeb40$6500a8c0@systemsadmin>
References: <20020622173606.02EE74692@lists.samba.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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


--__--__--
Message: 2
From: Antony Stone <Antony@Soft-Solutions.co.uk>
Organization: Software Solutions
To: <netfilter@lists.samba.org>
Subject: Re: Iptables Problem on DNS Server
Date: Sat, 22 Jun 2002 14:39:14 +0100

On Sunday 23 June 2002 5:36 am, Joe de Vera Jr. wrote:

> > On Sunday 23 June 2002 5:01 am, Joe de Vera Jr. wrote:
> > > here's my ruleset in my machine... seen anything wrong or lacking
here?
> > > just to remind you guys my problem is that.. when my firewall is
running
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
> can't resolve from it.. so all the DNS record on that server can't
function
> due to this problem.. so i force not to run a firewall for a meantime...

Okay - the answer is simple, then.   You have no rule allowing udp packets
into the machine on port 53.



Antony.


oic... so now how will i going to add that udp packets allow to my ruleset?
what parameter that i supposed to put on my iptables command...

thanks in advance...

joe


