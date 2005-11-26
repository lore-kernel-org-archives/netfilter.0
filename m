From: "Oleg A. Arkhangelsky" <sysoleg@progtech.ru>
Subject: Re[2]: Port DNATting
Date: Sat, 26 Nov 2005 13:28:52 +0300
Message-ID: <1882785208.20051126132852@progtech.ru>
References: <814141710.20051126124425@progtech.ru> <438836D9.5050204@gmail.com>
Reply-To: "Oleg A. Arkhangelsky" <sysoleg@progtech.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <438836D9.5050204@gmail.com>
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
To: netfilter@lists.netfilter.org

Hello Georgi,

Saturday, November 26, 2005, 1:20:09 PM, you wrote:

GA> If you want to do that you should read the
GA> iptables-tutorial.frozentux.net, then use the REDIRECT target:
GA> iptables -t nat -A PREROUTING -p tcp --dport 8080 -j REDIRECT --to 80

    Thank you very much! My error was that I use POSTROUTING instead
    of PREROUTING with DNAT.

-- 
Best regards,
 Oleg


