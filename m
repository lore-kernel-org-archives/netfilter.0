From: William Stearns <wstearns@pobox.com>
Subject: Re: Need urgent help on NAT/load sharing
Date: Thu, 5 Feb 2004 22:36:18 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0402052234430.28123-100000@sparrow>
References: <003701c3ec0c$f8cc09f0$6329d9d5@Zamani>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003701c3ec0c$f8cc09f0$6329d9d5@Zamani>
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
To: Saeed Zamani <szamani@concept.ae>
Cc: ML-netfilter <netfilter@lists.netfilter.org>, William Stearns <wstearns@pobox.com>

Good morning, Saeed,

On Thu, 5 Feb 2004, Saeed Zamani wrote:

>    I am new to list and have a basic nat question on Redhat Linux 9. I
> have to translate my local IP ( 192.168.1.0/24 ) to two different public
> IP given by two different ISP ( IPE1 & IPE2 ) at a specified rate. For
> example for every 4 received packet, one have to translate to IPE1 and
> other three to IPE2. I need this for load balacing the internet traffic
> between two isp. At the end, it is excellent if there is an option that
> If one the ISP gateway is dead, all packets have to translate to other
> public IP. Please help me. 

	I don't know the answer off the top of my head, but you might want 
to take a look at the Linux Advanced Routing and Traffic Control HOWTO at 
http://www.lartc.org/ .
	Cheers,
	- Bill

---------------------------------------------------------------------------
	"All programs evolve until they can send email."
-- Richard Letts
	"Except Microsoft Exchange."
-- Art
	(found on the Snort web site)
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
--------------------------------------------------------------------------


