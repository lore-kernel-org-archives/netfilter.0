From: "Freckmann, Christian" <C.Freckmann@tuvit.de>
Subject: Netfilter module falls out - what happens to pakets?
Date: Wed, 11 Dec 2002 15:11:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5A7AFCF46DC1D54A8FE8BB9282EB54291FB521@tuvitsv3.tuev-mitte.de>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I use netfilter with the 2.4.19 kernel. IP forwarding is deactived by the
kernel.
What happens to incoming, forwarded and outgoing pakets if only the
netfilter module doesn't work but the system is still running?
Can they pass the system or are they blocked?

Thanks for your help and best regards


