From: "Roger Villavicencio" <roger@decaos.com>
Subject: unknown config key 'Repository:'
Date: Mon, 8 Nov 2004 12:11:21 -0500
Message-ID: <20041108170108.A16C375418A@perucamaras.com>
References: <20041106180826.EC40375418A@perucamaras.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041106180826.EC40375418A@perucamaras.com>
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
To: 'Netfilter users list' <netfilter@lists.netfilter.org>

I'm compiling the patch-o-matic and give me this error:

root@fw:/usr/src/patch-o-matic-ng-20040621# KERNEL_DIR=/usr/src/linux
IPTABLES_DIR=/usr/src/iptables/ ./runme base
Loading patchlet
definitions.................................................................
.............................................unknown config key
'Repository:' in ./patch-o-matic-ng/info at ./runme line 216


What can I do?


I have:
- linux-2.6.9
- patch-o-matic-ng-20040621
- iptables-1.2.11





