From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: redirecting
Date: Thu, 1 Jul 2004 14:29:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040701122957.GR22148@home.manuelm.org>
References: <a0f69e50407010452713ae264@mail.gmail.com> <200407011305.17055.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407011305.17055.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* Antony Stone <Antony@Soft-Solutions.co.uk>  1. Jul 04:
> On Thursday 01 July 2004 12:52 pm, Askar Ali Khan wrote:
> > hi,

Hello,

> > I want if i or someone else type www.microsoft.com on my box
> > (linux, netfilter) which is part of LAN instead of microsoft.com browrse
> > give him www.linuxiso.org
> > im practicing on my box and I will apply rule on this box. My boxes
> > use another system running (win) as router/gateway
> >
> > I do know if i want to block microsoft.com or some other sites this
> > rule is working for me
> > #iptables -A OUTPUT -d www.microsoft.com -j DROP
> > but i duno how to redirect the request with iptables thingy,

The rule would be

# iptables -t nat -I PREROUTING -d $IP_OF_MS -j DNAT --to-destination $IP_OF_LINUXISO

_But_...

> > antony i hope I will hear from you fast :)

Well, he was again faster.

> I would *really* recommend that you do this sort of thing with Squid instead 
> of netfilter, espcially since you have selected www.microsoft.com as the 
> address to be redirected.
> 
> Here's why:
> 
> $ dig www.microsoft.com
> 
> [snip]
> 
> ;; ANSWER SECTION:
> www.microsoft.com.      3600    IN      CNAME   www.microsoft.com.nsatc.net.
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.156.156
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.156.220
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.244.188
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.245.92
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.245.156
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.250.252
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.144.188
> www.microsoft.com.nsatc.net. 300 IN     A       207.46.144.222

This would not be a problem, because the whole 207.46.0.0/16 belongs to
Microsoft, so IP_OF_MS="207.46.0.0/16" should work, but...

The webserver of www.linuxiso.org seems to use virtual hosts.  The
HTTP-request contains the host-part of the URL.  So this server tries to
find a virtual host called www.microsoft.com, fails and sends an error.
No, netfilter can't change this.  I dunno if squid can.

HTH,
 regards, Frank.
-- 
Sigmentation fault

