From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: destinations interface must be eth0?
Date: Tue, 16 Sep 2003 11:10:41 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309161049310.4397@xena.cft.ca.us>
References: <1063637259.2318.3.camel@dod-secure.e-masi.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063637259.2318.3.camel@dod-secure.e-masi.com>
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
To: Jim Burnett <jburnett@e-masi.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Mon, 15 Sep 2003, Jim Burnett wrote:
> I have found that my destination IP in my rules MUST be bound on eth0
> what is this? I thought I could use any working IP on my internal
> network as the --to-destination IP...??
>
> Example:
> internal machine:
> eth0:192.168.1.55
> eth1:192.168.1.56

Maybe it would help if you could explain what you were trying to accomplish
here.  I wouldn't be surprised if the web server's answers were getting
lost, or subsequent packets in the connection were getting lost, because of
switching to the other interface.

Have you used tcpdump or ethereal or snort to make sure which packets are
vanishing?  Also, when tcpdump puts one of the interfaces into promiscuous
mode, it might start accepting packets for the other interface and your
setup might start working.  That would be an important clue (but definitely
not the way to run a production server).

To save a round of back-and forth, let me make a guess...  You have two
independent web sites and each is assigned a different IP address.
Perhaps you even have two independent instances of Apache, each listening
to its own interface.  This is kind of overkill.  If I were setting it up,
I would have DNS CNAMEs mapping both alphabetic names to the same IP
address, and just one interface on the box, and just one instance of
Apache.  Then I would set up a virtual host for each client site (the main
instance would be just for administration).  Apache distinguishes the sites
by the name in the URL, not the IP address.  This is the preferred method
for commercial web hosting companies.  I use it for my HTTPS service.

Hope this helps!

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

