From: Brian Capouch <brianc@palaver.net>
Subject: H.323 Modules and 2.4.20?
Date: Fri, 20 Dec 2002 21:52:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E03D76D.3090805@palaver.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am trying to use ohphone on a machine with public IP to talk to a 
pstngw instance running on my network at home, which uses a NAT'ted 
firewall.

I patch-o-matic'ed the H.323 conntrack and nat modules, and load them 
up, but the result is identical to what I get without them: the port 
1720 TCP call setup traffic goes just fine, but then the resulting RTP 
stream is one-way only, from the public network in to my client.

I have googled myself silly and find references hither and yon to the 
code being broken, my needing to mark packets to use it, to use 
different modules because of NEWNAT kernel code, etc., etc., but so far 
nothing that looks like it's going to help me.

Is there somewhere I can go find out about all of this, definitively?

Thanks in advance.

B.


