From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Forwarding multiple UDP ports
Date: Fri, 22 Sep 2006 18:22:12 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609221821100.12304@yvahk01.tjqt.qr>
References: <45140C99.8040205@samera.com.py>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45140C99.8040205@samera.com.py>
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
To: "Oliver Schulze L." <oliver@samera.com.py>
Cc: netfilter@lists.netfilter.org

>
> My question is: can I forward UDP trafic from and internal server to the
> Internet?
> Can I use this line:
>
> iptables -t nat -A PREROUTING -p udp -s INTRA_SERVER -d INTRA_ROUTER 
> --dport 1024:6000 -j DNAT --to-destination INET_IP:1024-6000
>
> I'm testing it and I see the rule matched, the byte and packet counters are
> incrementing.
> But, I see no traffic going out of the Internet NIC.
> I'm not sure if the multi-port specification will work.

Who is INET_IP? Is it the same host as INTRA_ROUTER?


Jan Engelhardt
-- 

