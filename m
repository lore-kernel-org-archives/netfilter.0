From: Steve Comfort <steve@4Dllc.com>
Subject: Don't understand these errors with logdrop target
Date: Wed, 25 Aug 2004 10:36:30 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <412C4F8E.8010600@4Dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Hi All,

Below is a snippet from my setup script :

        echo 1

        $IPTABLES -N LOGDROP
        $IPTABLES -A LOGDROP -j LOG --log-level debug
        $IPTABLES -A LOGDROP -j DROP

        echo 2

        $IPTABLES -P INPUT LOGDROP
       
        echo 3
       
        $IPTABLES -P OUTPUT LOGDROP
       
        echo 4
       
        $IPTABLES -P FORWARD LOGDROP

        echo 5

When this is run, I see the output below (the echo's are just to zone in 
on the exact rule(s) generating errors):

1
2
iptables: Bad policy name
3
iptables: Bad policy name
4
iptables: Bad policy name
5

The question is : Why does using LOGDROP as a policy cause these errors?

(I have CONFIG_IP_NF_TARGET_LOG set BTW).

Best regards
Steve Comfort


