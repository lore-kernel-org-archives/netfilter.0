From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: INPUT or FORWARD;;
Date: Mon, 20 Dec 2004 15:40:48 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10412201539220.18976-100000@darkstar.sysinfo.com>
References: <20041220132421.DAE032F42A@kshira.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041220132421.DAE032F42A@kshira.sterenborg.info>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

On Mon, 20 Dec 2004, Rob Sterenborg wrote:

> netfilter-bounces@lists.netfilter.org wrote:
> >> A multi-homed firewall having at least two interfaces, is known, at
> >> least to itself by those IP/hostnames combos assinged to its
> >> interfaces.  <i.e. ppp0 and eth0>  So say rules coming from the ppp0
> >> interface into the firewall <INPUT rules> are directed to it's other
> >> name/interface 
> >> 
> >> -i /dev/ppp0 -d /dev/eth0
> > 
> > well--those values make no sense whatsoever, but if you're
> > asking if the following is valid:
> > 
> >   iptables -A INPUT -i ppp0 -d $IP_OF_ETH0 -j ACCEPT
> > 
> > then yes.  the INPUT chain is traversed by packets destined
> > for a local process (IP addresses).  the input interface is
> > just a tag attached to the packet.
> 
> I'm not sure I understand this :
> I agree it's a valid rule (syntax), but I don't think it will ever match
> a packet.
> 
> If -i and -d are specified, they both have to match to accept a packet,
> right ?
> Because <ip_eth0> is not assigned to ppp0, how can -i ppp0 -d <ip_eth0>
> ever match for the INPUT chain ?

That was the rational of my asking if a rule that specified a "-i
/dev/ppp0 -d /dev/eth0" setup would be a FORWARD rhather then a INPUT
rule, as we are crossing interfaces with such a rule.

Thanks,

Ron Duresne
-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


