From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Rate my rules. Take a look ICMP only
Date: Fri, 7 Feb 2003 22:54:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302072254.46241.netfilter@newkirk.us>
References: <20030208031705.6754.qmail@web40202.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030208031705.6754.qmail@web40202.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>, netfilter@lists.netfilter.org

On Friday 07 February 2003 10:17 pm, SBlaze wrote:

> I thought of creating a rule that will drop invalid requests.... but I
> somewhat worry about the "logability" of a single rule that would
> handle so much. If something is invalid I would like to somewhat
> isolate as much information about it as possible.
>
> These rules do that for me...
>
> # NMAP and Incoming connection Killer(SYN/RST)
> # NMAP Xmas Tree scan Killer ( God bless Google )
> # NMAP Null scan killer (got from a IPTABLES tutorial..confirmed via
> the web)=20
> # NMAP Stealth FIN scan killer (this one was a hard one to
> figure out)
>
> iptables -A INPUT -p tcp --syn -m state --state NEW -i eth0 -j DROP
> iptables -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -i eth0 -j DROP
> iptables -A INPUT -p tcp --tcp-flags ALL NONE -i eth0 -j DROP
> iptables -A INPUT -p tcp ! --syn -m state --state NEW -i eth0  -j DROP
>
> The SYN/RST also stops all incoming connecctions that are not already
> related or  established.
>
> I also have limited logs for these rules. If say I just set up an ALL
> protocol INVALID drop line.... could I just comment out the above
> rules and have the INVALID drop the scans... and the others still log?
> Is there anything that slips through the INVALID targets these might
> catch? I guess I worry about can one line stop ALL the baddies coming
> in so to speak.. especially since i have grown to trust the above
> rules.

INVALID state, clipping shamelessly from Oskar's tutorial:

<OSKAR>The INVALID state means that the packet can not be identified or=20
that it does not have any state. This may be due to several reasons,=20
such as the system running out of memory or ICMP error messages that do=20
not respond to any known connections. Generally, it is a good idea to=20
DROP everything in this state.</OSKAR>

Most of what you have rules for there would NOT qualify as INVALID for=20
packet state.

j


