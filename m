From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: RE: problem with IPSEC-patches for 2.6.15 kernel
Date: Tue, 07 Mar 2006 17:36:02 +0100
Message-ID: <BAY103-F3C81A29CD260E7AF30341B2EE0@phx.gbl>
References: <440DB2B1.9030601@reinarts.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <440DB2B1.9030601@reinarts.de>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J.Hartmann@reinarts.de
Cc: netfilter@lists.netfilter.org


Joerg Hartmann wrote:

>Hello,
>
>i tried to patch iptables-1.3.5 and kernel 2.6.15.5 with 
>patch-o-matic-ng-20060303 to get ipsec-01 ... ipsec-04 patches into the 
>kernel.
>
>Unfortunately i got errors for the ipsec-01 ... 04 patches:
>
>"patchlets/ipsec-01-output-hooks has dependency on nf_reset, but nf_reset 
>is not known"
>
>Goggle was no help on this topic. Does someone know how to resolve this 
>problem ?

Wait for 2.6.16: those patches are in mainline kernel since 2.6.15-git9



