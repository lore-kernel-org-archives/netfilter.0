From: Marco Oliveira <okara-rj@ig.com.br>
Subject: modem bridge debian
Date: Sun, 3 Sep 2006 14:36:09 -0300
Message-ID: <20060903_173609_000285.okara-rj@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1157304969"
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
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1157304969
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

hi people! 

i have a dsl modem bridge ss4200 in my eth1 and my network on eth0! 
but i cant do the net share on debian sarge.. 

what i did: 

echo "1" > /proc/sys/net/ipv4/ip_forward 
echo "1" > /proc/sys/net/ipv4/ip_dynaddr 
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE 
iptables -A FORWARD -i eth1 -j ACCEPT 

(internet)---[---modem---]---{ppp0}---[---eth1---server---eth0---]---(rede 
interna) 

what am i doing wrong? it only open www.google.com and nothing more... 
nothing on internet solve my problem! :( 

thanks! 

Marco Oliveira 



--Message-Boundary-by-Mail-Sender-1157304969--


