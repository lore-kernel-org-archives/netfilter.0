From: "akshaysalkar" <akshaysalkar@indiatimes.com>
Subject: iptables forward rulesets woes
Date: Wed, 24 Sep 2003 10:35:49 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309240448.KAA10542@WS0005.indiatimes.com>
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

i was refering to the book on linux net admin by olaf kirch
the example gives
'a organization having a firewall machine to allow internal users to be able to access WWW servers on the internet but no other traffic to be passed'
the iptable rules given are
iptables -F FORWARD
iptables -P FORWARD DROP
iptables -A FORWARD -m tcp -p tcp -s 0/0 --sport 80 -d 172.16.1.0/24 --syn -j DROP
iptables -A FORWARD -m tcp -p tcp -s 172.16.1.0/24  --sport 80 -d 0/0 -j ACCEPT
iptables -A FORWARD -m tcp -p tcp -d 172.16.1.0/24  --dport 80 -s 0/0 -j ACCEPT

i dont kinda understand this...
firstly 2nd line whats the -P. i guess its the default policy. but i could have given as
iptables -A FORWARD -j DROP

2nddly 3rd line why the -j DROP i thought it should be ACCEPT

3rdly since it says access the WWW servers on the internet why is it that on the 4th linethe --sport is 80
the source doesnt necessarily have to be 80 it could be any unprivileged port. the --dport should be infact 80

and the last line also seems confusing to me. where the -d is the network-ip

please help me/ suggest.

regards







Get Your Private, Free E-mail from Indiatimes at http://email.indiatimes.com

 Buy The Best In BOOKS at http://www.bestsellers.indiatimes.com

Bid for for Air Tickets @ Re.1 on Air Sahara Flights. Just log on to http://airsahara.indiatimes.com and Bid Now !


