From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: too may error requests
Date: Sun, 1 Aug 2004 09:24:33 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051217@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter <netfilter@lists.netfilter.org>

> 203.xx.xxx.62   | NONE/413                     | 1653     | NONE
> |error:request-too-large

Look in your squid.conf file for the directives:

	request_header_max_size
	request_body_max_size

In 2.5 the former defaults to 10 KB, the latter defaults to no limit.

> And here is the tcpdum -n -t host IpOfClient-error-request-too-large
>
> 3.89.146.62.4563 > 203.89.149.112.http: S 4257159308:4257159308(0) win
> 8760 <mss 1460,nop,nop,sackOK> (DF)

That is an HTTP (or port 80 at least) and would be part of the problem =
you're having.

> 203.89.146.62.4579 > 203.89.146.213.6129: S 4257825751:4257825751(0)
> win 8760 <mss 1460,nop,nop,sackOK> (DF)
> 203.89.146.62.4572 > 203.89.146.213.2745: S 4257614747:4257614747(0)
> win 8760 <mss 1460,nop,nop,sackOK> (DF)
> 203.89.146.62.4608 > 203.248.165.97.2745: S 4259124906:4259124906(0)
> win 8760 <mss 1460,nop,nop,sackOK> (DF)
> 203.89.146.62.4612 > 203.248.165.97.3127: S 4259306850:4259306850(0)
> win 8760 <mss 1460,nop,nop,sackOK> (DF)
> 203.89.146.62.4605 > 203.171.104.23.6129: S 4258977243:4258977243(0)
> win 8760 <mss 1460,nop,nop,sackOK> (DF)
> 203.89.146.62.4592 > 203.89.210.235.1025: S 4258477049:4258477049(0)
> win 8760 <mss 1460,nop,nop,sackOK> (DF)
> 203.89.146.62.4604 > 203.171.104.23.3127: S 4258938239:4258938239(0)
> win 8760 <mss 1460,nop,nop,sackOK> (DF)

None of the above packets are destined for port 80.  They are for:

6129 - Dameware
2745 - Beagle Virus
3127 - MyDoom
1025 - Various MS RPC & LSA exploits

So yeah--I'd say that the host at 203.89.146.62 has some issues...

> 1) Alright im not going to ask squid related things in this mailing
> list, however I love to know if someone knows after watching tcpdump
> output what sorta request he is sending and is he really infected with
> some type of virues, spyware?

Oops, guess I already answered those...

> 2) Is it possible to block his "error:request-too-large" requests with =
iptables?

Surely...IIRC you are transparently redirecting your internal traffic to =
the squid proxy on the same machine as netfilter.  In that case, you =
need to catch this traffic *prior* to the redirect.  Somewhere in your =
script you have:

	iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 \
	  -j REDIRECT --to-port 3128

So, before that, you need:

	iptables -t nat -I PREROUTING -i eth0 -p tcp --dport 80 \
	  -s 203.89.146.62 -j DROP

"-I" will make it the first rule, "-I PREROUTING X", will insert it at =
rule X...

In addition to keeping this machine from bashing your squid proxy, I =
would go ahead and block all that other virus nastiness with:

	iptables -I FORWARD -s 203.89.146.62 -j DROP

Same caveats for use of "-I" apply...

Now--if you want to be a nice guy...instead of just blocking all access =
from this machine without informing the user--you could do this =
(again--this probably belongs on a squid mailing list):

Forget the PREROUTING DROP rule (but keep the FORWARD DROP rule), and =
allow the user to make it to the squid proxy.  Add the following to =
squid.conf:

	acl INFECTED src 203.89.146.62/32
	# this must go somewhere before your line "http_access allow localnets"
	http_access deny INFECTED
	deny_info infected.html INFECTED

Create a file called infected.html in the directory defined as =
"error_directory" and place in it something along the lines of:

  Your machine has been denied access for being infected with malware =
(virii, trojans, spyware, backdoors).

  Please contact Tech Support at [ ... ] for help resolving this =
issue...

In my experience, most users don't know they are infected, but just =
cutting off their network access without letting them know why isn't =
really all that productive either.

Sorry for getting a little OT with the squid stuff...

-j



