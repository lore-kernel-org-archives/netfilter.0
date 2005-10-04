From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Poor mans cluster question
Date: Tue, 04 Oct 2005 03:24:40 -0500
Message-ID: <43423C48.2050306@riverviewtech.net>
References: <57F9959B46E0FA4D8BA88AEDFBE582900B581D@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE582900B581D@pxtbenexd01.pxt.primeexalia.com>
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
To: "Gary W. Smith" <gary@primeexalia.com>
Cc: netfilter@lists.netfilter.org

Gary W. Smith wrote:
> Hello, 
> 
> I need to setup a very simple cluster for testing a couple different
> devices and applications.  I'm not looking for perfection.
> 
> What I have are 3 web servers in our test environment.  We are testing
> both Windows and a Linux web server at the same time.  We basically want
> to round robin traffic via IP to any one of the 3 servers.  My
> understanding is that the following should make this happen: 
> 
> -A PREROUTING -d 10.0.16.89 -j DNAT --to 10.0.16.90-10.0.16.92

I'm not quite sure how the DNATing will be handled between the 3 IPs as I have never done any thing like this.  But I'm willing to bet that your router is caching the host that it sent the traffic to and will send the traffic to the same host all the time (our at least until the cache is idle and times out).

There is one thing that I'm fairly sure of though.  If you sniff the traffic coming in to your servers you will see the traffic as from the client IP to the server IP and thus the server will reply back directly to the client thus confusing the client TCP/IP stack to droping the return traffic.  To handle this you will need to SNAT the traffic that is going to the servers such that it appears to be coming from your firewall and thus will go back to the firewall where it will be unNATed and thus go back to the correct client.

> But it doesn't.  I figure the next step would be to implement the
> CLUSTERIP but I'm not sure how to do this.  I'd really like to do this
> at the firewall level as the production environment uses local director
> for load balancing.
> 
> Is there a better approach without having to modify the OS?  I'm not
> looking for failover but rather round robin.  DNS hasn't been doing the
> round robin the way we wanted on the local LAN (as a single workstation
> will get stuck with a single IP for that session).

I don't think that DNS will have any thing to do with this, or not much of one any way.  From what you originally posted you are using IPTables to do your RR DNAT which will never resolve names to IPs after the rule insertion point.  Now if you have your 3 IPs aliased on your firewalls interface and you are RR DNS resolving the IPs you will probably need to set the cache time to live to something crazy low, say 1 minute or less?  This will force your client's to re-resolve the IP to connect to, presuming that their client DNS resolver librarys act the way that they should.

Is there a reason you are not looking at the Linux Virtual Server Project?  I think you would be able to fairly easily implement the LVS director on your system with out doing too much OS reconversion?



Grant. . . .

