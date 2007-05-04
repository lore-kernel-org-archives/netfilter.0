From: Tommy W <tommy@svearike.sytes.net>
Subject: Simulating a "bad" connection.
Date: Fri, 4 May 2007 22:01:21 +0200
Message-ID: <200705042201.21985.tommy@svearike.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi,
I was just wondering if someone knows of a good way to simulate a "bad" 
network?.
I want high latency AND/OR high packet loss.

I was thinking along the lines  
iptables -I INPUT -m random --average 90 -j DROP

but then I get libipt_random.so doesn't exist.
I see that it is not included, how do you get it ?

kernel: 2.6.16-rc5
iptables: 1.3.4

or is there some other more simple solution?

Thanks in advance
/Tommy

