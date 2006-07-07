From: Dwayne Hottinger <dhottinger@harrisonburg.k12.va.us>
Subject: RE: unable to connect to www.kernel.org
Date: Fri,  7 Jul 2006 08:10:44 -0400
Message-ID: <1152274244.a705c675fe31f@webmail.harrisonburg.k12.va.us>
References: <000901c6a0be$babe4560$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000901c6a0be$babe4560$0101000a@sterenborg.info>
Content-Disposition: inline
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

Quoting Rob Sterenborg <rob@sterenborg.info>:

> > I had to redo my firewall and routers over the weekend due to a
> > change in our isp.  After changing everything and modifying some of
> > my firewall rules, every website works (that I know of) except for
> > kernel.org.  I can ping kernel.org, traceroute it etc, but can not
> > open either an http or ftp connection.  Initial connection is made,
> > lynx says connecting to kernel.org and then just dies. Squid reports
> > a tcp_miss/504 for the site.  If I do an iptraf on my firewall for
> > the interface connected to my DMZ I get the following: Wed Jul  5
> > 18:58:35 2006; UDP; eth1; 46 bytes; from 204.111.40.4:33592 to
> > 204.152.191.37:33507.  If I try to connect from inside the firewall I
> > dont get any connection to kernel.org that I can find.  I am really
> > missing something here.  Ive been through my log files and cant find
> > a reason for this.  I could send my firewall script if needed.  It is
> > quite long though. I have 4 class c addresses and several small
> > subnets that get routed, natted, etc.  If anyone could help me try
> > anything else to point me to where the problem may start and end.
>
> AFAICS the udp packets you describe don't have anything to do with
> connecting to kernel.org as that traffic would be 53/udp (DNS
> lookup/reply) and 80/tcp (http request/reply).
>
> Further, you mention squid. I suppose your browser(s) and ftpclient(s)
> is(are) using squid, not NAT. If squid is on the box that performs NAT,
> it could be that it can't send packets out because something is blocking
> it in the OUTPUT chain or something.
> Ping and traceroute use NAT, not squid (they don't try to connect to
> port 80/tcp or 21/tcp) so that would mean your NAT rules are working.
>
> Whithout the script I don't think there's a way to find out what's
> happening.
>
>
> Gr,
> Rob
>
>
Sirs,
I sent Rob most of my firewall script.  Rob if you dont think that was
appropriate, just let me know.  Id rather not send it to the entire world. 
Here is what else Ive been able to dig up.  My http traffic gets redirected via
the firewall to my proxy server over port 8080.  When attempting a connection
to kernel.org, a netstat on the proxy server shows the following:

tcp        0      1 proxy.harrisonbur:32871 zeus-pub2.kernel.o:http SYN_SENT
tcp        0      0 proxy.harrison:webcache hcps-1ad4532410.hh:2188 ESTABLISHED
tcp        0      0 proxy.harrisonburg:http hcps-1ad4532410.hh:2181 TIME_WAIT
tcp        0      0 proxy.harrisonburg:http hcps-1ad4532410.hh:2183 TIME_WAIT

I get a 1152273752.023 179196 10.40.12.164 TCP_MISS/504 1421 GET
http://kernel.org/ - NONE/- text/html ALLOW "Computing/Internet"
1152274157.027 179460 10.40.12.164 TCP_MISS/504 1421 GET http://kernel.org/ -
NONE/- text/html ALLOW "Computing/Internet" in my access logs on the proxy
server.  Traceroute works on all subnets, and ping works.  However, I dont see
squat on the firewall when trying to connect to this website.

thanks,

ddh

[root@proxy logs]#

--
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools

