From: Toby <tobia.conforto@linux.it>
Subject: Re: iptables / FTP masquerading: Port command illega
Date: Wed, 23 Mar 2005 18:09:50 +0100
Message-ID: <20050323170950.GC25754@ikkoku.ath.cx>
References: <1111590778.4241877a4e631@webmail.telus.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1111590778.4241877a4e631@webmail.telus.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

amateurguy@telus.net wrote:
> When i look at the packets, I see the client sending a Port cmd using
> its non-routable IP. This then passes through a firewall, and the
> source IP gets translated to a public IP.

The source IP does, but probably the IP inside the PORT command doesn't.
You need to load ip_nat_ftp in THAT firewall and tell it to monitor port
29 (you do that in the "modprobe ip_nat_ftp" commandline.)

Either that, or more simply configure the client ftp software and tell
it what its real ip address is.

I don't know if you can do anything on the server side.


As for that other problem (port 21 working differently than port 29) I
don't know, it could be anything.


Cheers
Toby

