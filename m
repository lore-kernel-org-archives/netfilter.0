From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Gobbling my bandwidth?
Date: Mon, 30 Dec 2002 01:40:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021230014051.5cde1b76.arnt@c2i.net>
References: <5.1.0.14.0.20021229171331.00b09690@mail.zalnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.0.20021229171331.00b09690@mail.zalnet.net>
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

On Sun, 29 Dec 2002 17:13:36 -0700, 
"Jason H. Zalmanowitz" <jason@zalnet.net> wrote in message 
<5.1.0.14.0.20021229171331.00b09690@mail.zalnet.net>:

> Hi all,
> 
> I've scoured the mailing list and can't find anything, so I figure
> I'll start a new topic...
> 
> I'm running a Debian GNU/Linux box for a router / firewall at home. 
> Using a 2.4.19 customed kernel, Pentium MMX, IPTables 1.2.6a, and Narc
> auto-configuration script for IPTables.  I've got the same
> configuration running on a webhosting box, except its running a p4
> 1.5.
> 
> My problem is that intermittently (and only as of lately) has my
> connection been dropping to ~4000ms for a roundtrip... and after 15-20
> minutes it resumes back to its normal ~80ms.  Does anyone know whats
> causing this?
> 
> Logging is off, and afaict the rules are optimized.  When I stop
> IPTables and just try pinging google, my ping time returns to 80...
> but as soon as I fire IPTables up again, it raises the ping time to
> ~4000ms.
> 
> Theres nothing listing in my processes (ps aux or top) that indicate 
> anything related to IPTables or narc... I am absolutely stumped - as
> this has only happened in the past 2 days after 3 months of running
> solid.
> 
> Any and all help is greatly appreciated.

..you mention "Logging is off".  Turn it on and have a look.


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



