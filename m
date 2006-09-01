From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Filter ips
Date: Fri, 1 Sep 2006 09:35:24 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609010934470.25521@yvahk01.tjqt.qr>
References: <4298.200.87.170.170.1157063657.squirrel@admin.ucbcba.edu.bo>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4298.200.87.170.170.1157063657.squirrel@admin.ucbcba.edu.bo>
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
To: nunezj@ucbcba.edu.bo
Cc: netfilter@lists.netfilter.org

>Hi everyone
>
>       I have some problems when I want to filter some ips in  my network
>
> I put this rules in the my script:
>
> iptables -A INPUT -s 192.168.0.5/32 -d 0/0 -p tcp --dport 20,21 -j DROP
>
> but it doesn't work.

It may have been accepted before.

> The same I put in the Output rules but it doen't
>work....

Note that you probably need to turn -s into -d and vice versa when 
changing INPUT to OUTPUT, too.

Jan Engelhardt
-- 

