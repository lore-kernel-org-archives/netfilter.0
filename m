From: "Manuel Schmitz" <Port17@gmx.net>
Subject: mac-filtering is not working
Date: Thu, 17 Mar 2005 23:55:13 +0100 (MET)
Message-ID: <2239.1111100113@www54.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello,

I am desperately trying to establish mac-filtering on my debian-router.

- All default chains are empty, policy set to "ACCEPT".
- I execute 

  iptables -A FORWARD -m mac --mac-source $MY_MAC -j ACCEPT
  
  and then set the FORWARD-Policy to "DROP". Now I expect the chain to 
  drop all packages exept these coming from $MY_MAC. Am I right? 
- It does not work. It drops ALL traffic. So why?

--Manuel


-- 
SMS bei wichtigen e-mails und Ihre Gedanken sind frei ...
Alle Infos zur SMS-Benachrichtigung: http://www.gmx.net/de/go/sms

