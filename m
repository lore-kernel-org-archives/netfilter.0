From: Joris <joriske@gmail.com>
Subject: Re: clampmss only partially working on 2.6 kernelmode pppoe?
Date: Sun, 13 Feb 2005 08:25:26 +0100
Message-ID: <afcf62020502122325604a89c5@mail.gmail.com>
References: <afcf620205021122413dd5dd6d@mail.gmail.com>
	<1108217321.4462.34.camel@hubcap.ljm.dom>
	<1108217691.4462.37.camel@hubcap.ljm.dom>
Reply-To: Joris <joriske@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108217691.4462.37.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Sat, 12 Feb 2005 09:14:51 -0500, Jason Opperisano <opie@817west.com> wrote:
> On Sat, 2005-02-12 at 09:08, Jason Opperisano wrote:

> keep in mind that "--clamp-mss-to-pmtu" relies on the fact that PMTU
> discovery works along the path of your communication--this is not always
> a valid assumption these days.

Hmmmkay, but then why does it also not work when I manually set the
mss, even to silly low settings like 500?
iptables -I FORWARD -o ppp0 -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
--set-mss 1300

Perhaps I'm looking in a totally wrong direction to find the cause?
When I reduce the mtu of the masqueraded host (on the local network)
to the mtu of the ppp connection, all problems disappear. (and no,
that's no real solution ;)


>   tcpdump -n -nn -p -i $EXTIF \
>     'icmp[icmptype] = icmp-unreach and icmp[icmpcode] = 4'

This does not match a single packet while testing the login.
I've done a tcpdump (-s0 -w), it's available at http://et.yi.org/hotmail.dump
Ethereal claims "unassembled packet" serveral times, but that may or
may not have anything to do with this problem, it doesn't seem
uncommon with ssl data.



Friendly greetings,
Joris

