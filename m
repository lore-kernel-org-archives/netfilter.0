From: Abdul-Wahid Paterson <abdulwahid@gmail.com>
Subject: Re: net2phone and yahoo
Date: Wed, 8 Sep 2004 10:58:22 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <995fcdb0040908025868666174@mail.gmail.com>
References: <995fcdb00409080236470352d9@mail.gmail.com>
	<a0f69e5040908024474f64d0a@mail.gmail.com>
Reply-To: Abdul-Wahid Paterson <abdulwahid@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5040908024474f64d0a@mail.gmail.com>
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
To: Askar <askarali@gmail.com>
Cc: Netfilter List <netfilter@lists.netfilter.org>

Hi, thanks for the reply...


> ## Allow yahoo ports yahoo games:11999
> $iptables -A FORWARD -o ppp0 -p tcp -m multiport --dport
> 5000,5001,5100,5050,11999 -m state --state NEW -j ACCEPT

Is 11999 for games? I don't want to allow games access.
 
> The other UDP
> port does normally not need to be specified. Net2Phone uses anything
> in the range 1 - 30000. However, when Net2Phone is running on a
> machine behind NAT32, the actual port number used must be known.

Didn't quite understand this bit. Why would the second UDP port not
need to be specified as by default I am dropping all UPD.  Unless
there is a connection tracking module that knows about this voice chat
and can work out that it is a RELATED connection.

Also,  the work stations are NAT'd and have private addresses. They
want to be able to make and recv. voice chats. Does that mean I have
to open all UDP ports from 1-30000 for the workstations needing voice
chat?

Abdul-Wahid

