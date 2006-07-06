From: Dwayne Hottinger <dhottinger@harrisonburg.k12.va.us>
Subject: RE: unable to connect to www.kernel.org
Date: Thu,  6 Jul 2006 09:25:59 -0400
Message-ID: <1152192359.4ab6ef6d5499c@webmail.harrisonburg.k12.va.us>
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

Im using squid on another box.  Running the transparent proxy.  I know the ports
are wrong.  I agree that natting is working correctly Rob.  I'll get my script
and clean it up and send it to the list for someone to dissect.  Might be a
little.  Just seems weird that the only site I cant get to (so far) is
kernel.org.  I thought maybe they did something weird on their end that someone
knew about.

thanks,

ddh


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


--
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools

