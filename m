From: Frank Petran <frank.petran@inpho.de>
Subject: How to filter packets resulting from hosts with dynamic IP-address
Date: Tue, 6 Feb 2007 10:42:21 +0100
Message-ID: <200702061042.21497.frank.petran@inpho.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I want to allow incoming traffic from hosts that run on changing IP-addresses 
supplied by the ISP. These hosts have their current IP-address registered 
with dyndns.org as soon as they connect to the internet.

As far as I have understood it, filters can act on IP-addresses but not on 
hostnames. Since the originating IP-address changes, all I am left with is 
the known hostname. As far as I have understood it, filters can act on 
IP-addresses but not on hostnames. I would like to do a hostname lookup based 
on the name registered at dyndns.org and compare that with the IP-address of 
the incoming traffic.
-- 
INPHO GmbH   *   Smaragdweg 1   *   70174 Stuttgart   *   Germany
phone: +49 711 2288 10  *  fax: +49 711 2288 111  *  web: www.inpho.de
place of business: Stuttgart    *   managing director: Johannes Saile
commercial register: Stuttgart, HRB 9586


