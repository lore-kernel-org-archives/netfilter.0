From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: wherr to find and how to install ip_conntrck_pptp and ip_nat_pptp modules
Date: Wed, 11 Aug 2004 18:17:07 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BusYF-000728-6z@vishnu.netfilter.org>
Reply-To: <bassam@palettemm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All,
I am trying to enable a multiple VPN tunnels to pass through my Linux
machine so that VPN clients on the LAN can access the VPN server on the WAN.
Through my google search I found there are two modules required to enable
this functionality on my Linux box, these modules should be loaded in the
kernel. So any body can help and direct me where to find these two modules
and how can I install them?

I have two linux machines the first one is Redhat 9 (kernel 2.4.20) and the
second one is Fedora core 2 (kernel 2.6.5)

If I am mistaken, so please direct me on how to enable multiple VPN
connection to pass through my boxes?

--------------	--------------	--------------
|VPN-Client-1|	|VPN-Client-2|	|VPN-Client-n|
--------------	--------------	--------------
|			|			|
|			|			|
|------------------------------------
|
| LAN side
|
|
|
---------------
|Linux machine|
---------------
|
|
| WAN side
|
|
------------
|VPN Server|
------------


I am expecting you urgent help regarding this matter

Thanks in advance

Bassam

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.729 / Virus Database: 484 - Release Date: 7/27/2004
 


