From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: efficient source address filtering and logging?
Date: 28 Oct 2003 11:26:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067358369.1700.11.camel@valhalla>
References: <Pine.LNX.4.44.0310280949080.22878-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310280949080.22878-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Tue, 2003-10-28 at 09:59, Robert P. J. Day wrote:
>   i'd like to find a short, efficient way to filter incoming packets with
> bogus source addresses, but i don't see an elegant way of doing it.

Here is what I do in my script to specify my rules:

while read SPOOFED ; do
iptables -A FORWARD -s $SPOOFED -j LOG --log-prefix " SPOOFING "
iptables -A FORWARD -s $SPOOFED -j DROP
done < spoofed_ips.txt

Now you just create a text file called 'spoofed_ips.txt' and add all the
IPs you want to filter, one per line. Use CIDR format to specify
subnets. So your file may look like this:

10.0.0.0/8
192.168.0.0/16
127.0.0.0/8

The only thing you can't specify this way is your internal address space
because the above rules does not tie things to a specific interface
(like external). The reason I do that is so I can catch internal
spoofing as well. Just do a separate spoofing rule for your internal
address space and life will be cool.

This also works well for blocking spammers, known hostile IPs,
countries, etc.

HTH,
C



