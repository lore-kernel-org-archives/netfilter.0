From: John <futurasci@gmail.com>
Subject: Strange ip_conntrack values
Date: Sun, 18 Jul 2004 12:31:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ef83df6b040718033163810a15@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Hi,

When I run the command

grep ^tcp /proc/net/ip_conntrack | awk '{print $4}' | sort | uniq -c

I get these lines ...

    26 CLOSE
    11 CLOSE_WAIT
   883 ESTABLISHED
    57 FIN_WAIT
    34 SYN_RECV
   116 SYN_SENT
 23720 TIME_WAIT

the TIME_WAIT number seems very strange ... network interrupts
increased a lot three months ago and I couldn't find an explanation
for this. The number of our visitors didn't increased like this ...

For example, before this "event", network interrups from MRTG, went
down to nearly 0 at 4 AM, but now even at this hour they are at 1000
....

We are under RH 7.2
2.4.26

I hope you could help me ...

Thanks a lot,

John

