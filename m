From: "M. Ziya Ozudogru" <e116132@metu.edu.tr>
Subject: mac/ip match
Date: 18 Sep 2003 21:26:00 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063909559.19096.12.camel@tux>
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

Any hints about the following problem will be appreciated. Thanks a
lot...

I want to assure that only given ip/mac matches will access to the
internet (i mean if someone takes the ip that does not belong to his/her
mac address no access will be given) . I will give the ip to the mac
address by the dhcp..

In my knowledge, i want to set these ip/mac groups using the command:

arp -s ip mac

and i want to redirect unused ip to an unused mac with the same way...

Here comes the problem.. How can i define in iptables to use these arp
rules and give access only the one addresses that match the rules and
should block all the others ( well i want to block the others [unused ip
addresses by using iptables mac macth module ] ) . ? Any hints ?

Thanks for your valuable help...




