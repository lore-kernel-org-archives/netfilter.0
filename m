From: "akshaysalkar" <akshaysalkar@indiatimes.com>
Subject: putting all logs in a file
Date: Wed, 10 Sep 2003 16:59:39 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309101112.QAA09833@WS0005.indiatimes.com>
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

is there anyway i can completely avoid sending netfilter log messages to /var/log/messages

i dont want to clutter up that file

and instead put to /var/log/iptables.log

it seems messages go in both files if i use 
kern.info /var/log/iptables.log
in the /etc/syslog.conf file


i want just in one file ie. /var/log/iptables.log
Get Your Private, Free E-mail from Indiatimes at http://email.indiatimes.com

 Buy The Best In BOOKS at http://www.bestsellers.indiatimes.com

Bid for for Air Tickets on Air Sahara Flights at Prices Lower Than Before. Just log on to http://airsahara.indiatimes.com and Bid Now!


