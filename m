From: aksingh@hss.hns.com
Subject: Re: ip_send() function
Date: Thu, 13 May 2004 18:02:54 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF152D4F6F.AC7F8F49-ON65256E93.0044A3E2@hss.hns.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mz@sea.uni-linz.ac.at
Cc: netfilter <netfilter@lists.netfilter.org>





Hi Markus,

  Maybe you didnt look properly, you can find ip_send() at the given path
/usr/src/linux.x.x/include/net/ip.h
Its defined there as a static inline function returning int.

HTH
Amit




"Markus Zeilinger" <mz@sea.uni-linz.ac.at>@lists.netfilter.org on
05/13/2004 05:26:03 PM

Please respond to <mz@sea.uni-linz.ac.at>

Sent by:    netfilter-admin@lists.netfilter.org


To:    "netfilter" <netfilter@lists.netfilter.org>
cc:

Subject:    ip_send() function


Dear all,

I am currently writing a paper for my studies about netfilter and Linux
Firewalling. In this case I also write a chapter about packet handling
through the Linux network stack.
Several papers and also in Harald Welte's "The journey of a packet through
the linux 2.4 network stack" mention a function ip_send() in the process of
packet forwarding. According to Harald this function is defined in
/include/net/ip.h. But I cannot find a definition there, and surprisingly I
was not able to find the ip_send() function anywhere in the kernel source.
I
searched through Kernel 2.6.6, 2.4.6 and 2.4.0 but did not find any tracks
of a ip_send() function!?!

Can you help me with this problem? Sorry if this is a stupid question, but
I
am a newbie in Linux networking. ;-)

Thx a lot for your assistence!

best regards,
Markus

------------------------------------------------
Markus Zeilinger
Institute for Systems Engineering and Automation
University of Linz
Altenberger Strasse 69
A-4040 Linz, AUSTRIA

Tel.: +43-(0)732-2468-8869
Fax:  +43-(0)732-2468-8878
Mail: mz@sea.uni-linz.ac.at





