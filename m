From: Jason <baker@cyborgworkshop.com>
Subject: chance to impress the suits
Date: Wed, 26 Feb 2003 17:57:58 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.50.0302261757350.18770-100000@alfred.home.cyborgworkshop.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter List <netfilter@lists.netfilter.org>

Hello,  I have been given a task that I think netfilter is ideal for, but
need a little help.  I need to be able to limit the number of connections
going through a router running netfilter to a max of 500. When I hit 500,
I want to reject any new connections. I know that the iplimit match does
this, but I don't seem to be having any luck getting it to work.  Here is
the scenario..

----                ----                ----
=A =  -> Port 80 -> +NF+  -> Port 80 -> =C =
----                ----                ----

Simple enough.  NF is my netfilter router, A is source, C is destination.
C is an application that when it gets overworked, pretty much tarpits
connecting clients and never lets go.  I have tried many permutations of

iptables -A FORWARD -p tcp -i lan -m state --state NEW -m iplimit
--iplimit-above 1 -j REJECT

with out much luck.  Does anyone have any idea on how to make iplimit in a
router situation work?  Should I apply this to the output chain?

--
Jason Baker
baker@cyborgworkshop.com
www.cyborgworkshop.com

