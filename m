From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: icmp echo requests
Date: Mon, 29 Sep 2003 12:49:30 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309291238510.2782@xena.cft.ca.us>
References: <3F77CE17.30605@kdtc.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F77CE17.30605@kdtc.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cc <cc@kdtc.net>
Cc: Netfilter Group <netfilter@lists.netfilter.org>

On Mon, 29 Sep 2003, cc wrote:
> I've been monitoring the NAT router with pktstat and am a little
> perturbed to see quite a lot of icmp echo requests.  Now I've
> setup my Linux firewall to reject icmp echo requests.
>
> Is this the right(?)/correct/valid/appropriate thing to do?

I see a lot of pings too.  At home my Linksys residential gateway reports
that they look like they were address spoofed.  (So how did it figure that
out?)  This leads me to suspect that they are part of a distributed denial
of service attack -- the alleged origin of the ping, to which you are
supposed to send a packet, is the victim.

Before my home Linux gateway blew its motherboard, I just dropped all pings
(in fact, just about everything) on the wild-side interface.  Best not to
send ICMP-host-unreachable; best to drop all unsolicited packets silently,
except for AUTH requests, for which a rejection saves you an annoying
timeout.  Except, I like to monitor the home machine from work, so I accept
pings from the work subnet only.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

