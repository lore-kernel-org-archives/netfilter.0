From: Frederik Bijlsma <frederik@killesberg.org>
Subject: DCC Nat Trouble
Date: 18 Jun 2002 13:56:22 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1024401382.3010.7.camel@force>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Dear list,

I've got trouble setting up DCC Transfers using netfilter modules. 
ip_nat_irc ip_conntrack_irc are both loaded and assigned to the right
ports.

I can send DCC CHATs and DCC SENDs, but cannot receive anything. My
question: is it possible to receive these events over a netfilter gate?

incoming dcc send produces:
Jun 18 13:44:36 freedom kernel: IN=eth0 OUT=ppp0 SRC=192.168.7.77
DST=213.207.72.57 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=59596 DF PROTO=TCP
SPT=33991 DPT=4127 WINDOW=5840 RES=0x00 SYN URGP=0 

SRC host is my local workstation and DST is the remote DCC-Server.

any help appreciated.
regards, Frederik
-- 
linuxeria.de     | Birkenwaldstr. 113  | 70191 Stuttgart 
Frederik Bijlsma | Sternstr. 7         | 39104 Magdeburg 
--------------------------------------------------------
phone: +49 (0)391 5446857 facsimile: +49 (0)391 53539518 
public key: http://killesberg.org/gpg_public_key.txt
email: frederik@killesberg.org


