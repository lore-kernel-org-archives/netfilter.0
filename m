From: "-iYung-" <iyung@ibs.ath.cx>
Subject: IPPROTO_SCTP compile error
Date: Wed, 03 Mar 2004 18:07:03 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403031807030225.00ACD163@smtp.jkt.pearlenergy.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

does anyone knows about this, i am trying to compile iptables on slack 9.1,=
 with 2.4.24 kernel version, here are the error message whe i run make:

iptables.c:238: `IPPROTO_SCTP' undeclared here (not in a function)
iptables.c:238: initializer element is not constant
iptables.c:238: (near initialization for `chain_protos[5].num')
iptables.c:238: initializer element is not constant
iptables.c:238: (near initialization for `chain_protos[5]')
iptables.c:239: initializer element is not constant
iptables.c:239: (near initialization for `chain_protos[6]')
make: *** [iptables.o] Error 1


cheers.
julius.





