From: "nilesh_cne" <nilesh_cne@indiatimes.com>
Subject: upload form uplink and download different downlink
Date: Tue, 29 Jul 2003 18:11:23 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307291246.SAA01959@WS0005.indiatimes.com>
Reply-To: "nilesh_cne"<nilesh_cne@indiatimes.com>
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

Hi all'
can some one help me

1. i have vsat downlink (only downlink) 128 kbps
2. i have leased line of 128kbps uplink/downlink (both uplink as well as downlink)

vsat terminates in to my linux box through capture card
and my leased line terminates it into another  lancard on same machine.

i want such that my all traffic coming from internal lan
should go through uplink of leased line and come back from vsat downlink .
pls send me the rules of iptables
so that i can utilize my downlink.



vsat(downlink)
-->--------|  
128k	   |
	   LinuxBox ------local lan-----192.168.1.*
128k	   |
-----<->---|
leasedline(uplink/downlink)


thanx in advance 
niel


Get Your Private, Free E-mail from Indiatimes at http://email.indiatimes.com

 Buy The Best In BOOKS at http://www.bestsellers.indiatimes.com

Bid for for Air Tickets on Air Sahara Flights at Prices Lower Than Before. Just log on to http://airsahara.indiatimes.com and Bid Now !


