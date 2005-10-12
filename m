From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: IP Vs DNS
Date: Tue, 11 Oct 2005 19:32:14 -0500
Message-ID: <200510111932.14894.rob0@gmx.co.uk>
References: <434C28FB.3000805@ttienterprises.org>
	<20051011231030.GA18418@salty>
	<434C520F.4050308@ttienterprises.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434C520F.4050308@ttienterprises.org>
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

On Tuesday 2005-October-11 19:00, Barry Fawthrop wrote:
> Jim Laurino wrote:
> >> Greetings all
> >>
> >> with an IPTABLES ruleset you can specify an IP address to be
> >> allowed/blocked
> >> iptables INPUT -s 12.12.12.12 -j ALLOW
> >>
> >> But can this be done with a DNS name
> >> iptables INPUT -s www.name.com -j ALLOW
> >
> > IPTABLES accepts DNS names, but the DNS lookup is performed
> > when the rule is placed in the kernel,
> > not when the rule is evaluated against a packet.
> > The kernel (netfilter) rules use ip address only.

Yes, I had started a reply to demonstrate, but didn't finish it.

# iptables -vA INPUT -s net/24
  all opt -- in * out *  192.168.6.0/24  -> 0.0.0.0/0
# iptables -vA INPUT -s site # this name resolves to 2 IP's
  all opt -- in * out *  x.z.196.54  -> 0.0.0.0/0
  all opt -- in * out *  y.x.192.52  -> 0.0.0.0/0
# iptables -vnL INPUT
Chain INPUT (policy ACCEPT 44M packets, 5956M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0            all  --  *      *       192.168.8.0          0.0.0.0/0
    0     0            all  --  *      *       x.z.196.54           0.0.0.0/0
    0     0            all  --  *      *       y.x.192.52           0.0.0.0/0

A name that resolves to more than one IP gives you that many rules, one
rule for each IP.

> > To achieve what you want, I think you would have to
> > update the rule whenever the DNS mapping changed.
>
> How can this be done on a per packet basis, where the IP is checked
> regularly

Not at all. Think it through! What does netfilter see on an incoming
packet? Source IP, destination IP, protocol headers, and payload. You
want to look up reverse DNS names in real time, on live traffic? Not a
good plan. And there too, be aware that even if this was possible you
could only act on reverse DNS names. You mentioned www.nasa.gov :

$ dig www.nasa.gov

; <<>> DiG 9.3.1 <<>> www.nasa.gov
;; global options:  printcmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 44724
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 7, ADDITIONAL: 0

;; QUESTION SECTION:
;www.nasa.gov.                  IN      A

;; ANSWER SECTION:
www.nasa.gov.           600     IN      CNAME   www.nasa.gov.speedera.net.
www.nasa.gov.speedera.net. 120  IN      A       63.216.25.145
www.nasa.gov.speedera.net. 120  IN      A       216.200.68.6

And the reverse on those IP's:

$ host 63.216.25.145
145.25.216.63.in-addr.arpa domain name pointer 63-216-25-145.sdsl.cais.net.
$ host 216.200.68.6
Host 6.68.200.216.in-addr.arpa not found: 3(NXDOMAIN)

Wow, look at those TTL's, 600 on the CNAME and 120 on the A's! NASA DNS
records are short-lived, just like [snip crude joke] :)

> or can the table be flushed and reloaded every hour.

Only possible way to do it. I would put these dynamic rules into a user
chain, and only flush and reresolve the rules in that chain.

> What would be the negative of doing a reload each hour??

You MIGHT see momentary flickers in connectivity, but probably none. If
something like streaming video was affected, you might notice it, but
otherwise probably not.

I spent more than 10 minutes on this, start to now, so let's look at
those NASA records again.

;; ANSWER SECTION:
www.nasa.gov.           600     IN      CNAME   www.nasa.gov.speedera.net.
www.nasa.gov.speedera.net. 120  IN      A       208.254.75.142
www.nasa.gov.speedera.net. 120  IN      A       208.254.75.143

$ host 208.254.75.142
Host 142.75.254.208.in-addr.arpa not found: 3(NXDOMAIN)
$ host 208.254.75.143
Host 143.75.254.208.in-addr.arpa not found: 3(NXDOMAIN)

Two different hosts, neither with reverse DNS.

You have to consider how fast your target is moving as you take aim at
it. This particular one moves very fast. Resolving this once an hour
won't really do much for you. In general you've got the right idea,
though.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

