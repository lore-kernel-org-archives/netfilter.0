From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: h.323 compatibility
Date: Wed, 19 Nov 2003 13:33:03 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0311191323010.5969-100000@blackhole.kfki.hu>
References: <1069207964.9755.86.camel@fred.williams.etc>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069207964.9755.86.camel@fred.williams.etc>
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
To: Marc Williams <marcw@onlymooo.com>
Cc: netfilter list <netfilter@lists.netfilter.org>

Hi Marc,

On Tue, 18 Nov 2003, Marc Williams wrote:

> Jozsef, I've read a couple of your posts on this list that seem to
> indicate that there is a known incompatibility between your h323
> conntrack module and the openh323 libraries.

Yes. The h323 conntrack/nat modules work due to sheer luck on how IP
addresses/ports are encoded in H.225/H.245 messages.

> Is this accurate?  If so, are there any plans to address this
> incompatibility?

There are plans to implement the modules properly next year.

> I've been unable to get the GNU gatekeeper functioning
> correctly behind an iptables firewall for possibly this reason.

If you have got a gatkeeper up and running, then simply throw away the
h323 conntrack/nat helpers, set up the proxy functionality in GNU
gatekeeper and rely on that.

> Btw, I tried emailing you about this but it was bounced saying that your
> MTA rejected my email saying my site was banned because of unsolicited
> email.  I can assure you that there has never been one single spam
> emanating from my site ever.  And if you're banning my ISP - Comcast -
> you've just banned the majority of broadband users in the US.

Yes, comcast.net is on the blacklist of our site. After the next
mail gateway upgrade we'll have the ability to setup personal blacklist
and I'll put aol.com, yahoo.com etc. onto my list. Sorry.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


