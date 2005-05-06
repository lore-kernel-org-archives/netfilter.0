From: Jason Opperisano <opie@817west.com>
Subject: Re: How to Get a DMZ hosts's trafic routed via a particular IP
	address on a firewall?
Date: Fri, 6 May 2005 10:40:27 -0400
Message-ID: <20050506144027.GA27512@bender.817west.com>
References: <c0e9781f05050509315ff51a77@mail.gmail.com>
	<20050505213458.GA24884@bender.817west.com>
	<c0e9781f05050607362e5d644e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <c0e9781f05050607362e5d644e@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, May 06, 2005 at 03:36:04PM +0100, Greg Cope wrote:
> Ah - tried this:
> 
> iptables -t nat -A POSTROUTING -o eth0 -s 192.168.254.2 -p tcp --dport
> 25 -j SNAT --to-source 217.154.55.250

looks good.

> Or variants there off.
> 
> No Joy...

not even...bill joy?

> I could scream......

mmm...ice cream...

> Anyone any ideas

yeah.

> Greg
> 
> mail.e-dba.net = 192.168.254.3 the DMZ / private address
> $  iptables -t nat -L
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination         
> DNAT       tcp  --  anywhere             mail.e-dba.net      tcp
> dpt:smtp to:192.168.254.2
> 
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination         
> MASQUERADE  all  --  192.168.0.0/16       anywhere            
> SNAT       tcp  --  mail.e-dba.net       anywhere            to:217.154.55.250 
remember the part where i said, "make sure the 2nd rule comes *before*
any outbound SNAT/MASQ rule that is less specific"...i do--man, those
were good times.

anyways, since you match all 192.168.0.0/16 traffic with the MASQ rule,
the SNAT rule for 192.168.254.3 will never be matched.

translation:  put the dang SNAT rule for the mail server first.

-j

--
"Lois: I'll be just like Hillary Clinton, only you know, without the
 penis."
        --Family Guy

