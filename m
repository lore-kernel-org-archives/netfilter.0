From: "Knight, Steve" <Steve.Knight@bskyb.com>
Subject: browsing the "network 'hood" from LAN <-> DMZ
Date: Fri, 5 Dec 2003 12:12:28 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDB52A0429DFD31196FB0008C7D972D50EA57B91@OST_EXCH_USR5>
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

Hi chaps

I'm sure this is a straightforward and easily answered question.  The
environment is:


              --$DMZ_NIC- 192.168.1.0/24 mail,DNS,WWW servers
             /
INET -ppp0-FW
             \
              --$LAN_NIC- 192.168.0.0/24 LAN workstations


I'm trying to get the LAN to be able to NBT browse the boxes in the DMZ, but
they won't.  I'm permitting all TCP and UDP from LAN to DMZ and back again
...  It looks like NetBIOS isn't going to and from eth0-eth1.

Is there some obvious Windows networking rule I'm missing?  I've got TCP and
UDP forward to and fro rules for eth0 and eth1 set up...

Any suggestions gratefully received!

Cheers

Steve


-----------------------------------------------------------------------
Information in this email may be privileged, confidential and is 
intended exclusively for the addressee.  The views expressed may
not be official policy, but the personal views of the originator.
If you have received it in error, please notify the sender by return
e-mail and delete it from your system.  You should not reproduce, 
distribute, store, retransmit, use or disclose its contents to anyone.
 
Please note we reserve the right to monitor all e-mail
communication through our internal and external networks.
-----------------------------------------------------------------------


