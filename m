From: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Subject: chains sequence
Date: Mon, 30 Sep 2002 10:14:17 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c26883$48718980$3201a8c0@leonardo>
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
To: netfilter ML <netfilter@lists.samba.org>


    Hello Guys .....

    Which is the correct sequence of a packet received on a machine
interface and redirected via DNAT ?? Would it be:

MANGLE PREROUTING
NAT PREROUTING
FILTER FORWARDNAT POSTROUTING

    Sincerily,
    Leonardo Rodrigues




