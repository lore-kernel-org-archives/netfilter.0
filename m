From: "Saurabh Mehrotra" <saurabh1980@gmail.com>
Subject: Iptables problem
Date: Fri, 26 Jan 2007 16:49:25 +0530
Message-ID: <9c9832d0701260319q2b686090k28d63d92e2c58646@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

---------- Forwarded message ----------
From: Saurabh Mehrotra <saurabh1980@gmail.com>
Date: Mon, 22 Jan 2007 21:29:46 +0530
Subject: Iptables problem help required !!!!
To: netfilter@lists.netfilter.org

Hi ,

I am using Red Hat Enterprise Linux AS release 4 (Nahant Update 3) with
Kernel 2.6.9-34.ELsmp #1

I am using Iptables for firewall .

But without firewall I m able to nslookup my own DNS server but whenever I
enabled firewall I am not able to nslookup to my own system.

And log files shows the following entry .

RULE 0 -- ACCEPT IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00
SRC=127.0.0.1 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=15607 DF
PROTO=TCP SPT=46994 DPT=25 WINDOW=32767 RES=0x00 SYN URGP=0
Jan 22 15:52:01 trench1ams crond(pam_unix)[13126]: session closed for user
root

EVEN This rule 0 is also accept rule for SSH not for deny...


I have added rule to accept my own system  traffic ...to allow any service
but still tje proble, is same ....


root@trench1 ~]# nslookup trench1
Server:         212.165.108.4
Address:        212.165.108.4#53

*** Can't find trench1ams: No answer


Please advice me how can I overcome with this problem .......


Thanks

Saurabh

