From: James Garrison <jhg@athensgroup.com>
Subject: DHCP and conntrack?
Date: Fri, 07 Jun 2002 12:00:19 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D00E6A3.30006@athensgroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Does connection tracking understand incoming DHCP responses as
being related to recent outgoing broadcast DHCP requests?  In other
words,  if I configure iptables to allow outgoing DHCP broadcast
requests, do I have to explicitly open up a hole for the returning
response, or will conntrack do it for me with RELATED?

-- 
James Garrison                                Athens Group, Inc.
mailto:jhg@athensgroup.com                    5608 Parkcrest Dr
http://www.athensgroup.com                    Austin, TX 78731
PGP: RSA=0x92E90A3B DH/DSS=0x498D331C         (512) 345-0600 x150



