From: "Natarajan E" <nataraj_e@india.com>
Subject: DNAT on iptables
Date: Mon, 04 Aug 2003 23:17:25 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030804151726.13388.qmail@india.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi Harald,
  
  i use iptables 1.2.8 , &  i have to give a static nat for three different ip in my internal network  with 3 different external IPs for example


    172.16.0.134  --> mapped to 210.x.x.2
    172.16.0.138 -->  mapped to 210.x.x.3
     172.16.0.139 --> mapped to 210.x.x.4, 
 
i added the following in PREROUTING
iptables -t nat -A PREROUTING -d 210.x.x.2 -j DNAT --to-destination 172.16.0.134, similarly for other 2 also..
when i tried this , i was not able to reach the internal ip.

Inside segment 172.16.0.0/24--eth1
outside ip address 202.x.x.212--eth0

Please Help ME ! ! ! .
Thanks in advance

Regards
Natraj.E
SIFY LTD.,
Tidal Park
Chennai

Ph    : 91-44- 
Mobile: 98402-65831


-- 
______________________________________________
http://www.india.com
Now with POP3/SMTP access for only US$14.95/yr

Powered by Outblaze

