From: Ben Russo <ben@umialumni.com>
Subject: Re: concurrent connections
Date: 06 Nov 2002 09:59:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036594806.1847.24.camel@ben.mis.tnsi.com>
References: <A590F7F751E6D6118C0800104B0DF37304CDAF@MAILGATE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A590F7F751E6D6118C0800104B0DF37304CDAF@MAILGATE>
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
To: Naleendra@dms.lanka.net
Cc: netfilter@lists.netfilter.org

On Wed, 2002-11-06 at 04:03, Naleendra@dms.lanka.net wrote:
> 
> 
> 	Hi List,
> 
> 	I have a customer of mine who needs a firewalling solution. However
> they have given specification guidelines such as,
> 
> 	170 Mbps throughput 
> 	125,000 simultaneos connections
> 
> 	I looked up the Cisco site & they have products to support this.
> Only thing to note  was the micro-processor & Memory which varied from AMD
> 133 to Intel 1Ghz for their range of models. In order to match this what is
> the spec that I could go for in the Linux Server. Is their any sort of
> yard-stick or rule of thumb for this purpose ?
> 
>  Thanks in advance
> 
>  naleendra

In a former professional position I deployed many Linux based firewalls
for 24x7 commercial production networks.  After deploying about 3 or 4
such production networks I realized that the management of the firewalls
in a dynamic network environment is very expensive in terms of man
hours.

On IBM Netfinity Servers (I think they were 7500's? 4U boxes?) Running
stock RedHat 7.2 kernels with some expensive Quad Fast Ethernet NIC's
with custom drivers from the manufacturers and a huge but simple
firewall ruleset, we never managed to push more than about 30Mbps
through the firewall.  Granted for what we were using them for that was
sufficient at the time, so we didn't worry about it.  I'm sure that
if we had taken the time to carefully configure the kernel and the
drivers and all the little tweaks and settings we could have increased
that number dramatically.

However I think that with Standard PC hardware and a Linux OS you may be
hard pushed to get a sustained 170Mbps on a stateful firewall with
125,000 connections.

(just an offhand thought...) You might consider breaking up the traffic
through different firewalls by seperating your network nodes onto
different subnets. and putting a router in front of your firewalls to
spread the load. But when you do this you enter into the firewall
management issue of having many different firewalls to be managed with
so-so management tools.

I may get flamed for saying this on this list, but for that big of a
firewall, and *expecially* if you are going to have more than 3 of them,
I would recommend that you look into a dedicated firewall appliance with
a firewall management GUI.  Something like a NOKIA box or CISCO PIX or
whatever.  I don't have much experience with them, but I really like the
CheckPoint management interface.


-Ben.


