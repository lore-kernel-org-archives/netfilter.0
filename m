From: "HareRam" <hareram@sol.net.in>
Subject: Re: Yahoo Messenger
Date: Sun, 6 Oct 2002 16:55:44 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005d01c26d2b$30012d40$7cfcc5cb@humanpc>
References: <20021006085222.69643.qmail@web40011.mail.yahoo.com> <20021006091131.LDNX459.mta02-svc.ntlworld.com@there>
Reply-To: "HareRam" <hareram@sol.net.in>
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
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Netfilter <netfilter@lists.netfilter.org>

Hi all

i have developped some front end to user to login and log out
using Visual c++ and i want to count how many minutes he is online
and how many minutes he has reamaining.
all the things are working fine....

all users have static IP and ARP table is binded to specific user PC MAC
when the user looged in, iam replacing the  FORWARD rules with  ACCEPT
when he logged out iam replacing the same FORWARD Rules wiht DROP

the problems after this is.

1. after Dropping the Forward Rules, still he able to browse the existing
site which he is browsing
    but he is not getting any new sites, so i feel he is able to get the
existing connection data.
2. when he connect to Yahoo Messenger, he is not disconnecting, his
connection is continueing

what iam looking is, i want to drop all his rules when he logged out, so he
will not get any browsing nor he should able to loggin any chat Servers


any more help will be appriciated
thanks in advance

hare


