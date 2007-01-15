From: Anil Gunturu <anil@mistletoetech.com>
Subject: Re: tcp conn tracking
Date: Mon, 15 Jan 2007 09:24:41 -0800 (PST)
Message-ID: <33219704.200191168881881760.JavaMail.root@smtp1.mistletoetech.com>
References: <Pine.LNX.4.61.0701151759250.23841@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0701151759250.23841@yvahk01.tjqt.qr>
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
To: netfilter@lists.netfilter.org, Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>

OK. Does the same thing apply to ftp when NAT is involved? If the port command comes fragmented and out-of-order, and the conntrack module doesn't reassemble the packets, the "inside" ip address goes out untranslated. Is this considered a security breach.

Cheers,

-Anil

----- Original Message -----
From: Jan Engelhardt <jengelh@linux01.gwdg.de>
To: Anil Gunturu <anil@mistletoetech.com>
Cc: netfilter@lists.netfilter.org, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Sent: Monday, January 15, 2007 8:59:48 AM GMT-0800 US/Pacific
Subject: Re: tcp conn tracking


>So, ftp connection tracking doesn't work always. Just curious about 
>what is the rationale for such a solution? Is it assumed that if the 
>packet with PORT command is fragmented someone is deliberatly attacking 
>the system?

Yes you can assume that. FTP commands are usually not that long to not 
fit into a small packet.


        -`J'
-- 


