From: "Gene Dellinger" <gene@poh.com>
Subject: dnat question
Date: Thu, 6 Oct 2005 17:32:12 -1000
Message-ID: <BOEKIIIKCIBKDMDMHHLLCEIJCMAA.gene@poh.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I want to do the following
I have a primary server in my Hawaii office that clients(20.20.20.2) in
Hawai connect to.
Currently through straight forward routing they connect directly to the IP
4.4.4.2
I would like to have them connect to my firewall(3.3.3.2) and port forward
the connections to 4.4.4.2
 that was done using iptables -t nat PREROUTING -s 20.20.20.2 -p tcp --dport
22 -j DNAT --to-destination 4.4.4.2
To provide an emergency backup should something happen to the main server in
Hawaii, I would like to change the PREROUTING to
  -j DNAT --to-destination 6.6.6.2

I have set it up, but when I am looking at the packet trail I see it get to
my backup server, and then die, no return packets
are sent back to the client. Interesting note: I can gain access from the
clients direct to the backup server(i.e. from client station ssh 6.6.6.2),
but that takes my ability to switch to the backup in one spot at the
firewall. I have had pretty good luck with iptables in the past but this one
has me stumped.

Below is the network config.


 client	   	   	                        				               linux
 20.20.20.2>--->router >-1.1.1.1-(WAN T1)--1.1.1.2->router
>-3.3.3.1--(LAN)--3.3.3.2-> firewall >-4.4.4.1--(LAN)--4.4.4.2-> main server
           HAWAII		   			          2.2.2.1                        HAWAII
							    		|
									|
							    	  (WAN T1)
							            |
									|
				   				   2.2.2.2                            linux
				   				   router >-5.5.5.1--(LAN)--5.5.5.2-> firewall
>-6.6.6.1--(LAN)--6.6.6.2-> backup server
				                                                          CALIFORNIA

Thanks
Gene Dellinger
IT Systems Engineer
POH, Inc.


