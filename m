From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: selective connection tracking?
Date: Thu, 13 May 2004 10:35:42 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040513103542.317e3262@mgalepc.utilitran.com>
References: <1084383723.40a261ebb1122@mail.borderware.com>
	<20040513102829.6d29f70d@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040513102829.6d29f70d@mgalepc.utilitran.com>
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
To: netfilter@lists.netfilter.org, fming@borderware.com


Sorry I misunderstood the question.

Michael.



On Thu, 13 May 2004 10:28:29 -0600
Michael Gale <michael.gale@utilitran.com> wrote:

> Hello Ming,
> 
> 	I thought you could do connection tracking per port for example if you
> 	where
> forwarding / allowing out http and ssh but then wanted to block SSH.
> 
> At first you would have:
> 
> iptables -A forward -i eth1 -o eth0 -s internalnetwork -p tcp --dport 80
> -match state --state ESTABLISHED,NEW -j ACCEPT
> 
> iptables -A forward -i eth1 -o eth0 -s internalnetwork -p tcp --dport 22
> -match state --state ESTABLISHED,NEW -j ACCEPT
> 
> Would allow port 80 and port 22 new or established connections, then if you
> removed the rule for port 22 and had a default policy of deny then SSH
> connections should be dropped.
> 
> Michael.
> 
> 
> 
> On Wed, 12 May 2004 13:42:03 -0400 (EDT)
> fming@borderware.com wrote:
> 
> > Hi,
> > 
> > I am from the FreeBSD/ipfilter world. I recently switched to Linux and 
> > netfilter. One question I have with netfilter connection tracking is whether
> > there I can instruct the connection tracking to selectively tracking 
> > connections.
> > 
> > Looks to me once I loaded the conn_track modules, everything was tracked. Is
> > there a way I can specify, for example, that I only want http to be tracked?
> > All other traffic will be dropped anyway, tracked or not.
> > 
> > Regards,
> > Ming
> > 
> > 
> > 
> > 
> > 
> 
> 
> -- 
> Michael Gale
> Network Administrator
> Utilitran Corporation
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

