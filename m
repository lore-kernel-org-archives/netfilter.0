From: "Vidhya  A" <a_vidhya21@rediffmail.com>
Subject: H323 Connection Tracking Problem
Date: 10 Nov 2002 16:29:43 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021110162943.12307.qmail@webmail16.rediffmail.com>
Reply-To: "Vidhya  A" <a_vidhya21@rediffmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain;
	format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I am new to this list and am facing a problem in the H323 
connection tracking.I have been working on the H323 Connection 
tracking and NAT modules for the past few days.
  I applied the Newnat and H323 Patch using the instructions given 
in the page :-
"http://roeder.goe.net/~koepi/newnat.html".
  My setup is as follows :-
   VOIP(Private)----LINUX (with patch)----VOIP(Public)
  I have one DNAT rule and a Masquerading rule setup.

  I establish one connection and RTP packets are transmitted 
properly. After I disconnect, if I try to dial immediately (from 
anyside,WAN or LAN), the connection tracking associates this call 
to the previous connection tracking and the source signal address 
inside the packet is not NATTED properly. So the WAN sends its RTP 
Packets to the Private address of the VOIP instead of the 
Gateway's WAN Address.
  After a duration of one minute, I am able to connect properly.
  How to destroy the expectation connection tracking on release 
 from only one side.
Any Hints ???
Thanx in advance for your help.

Regards,
Vidhya


