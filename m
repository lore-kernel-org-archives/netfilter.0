From: "Martinez, Michael" <MMARTINEZ@CSREES.USDA.GOV>
Subject: RE: port 8080 and zope woes....
Date: Thu, 11 Sep 2003 08:06:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83EED274D3127740995A6B621B88F2E1DF7D03@csrees-exchange.csrees.usda.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: akshaysalkar <akshaysalkar@indiatimes.com>, netfilter@lists.netfilter.org

Turn on logging in iptables and see if any connections are happening

Michael Martinez
Linux System Administrator
ISTM/CSREES
United States Department of Agriculture

-----Original Message-----
From: akshaysalkar [mailto:akshaysalkar@indiatimes.com]=20
Sent: Thursday, September 11, 2003 1:44 AM
To: netfilter@lists.netfilter.org
Subject: port 8080 and zope woes....

I have zope server running on port 8080
and have enabled its access in IPTables=20
however it fails to open up.
any reason why??

 -A INPUT -d <dest-ip> -p tcp -m tcp --dport 8080 -j ACCEPT

-A OUTPUT -s <dest-ip> -p tcp -m tcp --sport 8080 -j ACCEPT


regards..




Get Your Private, Free E-mail from Indiatimes at
http://email.indiatimes.com

 Buy The Best In BOOKS at http://www.bestsellers.indiatimes.com

Bid for for Air Tickets on Air Sahara Flights at Prices Lower Than
Before. Just log on to http://airsahara.indiatimes.com and Bid Now!



