From: "Garcia Ruiz" <gar_ruiz@teleline.es>
Subject: Re: ssl forward / proxy question
Date: Fri, 25 Jul 2003 20:38:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006701c352db$e891a380$05001aac@breton1>
References: <20030725001249.9399.qmail@saturn5.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: jen@saturn5.com, netfilter@lists.netfilter.org

Have a look at Squid proxy. The last releases admit SSL reverse proxying. If
it would be capable of handling different servers your problem would be
solved. You could have it inside of the firewall (but be careful with
security issues).

Regards.

BGR


----- Original Message ----- 
From: <jen@saturn5.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, July 25, 2003 2:17 AM
Subject: ssl forward / proxy question


>
> hi,
>
> i have a NAT set up via an iptables firewall on RHAS. i have various
webservers
> behind it (and other stuff), but now i'm required by marketing (sigh) to
set
> up loads of SSL certificates. since apache/apache2 still requires one ip
> address per SSL certificate, and they mean to do lots of these, i'm
wondering
> how to set it up in such a way that all DNS points to one external IP
address
> such as 234.56.78.90. when the packet hits the firewall, something proxies
it
> so that it will see the *name* address, and forward it on to a virtual IP.
for
> example:
>
> there are 3 domains all belonging to the same "real" IP address.
>
> 234.56.78.90 -> www.guinness.com
> 234.56.78.90 -> www.kicks.com
> 234.56.78.90 -> www.butt.com
>
> so a user wants to go to www.guinness.com, the IP takes the packet to the
fire
> wall/proxy/whatever, notices that it's "www.guinness.com" and and will
forward t
> he packet on to the internal address of 10.31.1.44
>
> user goes to www.kicks.com, and the packet goes to 10.31.1.45
>
> www.butt.com will get forwarded to 10.31.1.46
>
> is there something like this that is possible?
>
> thanks!!
>
> -\jen
>
>



