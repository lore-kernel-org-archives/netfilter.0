From: Clist <clist@uah.es>
Subject: Questions on State and RAW Tables -- EARLY DROP ON RAW SAVE
	CONNTRACKS EFFORTS? --
Date: Tue, 15 Mar 2005 13:12:33 +0100
Message-ID: <200503151312.33524.clist@uah.es>
Reply-To: clist@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello!

Dropping connecctions on RAW table prevents connections being tracked? or 
maybe You have to send those packets to NOTRACK target and later drop them
 on raw or filter tables... 

I use to catch Intruders on filter tables for no allowed destinations and 
remember them in ipt_recent lists, in order to drop subsecuent packets early 
in the raw table to save processing connection tracking  for those ip's. 

Is that right?

On RAW table
# EARLY DROP
iptables -t raw -A PREROUTING -i eth0 -m recent --update --seconds 60 --name 
OUTSIDERS  -j DROP

..
..
..
# On FILTER table
# FIRST MATCH
...
...
# Chain for matching currenlty allowed network destinations...
-A ALLOWED_NETWORKS -d <allowed> -j ACCEPT
..
..
# Drop no allowed destinations and rememeber them for 1 minute
-A ALLOWED_NETWORKS -m recent --set --name OUTSIDERS -j DROP


I think dropping on RAW tables should prevent packets for being tracked on ct, 
but im not sure.

Any ideas about this???


..Clist

-- 
-------------------------------------------------
Clister UAH
-------------------------------------------------

