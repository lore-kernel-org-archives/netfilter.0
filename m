From: Jim Burnett <r000t@adelphia.net>
Subject: Re: destinations interface must be eth0?
Date: Wed, 17 Sep 2003 09:05:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063807514.25120.0.camel@dod-secure.e-masi.com>
References: <1063637259.2318.3.camel@dod-secure.e-masi.com>
	 <Pine.LNX.4.53.0309161049310.4397@xena.cft.ca.us>
	 <20030917113043.GL3850@propaganda.localdomain>
Reply-To: r000t@adelphia.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030917113043.GL3850@propaganda.localdomain>
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
To: kluivert@tm.net.my
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I have Virtual hosting so I dont need more then 1 ip. Its fixed now.

THanks


On Wed, 2003-09-17 at 06:30, Julian Gomez wrote:
> On Tue, Sep 16, 2003 at 11:10:41AM -0700, Jim Carter spoke thusly:
> >On Mon, 15 Sep 2003, Jim Burnett wrote:
> 
> (snip)
> 
> >To save a round of back-and forth, let me make a guess...  You have two
> >independent web sites and each is assigned a different IP address.
> >Perhaps you even have two independent instances of Apache, each listening
> >to its own interface.  This is kind of overkill.  If I were setting it up,
> >I would have DNS CNAMEs mapping both alphabetic names to the same IP
> >address, and just one interface on the box, and just one instance of
> >Apache.  Then I would set up a virtual host for each client site (the main
> >instance would be just for administration).  Apache distinguishes the sites
> >by the name in the URL, not the IP address.  This is the preferred method
> >for commercial web hosting companies.  I use it for my HTTPS service.
> 
> Your setup of 1 IP hosting multiple websites will work if its only dealing
> with HTTP. With HTTPS - you have to split the IP or port numbers, because
> the SSL tunnel gets established prior to parsing of the HTTP/1.1 Host:
> header. You could still do it, but you'd get bogus certs for different
> FQDNs which might not look nice if you are a e-commerce site.
> 


