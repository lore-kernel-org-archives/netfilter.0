From: "Oleg A. Arkhangelsky" <sysoleg@progtech.ru>
Subject: Port DNATting
Date: Sat, 26 Nov 2005 12:42:17 +0300
Message-ID: <618002805.20051126124217@progtech.ru>
Reply-To: "Oleg A. Arkhangelsky" <sysoleg@progtech.ru>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello All,

  When I'm trying to do something like this:

  iptables -t nat -I POSTROUTING -p tcp --dport 8080 -j DNAT --to :80

  I get: "iptables: Invalid argument".

  What I want is only to translate destination port of all TCP-packets
  going to some_ip:8080 into some_ip:80. I don't want to change IP. It
  seems that syntax of this command is corrent, but... What is wrong?

  Thanks!

  P.S.: Kernel 2.4.31, iptables v1.3.2

-- 
Best regards,
 Oleg


