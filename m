From: Rommy Taslim <rommyt@transportservices.com.au>
Subject: Multiple VPN Masquerading Works !! Thanks Everyone !
Date: 09 Sep 2002 11:00:59 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1031533259.3437.59.camel@hyperno>
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

Hi All,

I just want to thank you all for the time and help to get my multiple
vpn masquerading works.

Thanks to Harald Welte, Rob Sterenborg, Stewart Thompson, hard_ware
(till now I don't really know your name, sorry), and anyone else that I
forgot to mention here (sorry about that) but have been helpfull for me.

Turns out my problem was because my routing isn't right. The pptp server
should have a default gateway to the netfilter box (like hard_ware
said), and also in my iptables rules I need to set the default rules to
DROP for INPUT and OUTPUT. I guess it won't work if we have ACCEPT for
all INPUT and OUTPUT when we try to do DNAT (correct me if I'm wrong).

Well, that what I think. Sorry if I still got this all wrong. But the
main thing is my multiple vpn masquerading works fine now. Once again,
thanks to all of you guys that have spared some times to help me out. I
really appreciate it.

Regards,
Rommy


