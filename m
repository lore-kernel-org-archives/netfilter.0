From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: What does this mean?
Date: 27 Feb 2003 17:06:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046358409.11465.23.camel@raylinux.internal>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi

I see this in my firewall log:
Feb 27 16:51:19 firefly kernel: DROP FORWARD INTERNAL: IN=eth2 OUT=eth0
SRC=10.0.0.67 DST=68.84.228.144 LEN=60 TOS=0x00 PREC=0x00 TTL=63
ID=64368 DF PROTO=TCP SPT=54767 DPT=0 WINDOW=5840 RES=0x00 CWR ECE SYN
URGP=0

What is DPT=0? I've never heard of using port 0 ...

What is CWR ECE SYN? Are they TCP flags? If so, what is CWR ECE ?

Ray

-- 


