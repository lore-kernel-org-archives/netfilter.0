From: "akshaysalkar" <akshaysalkar@indiatimes.com>
Subject: where should logs go??
Date: Mon, 08 Sep 2003 13:57:51 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309080812.NAA08173@WS0005.indiatimes.com>
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


i was going throught eh iptables tutorial etc.
and regarding logging... i am quite confused.
it says somehwere in the tutorial that specifaction of iptables should be
iptables -A FORWARD -p tcp -j LOG --log-level debug

then somewhere below
kern.=info /var/log/iptables in your syslog.conf file and then letting all your LOG messages in iptables use log level info, would make all messages appear in the /var/log/iptables file.

so what should be the syslog 
should it be
kern.debug
or 
kern.info
or can it be even
kern.warn

i'm confused.
i tried kern.warn
and the logs do go to /var/log/iptables (the file i created for itpables logs) but then quite a lot go to /var/log/messages also.

i want to avoid the messages going to /var/log/messages

any suggestions...


regards,




Get Your Private, Free E-mail from Indiatimes at http://email.indiatimes.com

 Buy The Best In BOOKS at http://www.bestsellers.indiatimes.com

Bid for for Air Tickets on Air Sahara Flights at Prices Lower Than Before. Just log on to http://airsahara.indiatimes.com and Bid Now!


