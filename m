From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Unwanted Uploading.
Date: Sat, 06 Sep 2003 12:39:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5A0DAD.7020901@chrisbrenton.org>
References: <20030906153148.58336.qmail@web20705.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

ads nat wrote:
>
> When talked with users user says their is no extar ordinary 
> increase in uploading or downloading. My ISP say there must be  some
> virus/worm in the network.

Sounds like you are one of the sites flooding people with icmp :(

Try this:
tcpdump -v -nn icmp

Look at the source IP's of the echo-request packets and fix your systems.

If that does not help, try a tool like ntop or iptraf which will tell 
you who is generating all the traffic.

HTH,
C




