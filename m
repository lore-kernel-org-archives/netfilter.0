From: "Joe de Vera Jr." <jhoedv@we-amuse.com>
Subject: Re: Iptables Problem on DNS Server
Date: Sat, 22 Jun 2002 21:36:12 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <002d01c21a6f$86549f60$6500a8c0@systemsadmin>
References: <20020622131306.987A9444F@lists.samba.org>
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

From: Antony Stone <Antony@Soft-Solutions.co.uk>
Organization: Software Solutions
To: <netfilter@lists.samba.org>
Subject: Re: Iptables Problem on DNS Server
Date: Sat, 22 Jun 2002 14:06:22 +0100

On Sunday 23 June 2002 5:01 am, Joe de Vera Jr. wrote:

> here's my ruleset in my machine... seen anything wrong or lacking here?
>
> just to remind you guys my problem is that.. when my firewall is running
my
> DNS don't work... thanks!

Can we just clarify that last bit ?

Do you mean that your firewall cannot resolve names by contacting an
external
DNS server, or that you are running DNS on your firewall, and other machines
cannot contact *it* as a DNS server ?



Antony.


yep,, i'm running DNS on that machine also.. an that exactly my client can't
resolve from it.. so all the DNS record on that server can't function due to
this problem.. so i force not to run a firewall for a meantime...


joe


