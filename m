From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Strange log entry ...
Date: 08 Jul 2002 16:07:15 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1026137236.27155.71.camel@rayw>
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

Hi

Can anyone tell me what this is?

Jul  8 16:04:23 firefly kernel: DROP FORWARD INTERNAL: IN=eth2 OUT=eth0
SRC=10.0.0.19 DST=199.181.167.201 LEN=1044 TOS=0x00 PREC=0x00 TTL=254
ID=18763 DF PROTO=ICMP TYPE=0 CODE=0 ID=6666 SEQ=0
Jul  8 16:04:26 firefly kernel: DROP FORWARD INTERNAL: IN=eth2 OUT=eth0
SRC=10.0.0.19 DST=199.181.167.201 LEN=1044 TOS=0x00 PREC=0x00 TTL=254
ID=18764 DF PROTO=ICMP TYPE=0 CODE=0 ID=6666 SEQ=0

I do not allow incoming echo requests to this machine. How the echo
reply is generated beats me ...

Ray



