From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Connlimit problem k2.6.18.2 , ipt1.3.7
Date: Mon, 12 Mar 2007 00:27:12 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703120026370.18623@yvahk01.tjqt.qr>
References: <00fd01c76274$a089c3e0$3464000a@oksystem.local>
	<45F4390F.5050106@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45F4390F.5050106@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org


On Mar 11 2007 18:14, Pascal Hambourg wrote:
>> I can't add connlimit rule? What's wrong? Any suggestion?
>> 
>> -----------------------------------------
>> iptables -m connlimit -h
>> connlimit v1.3.7 options:
>> [!] --connlimit-above n         match if the number of existing tcp
>> connections is (not) above n
>> --connlimit-mask n             group hosts using mask
>> 
>> -----------------------------------------
>> RouterBM:/home/kopecek# iptables -A FORWARD -p tcp -s 10.88.99.71 -m
>> connlimit --connlimit-above 300 --connlimit-mask 32  -j REJECT
>> --reject-with
>> tcp-reset
>> iptables: No chain/target/match by that name
>
> Your kernel probably does not support the connlimit match. The connlimit match
> is not part of the standard kernel. It used to be included as a kernel patch in
> the patch-o-matic-ng, but has been removed from the daily snapshots since
> 2006/07/26.

connlimit is still there (not in pomng though), it's out-of-out-off-tree,
so to say. You have to patch pomng, and then patch the kernel *whirl* ...


Jan
-- 

