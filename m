From: Stephen Smoogen <smoogen@lanl.gov>
Subject: Re: Blocking Kazaa
Date: Sat, 23 Aug 2003 18:01:47 -0600 (MDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308231758360.27327-100000@cic-mail.lanl.gov>
References: <20030822183848.21628.qmail@web40206.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030822183848.21628.qmail@web40206.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: Jean-Rene Cormier <jean-rene.cormier@cipanb.ca>, netfilter@lists.netfilter.org


Kazzaa uses 1214 for only certain traffic (talking to its supernodes).  
We found that blocking 1214 was insufficient for stopping people from
using Kazzaa as it uses a bunch of dynamic ports and searches of DNS
ranges. [Blocking the DNS ranges seems to be futile as they seem to have
changed several times.] The only thing I have heard that might be useful
is to combine snort with iptables in that snort figures out who inside
your network is using Kazzaa and then you block that IP address via 
iptables. Now how you get the two to work together? That is the 64k 
questions :(


On Fri, 22 Aug 2003, SBlaze wrote:

>http://www.securitymetrics.com/portscan.adp
>
>Above is an online port scanner. It scans for Kazzaa openings(among other
>things). It seems to think that Kazzaa is open always on 1214. As I said before
>I am not sure as I do not use Kazzaa. If you find anything out about this I
>will gladly write up something on my web site to show other users how to block
>Kazzaa as it seems to come up alot.
>
>Thanks
>SBlaze
>

-- 
Stephen John Smoogen            smoogen@lanl.gov
Los Alamos National Labrador  CCN-5 Sched 5/40  PH: 5-8058
Ta-03 SM-261  MailStop P208 DP 17U  Los Alamos, NM 87545
-- So shines a good deed in a weary world. = Willy Wonka --


