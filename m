From: <bmcdowell@coxhealthplans.com>
Subject: RE: Redirect to Honeypot?
Date: Fri, 14 Nov 2003 10:24:52 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D73101131796@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org


For the curious, this is what I think I'm going to stick with for now:

	  Brouter --- DMZ
		|
	    (NAT)=09
		|
 	 (Decoy Box) --- 25% TARPIT, 25% DROP
		|
 	 (Random HoneyPot) --- (One real W2K server, One real Linux, 10 =
emulated Honeyd devices)


Just as I had drop rules before, I now have DNAT rules first.  E.g.

	iptables -t nat -A PREROUTING -p tcp -d (webserver) --dport ! 80 -j =
DNAT --to (decoy box)
	iptables -A FORWARD -p tcp -d (webserver) --dport ! 80 -j (LOG/DROP)

Just to muddy the waters a bit, I added the TTL patch to the box =
distributing packets to my honeypots. E.g.

	iptables -t mangle -A POSTROUTING -j TTL --ttl-inc 2

That makes TTL's from the NAT'ed boxes and the real boxes have the same =
value...

Now when I aim Nmap at my webserver, for example, it takes an average of =
18 minutes to return results (against just that one server).  Once it =
even crashed, after 13 or so minutes of scanning.  I couldn't get it to =
run again after that (on my Windows laptop) until I rebooted.  Those =
results that are returned are wildly inaccurate, and are different each =
time the scan is run.  OS detection is amusing - it generally returns as =
Unknown, but sometimes picks something interesting.

While all this scanning is going on, my webserver still happily serves =
up pages to the attack box.

Clearly this is going to need more work to if I'd ever like to get it =
out of test.  If I find anything truely interesting, I'll pass it along. =
 If anyone has any comments/questions/concerns please don't hesitate to =
send them my way.

Thanks,

Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
bmcdowell@coxhealthplans.com
Sent: Tuesday, November 11, 2003 2:58 PM
To: netfilter@lists.netfilter.org
Subject: Redirect to Honeypot?



Does anyone on the list have a recomendation as to how one might use
iptables to redirect traffic to a honeypot?  I have a few ideas, but
I'd really like to hear from someone who has a solution they like (or
even an idea they like).  Thanks in advance.

To clarify just a bit:

I'd like to be able to redirect packets instead of dropping them.=20
I'd also like to be able to do this as a catch-all rule at the end of
my input and forward chains.  The overall idea is to combine randomly
dropping packets, tarpitting, and live honeypot responses (from
different OS'es) in an effort to utterly stump recon efforts.  In my
head, I have visions of Linux boxes reporting they're running IIS 5
and Crays running (x app), etc.

In my testing so far, I've found that combining randomly dropping
packets and tarpitting to be extremely effective at slowing normal
NMap scans.  In some cases, scan time was increased to well over two
hours.  Now I'd like to introduce live ports into that mix.  This
way, a positive hit on a live port would not necessarily have to be
one of my production boxes.  In fact, it probably isn't...

Thanks again,

Bob


