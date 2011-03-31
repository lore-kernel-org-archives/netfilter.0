From: "Michael D. Berger" <m_d_berger_1900@yahoo.com>
Subject: repeated local ephemeral to 80
Date: Thu, 31 Mar 2011 18:04:20 +0000 (UTC)
Message-ID: <in2fn4$ksm$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On my CentOS box that I use mainly as a web server, I have iptables
set to log and reject anything that I don't expect.  So lately,
I have getting things like this:


Mar 29 17:27:20 mbrc20 kernel: IPT-DROP IN= OUT=lo SRC=192.168.9.20 
DST=192.168.9.20 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=46910 DF PROTO=TCP 
SPT=56624 DPT=80 WINDOW=32792 RES=0x00 SYN URGP=0 OPT 
(0204400C0402080A4A26F7A50000000001030307) UID=0

that on at least one occasion repeated for every few seconds for
more than three hours.  The ephemeral source port keeps changing in an 
irregular manner.

Any suggestions?

Thanks,
Mike

