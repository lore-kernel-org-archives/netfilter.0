From: Jason Opperisano <opie@817west.com>
Subject: Re: Need help with basic understanding of IPtables
Date: Mon, 25 Oct 2004 15:38:00 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041025193800.GA24645@bender.817west.com>
References: <s17d10cf.018@hpsk12.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <s17d10cf.018@hpsk12.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Oct 25, 2004 at 02:41:41PM -0400, Bob Von Ilten wrote:
> I have just installed IPtables and have been reading as many FAQs as I
> can stand, (which come to think of it may be part of my problem :-) ) at
> any rate I have come to a basic understanding that the INPUT and OUTPUT
> chains of the filter table refer to the following.  Please correct me if
> I am wrong.  The INPUT chain refers to packets that are entering the
> TCP/IP protocol stack from any interface not just the NIC or NICs
> connected to the internet.  The OUTPUT chain refers to packets that are
> leaving the stack for some destination either on the internet or on the
> LAN.  The NAT table is used for any packets that are in transition
> between INPUT and OUTPUT.

no--not even close.

INPUT is for packets whose DESTINATION is a local IP address on this
machine

OUTPUT is for packets whose SOURCE is a local IP address on this machine

FORWARD is for packets whose SOURCE and DESTINATION are not a local
IP address on this machine

those three chains are the built-in chains of the FILTER table.

in addition to the FILTER table, you also have the NAT and MANGLE
tables.

while there is nothing stopping you from performing filtering in the NAT
or MANGLE tables, the targets that perform NAT and MANGLING are only
valid in those respective tables.  for example, the MASQUERADE target is
only valid in the POSTROUTING chain of the NAT table.

have you been reading:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

specifically:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TRAVERSINGOFTABLES

-j

-- 
Jason Opperisano <opie@817west.com>

