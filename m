From: George Georgalis <georgw@galis.org>
Subject: not loadbalancing but 2 ISPs
Date: Mon, 17 Jun 2002 23:27:00 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020617232700.A3401@trot>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I'm going to be migrating some servers from one ISP to another at the
same location.

Does this scenario hold water (simplified syntax for clarity). The idea
is for the server to respond (all the way to the client) regardless of
whether the request went to the IP on ISP1 or ISP2.

T1a_host01=host ip on ISP 1
T1b_host01=host ip on ISP 2
DMZ_host01=host ip on DMZ
EXT_T1a=external interface for ISP 1
EXT_T1b=external interface for ISP 2
INT_DMZ=internal interface for DMZ

nat PREROUTING --dst $T1a_host01 DNAT $DMZ_host01
nat PREROUTING --dst $T1b_host01 DNAT $DMZ_host01

INPUT -i $EXT_T1a -d $DMZ_host01 -j ACCEPT
INPUT -i $EXT_T1b -d $DMZ_host01 -j ACCEPT

nat -A POSTROUTING -s $DMZ_host01 -o $EXT_T1a -j SNAT --to-source $T1a_host01
nat -A POSTROUTING -s $DMZ_host01 -o $EXT_T1b -j SNAT --to-source $T1b_host01

FORWARD -i $INT_DMZ -o $EXT_T1a -m state --state ESTABLISHED,RELATED -j ACCEPT
FORWARD -i $INT_DMZ -o $EXT_T1b -m state --state ESTABLISHED,RELATED -j ACCEPT

If this wouldn't work, why? I'm concerned about those POSTROUTING
lines, is there a workaround?  Would the system also work for high
availability, if I could get DNS to behave?

// George






-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


