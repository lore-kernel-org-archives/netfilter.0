From: "Markus Zeilinger" <mz@sea.uni-linz.ac.at>
Subject: FW: ip_send() function
Date: Thu, 13 May 2004 17:06:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ASERV1xGGmNN79xavjr000003f7@aserv1.sea.uni-linz.ac.at>
Reply-To: <mz@sea.uni-linz.ac.at>
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
To: netfilter <netfilter@lists.netfilter.org>

Hello all,

thx for the answers right now. I am very sorry, I obviously made a mistake.
ip_send() is included in the 2.4.x Kernel (according to the
Cross-Referencing Linux project).

Kernel 2.4.26:	http://lxr.linux.no/ident?v=2.4.26;i=ip_send

But, again according to lxr, it is NOT USED in Kernel 2.6.x
(http://lxr.linux.no/ident?v=2.6.5;i=ip_send). Did some research this
afternoon and found the following. Obviously ip_send was replaced by
dst_output() in the 2.5.45 Kernel.

ChangeLog-2.5.45:
...
<kuznet@ms2.inr.ac.ru>
	[IPV4]: Kill ip_send, use dst_output instead.
...

You find more information about dst_output at
http://lxr.linux.no/ident?v=2.6.0;i=dst_output

So if you are interested in more informations use the link above!
Thx a lot guys for your answers!

Cheers,
Markus

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Markus Zeilinger
Sent: Donnerstag, 13. Mai 2004 13:56
To: netfilter
Subject: ip_send() function

Dear all,

I am currently writing a paper for my studies about netfilter and Linux
Firewalling. In this case I also write a chapter about packet handling
through the Linux network stack.
Several papers and also in Harald Welte's "The journey of a packet through
the linux 2.4 network stack" mention a function ip_send() in the process of
packet forwarding. According to Harald this function is defined in
/include/net/ip.h. But I cannot find a definition there, and surprisingly I
was not able to find the ip_send() function anywhere in the kernel source. I
searched through Kernel 2.6.6, 2.4.6 and 2.4.0 but did not find any tracks
of a ip_send() function!?!

Can you help me with this problem? Sorry if this is a stupid question, but I
am a newbie in Linux networking. ;-)

Thx a lot for your assistence!

best regards,
Markus

------------------------------------------------
Markus Zeilinger
Institute for Systems Engineering and Automation University of Linz
Altenberger Strasse 69 A-4040 Linz, AUSTRIA

Tel.: +43-(0)732-2468-8869
Fax:  +43-(0)732-2468-8878
Mail: mz@sea.uni-linz.ac.at 



