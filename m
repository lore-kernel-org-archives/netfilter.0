From: "Andrew Hall" <temp02@bluereef.com.au>
Subject: Dead loop on Virtual device BR0
Date: Wed, 13 Apr 2005 11:38:06 +1000
Message-ID: <0afc01c53fc9$70c82b30$5001010a@bluereef.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi,

Not sure if this is a possible bug, but we are seeing the message "Dead =
loop on Virtual device BR0" a lot.

We are using 2.6.10 and have now tried 2.6.11.5 with native ipsec, =
brouting, netfilter and HTB queuing enabled. If I shut down the ipsec =
tunnel, this message goes away.

Can someone please explain what it means and whether it's a bug?

Please let me know if there is any more information you need.

thanks,

Andrew.
