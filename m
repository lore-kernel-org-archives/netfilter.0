From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[2]: efficient source address filtering and logging?
Date: Sun, 2 Nov 2003 12:29:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <191594195858.20031102122904@lf.lv>
References: <Pine.LNX.4.44.0310280949080.22878-100000@localhost.localdomain>
 <1067358369.1700.11.camel@valhalla>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067358369.1700.11.camel@valhalla>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

Hello Chris,

Tuesday, October 28, 2003, 6:26:10 PM, you wrote:

CB> On Tue, 2003-10-28 at 09:59, Robert P. J. Day wrote:
>>   i'd like to find a short, efficient way to filter incoming packets with
>> bogus source addresses, but i don't see an elegant way of doing it.

CB> Here is what I do in my script to specify my rules:

CB> while read SPOOFED ; do
CB> iptables -A FORWARD -s $SPOOFED -j LOG --log-prefix " SPOOFING "
CB> iptables -A FORWARD -s $SPOOFED -j DROP
CB> done < spoofed_ips.txt

This is wrong, to log/drop a single ip 2 lookups on the src addr have to be
performed.
Instead a single chain should be created which all the spoofed packets
would jump. The single chain logs and drops.

i=iptables
$i -N LOG_DROP
$i -A LOG_DROP -j LOG --log-prefix " SPOOFING "
$i -A LOG_DROP -j DROP

while read SPOOFED;
  do
    $i -A FORWARD --src $SPOOFED -j LOG_DROP
done < spoofed_ips.txt


P.Krumins


