From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 20:56:17 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095990977.41537ec1b14b5@webmail2>
References: <415290B1.5030401@imag.fr> <4152DADF.4090802@pbl.ca>
	<1095976931.5171.12.camel@mistified.sf.bgservice.lab>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095976931.5171.12.camel@mistified.sf.bgservice.lab>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Quoting Dimitar Katerinski <train@bofh.bg>
Date: Fri, 24 Sep 2004 01:02:11

> Sorry, a little bit off topic, but I allways go red about such kind of crappy
> rules:
> 
> > Use DNAT target.  In short what you need to do is:
> > 
> >    iptables -A FORWARD -m state --state NEW -j ACCEPT
> 
> Do you know what you just did? You've just allowed any kind of
> connections, protocols to any port and from/to any destionation. Cute,
> isn't it?

The above was an obvious typo that I made.  It should have read ESTABLISHED, not
NEW, of course.  It kinda suprised me that it took so long before anybody noticed.

As for using only --state NEW in my other rules vs specifying tcp flags, there
were some discussions before on the list about it.  For most part it will just
prevent nmap and similar programs to do some types of tests used to remotely
determine OS type.  Personally, I do use tcp-flags option in combination with
--state NEW.  And what I sometimes type when giving examples (mostly not, becase
of pure laziness on my part) is that they are examples and that reader should
add additional flags to make it more tight.

> P.S. Why I go red? Because there're thousands of people who use it, and
> they learned it from someone like you.

Maybe yes, maybe no.  The bottom line is that probability of somebody getting
burned by not using tcp-flags (or simply syn) option is quite low.  But if
that's going to make you so much happier person, I can start typing mile long
examples instead of giving hints.  I could bet that out of those thousands,
there will be at least 99% that will fail to realize that 2.6 series of kernels
is extremely trigger happy to load ipv6 module (which will automatically assign
link local IPv6 addresses to all Ethernet interfaces), and that is much more
serious problem than omiting --syn or whatever...

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7



