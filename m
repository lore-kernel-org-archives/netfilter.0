From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: Gigabit
Date: Tue, 9 Mar 2004 15:45:25 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F3024CCBF5@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

I believe it was an 800MHz or 1200MHz Duron (not sure which I pulled out =
of the stash when I did the testing) with 256MB DDR, and a very minimal =
Debian load. The CPU utilization was all system, load averages were =
beyond 1 but I do not have the figures for this. Other things I do not =
know, I was just testing to see if it securely dropped packets rather =
than passing them if the utilization went too high. I do not remember =
seeing anything odd in the memory section or otherwise at lower =
utilizations. The key to making it drop packets was to get the syn =
traffic going across it, otherwise stateful inspection only has to look =
at the initial packet and then start passing traffic as established. I =
am running an FTP transfer at 80% utilization right now and it is only =
running at 34% CPU.=20

Brian

-----Original Message-----

Thank's.It's interesting.Can I give more exactly infomation about =
harware,
kernel options, more thorough statictics of using by linux CPU, memory , =
I/O
, irq and other ?


----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

