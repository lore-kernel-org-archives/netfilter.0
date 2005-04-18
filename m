From: Lukasz Hejnak <sziftgroup@wp.pl>
Subject: Strange broadcasts
Date: Mon, 18 Apr 2005 18:23:01 +0200
Message-ID: <20050418162301.GA3711@szift.net.autocom.pl>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi
I've started receiving some strange broadcast information on my firewall
it starts in the logs around ten days ago and looks like this:

INPUT:IN=eth0 OUT= MAC= SRC=192.168.10.1 DST=192.168.10.255 LEN=240 TOS=0x00 
PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=138 DPT=138 LEN=220 
INPUT:IN=eth0 OUT= MAC= SRC=192.168.10.1 DST=192.168.10.255 LEN=234 TOS=0x00 
PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=138 DPT=138 LEN=214 

INPUT:IN=eth1 OUT= MAC= SRC=$MYEXTIP DST=$MYEXTNET.255 LEN=240 TOS=0x00 
PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=138 DPT=138 LEN=220 
INPUT:IN=eth1 OUT= MAC= SRC=$MYEXTIP DST=$MYEXTNET.255 LEN=234 TOS=0x00 
PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=138 DPT=138 LEN=214 

INPUT:IN=eth2 OUT= MAC= SRC=192.168.11.1 DST=192.168.11.255 LEN=240 TOS=0x00 
PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=138 DPT=138 LEN=220 
INPUT:IN=eth2 OUT= MAC= SRC=192.168.11.1 DST=192.168.11.255 LEN=234 TOS=0x00 
PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=138 DPT=138 LEN=214 

a few first occurences had SPT and DPT 137, and now it looks like the above
happens about every 12 minutes, and I can't seem to see what's causing this
the server is running only apache and exim
the eth1 is the internet, eth{0,2} are just two connections to two PCs I've
got at home (had a spare nic and no cash for a hub ;)

anybody had a similar case?

-- 
with regards
Lukasz Hejnak
szift@wp.pl

