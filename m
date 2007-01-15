From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: tcp conn tracking
Date: Mon, 15 Jan 2007 17:59:48 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701151759250.23841@yvahk01.tjqt.qr>
References: <25296252.199981168880240692.JavaMail.root@smtp1.mistletoetech.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <25296252.199981168880240692.JavaMail.root@smtp1.mistletoetech.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anil Gunturu <anil@mistletoetech.com>
Cc: netfilter@lists.netfilter.org, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>


>So, ftp connection tracking doesn't work always. Just curious about 
>what is the rationale for such a solution? Is it assumed that if the 
>packet with PORT command is fragmented someone is deliberatly attacking 
>the system?

Yes you can assume that. FTP commands are usually not that long to not 
fit into a small packet.


	-`J'
-- 

