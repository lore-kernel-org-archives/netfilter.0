From: LI GUOJIE <p1436630@delta.ntu.ac.sg>
Subject: Strange MAC address
Date: Sun, 18 May 2003 21:59:21 +0800 (SST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.OSF.3.91.1030518215213.1714B-100000@delta.ntu.ac.sg>
References: <20030518131901.6405.24639.Mailman@kashyyyk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030518131901.6405.24639.Mailman@kashyyyk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi, all!

I am trying to use '-m mac' for match. Client machine mac is: 
00:00:E4:95:6B:48 . However, i saw the following log on the server: 
(using log-ip-options)

IPTABLES INPUT ILLEGAL: IN=eth0 OUT= 
MAC=00:a0:cc:28:56:c4:00:09:b6:13:9a:7c:08:00 SRC=155.66.220.73 
DST=173.23.214.22 LEN=88 TOS=0x00 PREC=0x00 TTL=124 ID=4708 DF PROTO=TCP 
SPT=1292 DPT=22 WINDOW=64164 RES=0x00 ACK PSH URGP=0 


The MAC display in log is really strange(the length is much longer), can any 
one explain? 

Thank you

------------------------------------


