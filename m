From: "Brian French" <bfrench@imageworksstudio.com>
Subject: using iptables to share itunes 4.7 from home to work
Date: Mon, 22 Nov 2004 17:58:32 -0500
Message-ID: <005901c4d0e6$ceadd210$fa00a8c0@developer>
Mime-Version: 1.0
Content-Type: multipart/related;
	boundary="----=_NextPart_000_005A_01C4D0BC.E5D7CA10"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_005A_01C4D0BC.E5D7CA10
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

I have Itunes 4.7 running with all of my music at home.

I would like to be able to listen to that music on my itunes 4.7 here at
my office.

I know that itunes 4.7 no longer allowes you to share over the internet.

 

My home and office network basically have a static ip address. 

Both are natted with private subnets behind the routers 

 

As far as I understand it, when itunes is running, it scans your local
subnet for any other itunes that have sharing enabled.

It there any way, using iptables, to trick my office computer to think
that my office router is actually my home computer on the port that
itunes uses (3689) and do the same for my home? If so, what are the
iptables commands to do so?

 

Thank for your help!

 

 <http://www.imageworksstudio.com/> 

    Brian French

         Technical Director

 


------=_NextPart_000_005A_01C4D0BC.E5D7CA10--



