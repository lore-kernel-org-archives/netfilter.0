From: "Oleg A. Arkhangelsky" <sysoleg@progtech.ru>
Subject: Re: remove duplicate rules
Date: Sat, 26 Nov 2005 15:55:08 +0300
Message-ID: <686184511.20051126155508@progtech.ru>
References: <6.2.1.2.0.20051126180857.0336a1b0@147.202.41.46>
Reply-To: "Oleg A. Arkhangelsky" <sysoleg@progtech.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.2.1.2.0.20051126180857.0336a1b0@147.202.41.46>
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

Hello amit,

Saturday, November 26, 2005, 3:39:14 PM, you wrote:

ap> same iptables.  I want to stop this , if the same rule exists the iptables
ap> should give some error or should add the same rule again .
ap> Please help me .

    I think you should manually check the existence of possible
    duplicate before adding rule. Also you can do somethig like:

    iptables -D INPUT -d 192.168.0.2/32 -i eth1 -j DROP
    iptables -A INPUT -d 192.168.0.2/32 -i eth1 -j DROP

    Then you will never get duplicates.
    But the first way is more correct.

-- 
Best regards,
 Oleg


