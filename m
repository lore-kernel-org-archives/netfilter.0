From: "Brian French" <bfrench@imageworksstudio.com>
Subject: RE: ever block *outgoing* packets on your firewall?
Date: Fri, 14 Jan 2005 15:16:59 -0500
Message-ID: <KJEGIFLIAAKLNBMJNOIJIEICECAA.bfrench@imageworksstudio.com>
References: <20050114200228.GA21562@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050114200228.GA21562@spawar.navy.mil>
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
To: seberino@spawar.navy.mil, netfilter@lists.netfilter.org

it could be necessary if say ... you want to block programs from calling
home, you can block outgoing to that ip address.

you could also block any outgoing trojan horses, etc.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of
seberino@spawar.navy.mil
Sent: Friday, January 14, 2005 3:02 PM
To: netfilter@lists.netfilter.org
Subject: ever block *outgoing* packets on your firewall?



I'm wondering if it is ever necessary to block
*outgoing* packets at your firewall.

As long as you block /incoming/ carefully no hacker
on the Internet can send spam through a node on
your network or anything nasty like that right?

(I'm wondering for a wifi hotspot if any nastiness
will happen if I don't block outgoing.  I block
virtually all incoming except ssh.)

CS




