From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Argh!  I'm kicking myself
Date: Fri, 19 Dec 2003 17:06:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031219220626.GF17702@cannon.eng.us.uu.net>
References: <015b01c3c670$99b77600$3dc2a70a@melita.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <015b01c3c670$99b77600$3dc2a70a@melita.com>
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
To: Ian Hunter <ihunter@hunterweb.net>
Cc: netfilter@lists.netfilter.org

On Fri, Dec 19, 2003 at 03:42:21PM -0500, Ian Hunter wrote:

> For days now I've been trying to figure out how to recompile my Redhat
> 2.4.20-24.9 kernel to allow masquerading IPSec ESP traffic.  I ran the

"allow masquerading IPSec ESP traffic" ?? Or just allow forwarding the
IPsec traffic?

> much-vaunted "grep -i masq /proc/ksyms" and to my chagrin got nothing back,
> but on a lark decided I'd try "iptables -A FORWARD -t nat -i ppp0 -p esp -j
> ACCEPT" just to see if it would fly and it did.  Of course.  And now you're
> all laughing at me.
> 
> Where is this documented, that gre, esp, ah, and the like are acceptable
> protocols?  The docs mention icmp, tcp, and udp only.

Which doc?

> 
> Is there such a document, or have I discovered a particular cover of the
> netfilter doc-hole?

man iptables:

...
       -p, --protocol [!] protocol
              The protocol of the rule or of the packet to check.  The  speci-
              fied protocol can be one of tcp, udp, icmp, or all, or it can be
              a numeric value, representing one of these protocols or  a  dif-
              ferent  one.   A  protocol  name  from  /etc/protocols  is  also
              allowed.  A "!" argument before the protocol inverts  the  test.
              The  number  zero is equivalent to all.  Protocol all will match
              with all protocols and is taken as default when this  option  is
              omitted.
...

Ramin

> Ian
> 

