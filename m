From: Dominic Iadicicco <sctylib2004@yahoo.com>
Subject: Understanding how nat works
Date: Tue, 21 Sep 2004 07:02:58 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040921140258.75515.qmail@web51307.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,

I am new at iptables and am tring to learn for furture
projects. For an expirement I tried this.

"iptables -t nat -A POSTROUTING -s 172.16.12.131 -o
eth0 -j SNAT --to 172.16.12.167"

This is all on a 172.16.12.x subnet.

from the same machine I then tried to ping
172.16.12.200 and I got nowhere.  When I deleted the
rule it worked fine.  

Could someone tell me were I went wrong and or maybe
point me in the right direction.

Thanks 

Dominic Iadicicco


		
__________________________________
Do you Yahoo!?
Yahoo! Mail is new and improved - Check it out!
http://promotions.yahoo.com/new_mail

