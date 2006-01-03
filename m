From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: ICMP types to allow
Date: Tue, 3 Jan 2006 08:33:24 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0601030830400.23554@yvahk01.tjqt.qr>
References: <FAC4E024BF776842876169173CE2F01313B710@mailbox.vikus.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B710@mailbox.vikus.com>
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
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org


>I'd like to hear from the list what ICMP types firewall admins are
>allowing and why - what are the risks for allowing certain types vs. the
>risks of NOT allowing them?

Well, I don't allow something, I block certain types so I can be sure that 
nothing is implicitly hindered:

    for j in redirect router-advertisement router-solicitation 30; do
        ipt -A INPUT -j DROP -p icmp --icmp-type "$j";
    done;

30 = UDP-traceroute, but iptables does not have a mnemonic name for it.




Jan Engelhardt
-- 

