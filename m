From: prabha <prabha@multitech.co.in>
Subject: Subject: Problem with SNAT and same port number
Date: Mon, 23 Feb 2004 11:40:00 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40399938.AE4CE1DD@multitech.co.in>
References: <20040223052721.8508.52386.Mailman@netfilter-sponsored-by.noris.net>
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

Hi

>I am wanting to change the source address of outgoing packets that have a src
>port of 53.
> I have tried /sbin/iptables -A POSTROUTING -p tcp -t nat -o bond0 --sport 53
>-j SNAT --to-source 192.168.0.1:53

If my understanding is correct, you want to do SNAT but without changing the
source port number. The above command should work.
Can you check out if your DNS requests are on TCP or UDP? If they are on UDP,
you may need to extend the above rule for UDP also.

Regards
Prabha


