From: vlad f kropachew <vlad@ccs.ru>
Subject: ip_conntrack_ftp
Date: Mon, 7 Oct 2002 12:09:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E17yWou-0002dp-00@kashyyyk.netfilter.org>
Reply-To: vlad@ccs.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

hello. please ask the following question.  can i use the subject module for 
accepting passive ftp trafic on non-standart ports? i have the ftp on port 
20350, and after make configure with pass ESTABLISHED and RELATED connection 
with different records, i see that ftp-data don't hit in RELATED rule, and 
log contain next record after data transfer:

-------------
DEFAULT-DROP IN=eth0 OUT= MAC=00:60:08:5e:b1:ff:00:60:08:10:4b:d3:08:00 
SRC=217.76.32.10 DST=217.76.32.9 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=36164 DF 
PROTO=TCP SPT=1295 DPT=54245 WINDOW=32120 RES=0x00 SYN URGP=0
-------------

may be this module track only standart ftp-control port? 

vlad/


