From: "akshaysalkar" <akshaysalkar@indiatimes.com>
Subject: port 8080 and zope woes....
Date: Thu, 11 Sep 2003 11:14:05 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309110526.KAA26061@WS0005.indiatimes.com>
Reply-To: "akshaysalkar"<akshaysalkar@indiatimes.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have zope server running on port 8080
and have enabled its access in IPTables 
however it fails to open up.
any reason why??

 -A INPUT -d <dest-ip> -p tcp -m tcp --dport 8080 -j ACCEPT

-A OUTPUT -s <dest-ip> -p tcp -m tcp --sport 8080 -j ACCEPT


regards..




Get Your Private, Free E-mail from Indiatimes at http://email.indiatimes.com

 Buy The Best In BOOKS at http://www.bestsellers.indiatimes.com

Bid for for Air Tickets on Air Sahara Flights at Prices Lower Than Before. Just log on to http://airsahara.indiatimes.com and Bid Now!


