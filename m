From: "Alex" <alex_oz@gmx.net>
Subject: ARP mangling in CLUSTERIP
Date: Tue, 8 Mar 2005 18:01:23 +0100 (MET)
Message-ID: <17045.1110301283@www71.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Hi folks,

as far as I can see from the CLUSTERIP source all ARP-Responses are
manipulated so that the clients get an multicast MAC (the cluster-MAC
address). But what about ARP-requests from the nodes itself? Such a request
is not mangled by the module and thus contains the original non-cluster-MAC.
This changes the clients ARP entry to a non multicast-MAC.
I reproduced this case and pinged a two node cluster. After a while node 2
makes an arp request using the NIC's MAC and not the Cluster's MAC. From
that moment the other node doesn't see any cluster traffic. Is it not yet
implemented?
Do I have any misconception?

-- 
SMS bei wichtigen e-mails und Ihre Gedanken sind frei ...
Alle Infos zur SMS-Benachrichtigung: http://www.gmx.net/de/go/sms

