From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: non-standard FTP ports and connection tracking (redux)
Date: Thu, 12 Dec 2002 10:16:00 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0212121010440.14108-100000@blackhole.kfki.hu>
References: <200212101118.53239.apapadop@cmu.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212101118.53239.apapadop@cmu.edu>
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
To: Alexandros Papadopoulos <apapadop@cmu.edu>
Cc: netfilter@lists.netfilter.org

On Tue, 10 Dec 2002, Alexandros Papadopoulos wrote:

> The default behavior is DROP for all chains, so if these ones don't
> allow it, then it is blocked. I thought these ones were sufficient. I'm
> attaching the complete ruleset I'm using.

Your ruleset seems to be all right. At some places strange, but seems to
be OK.

> > I'd setup logging rules to see where and why the connection gets
> > blocked.
>
> I've monitored the packets with Ethereal and seen that the problem is
> the one mentioned -- the SYN packet from the client that tries to open
> the data connection (when in passive mode) never makes it through the
> firewall.
>
> The question is, why doesn't connection tracking pick this up and allow
> the packet to go through? (since it's a RELATED connection to a
> preexisting FTP session)

I can repeat only myself: I'd setup logging rules to see where and why the
connection gets blocked.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


