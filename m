From: Jason Opperisano <opie@817west.com>
Subject: Re: pptp nat and fedora core3
Date: Thu, 17 Feb 2005 09:34:48 -0500
Message-ID: <1108650888.4629.39.camel@hubcap.ljm.dom>
References: <42149F1B.1000504@caris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42149F1B.1000504@caris.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2005-02-17 at 08:41, Peter Marshall wrote:
> I am building a firewall that has to support the natting of pptp ... I 
> was hoping fedora core 3 would have the necessary conntrack modules 
> (like gre and pptp) built into the kernel ... but it does not ...

nope--sure doesn't.

> I would REALLY prefer to not have to re-compile the kernel ... 

well...ya gotta...

> Is there 
> a "laodmodule" line I can use to add the stuff at runtime ?  

no.

> What 
> modules do I need ?

ip_conntrack_pptp
ip_conntrack_proto_gre
ip_nat_pptp
ip_nat_proto_gre


> I am going to have windows xp boxes use the built in pptp client to 
> connect out of my lan to an external site ....
> 
> Is there a difference between what you would do with rh9 and fed core3

sort of.  redhat 9 is a 2.4-based distro, while fc3 is a 2.6-based
distro.  you can search the archives on this, but my observation is that
there are still issues with the 2.6 of the PPTP conntrack/nat code.

if you *must* use 2.6, you almost certainly will want to grab the latest
POM from SVN.  note:  "must" means the machine you are using as the
firewall will not run with a 2.4 kernel.

if the machine is 2.4-friendly, then stick with what works.  since rh9
is eol--if this is a new install, and you like the rh-style of distro,
might i suggest CentOS as base for your firewall?  take it from a guy
that runs it--FC is a toy, and a nightmare to maintain if you're used
stable code and patch updates that don't break things... 

-j

--
"I'm better than dirt. Well, most kinds of dirt... not that fancy
 store-bought dirt... that stuff's loaded with nutrients, I... I
 can't compete with that stuff."
	--The Simpsons


