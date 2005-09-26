From: David Leangen <dleangen@canada.com>
Subject: Confirm: letting certain packages pass through un-natted
Date: Mon, 26 Sep 2005 16:37:10 +0900
Message-ID: <4337A526.3@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


Hello!

Could somebody please confirm whether or not I'm doing this right?

I am using, in my nat table:

-A PREROUTING -s 192.168.0.0/16 -d 192.168.1.1 -j ACCEPT

Shouldn't all packets, including ICMP packets, get passed through to 
192.168.1.1 if originating from the local network?

BTW, I'm not sure why I can communicate with the 192.168.2 subnet, but 
not my 192.168.1 subnet... Only the machine directly connected to 
192.168.1.1 is able to communicate with it...

My routing table looks like this:

bla bla bla
192.168.1.0   *    255.255.255.0    U   0   0   0   eth0
bla bla bla

which seems correct.


So, I'm not so sure why this isn't working...


Any hints?


Thanks!!!

Dave


