From: Wilson Fletcher <wilsonf@mclachlan.com.au>
Subject: Masquerading
Date: Tue, 22 Oct 2002 09:51:31 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DB49303.3050408@mclachlan.com.au>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Just looking at iptables.

Normally a reply to a masq'd packet coming into the network will
have the destination IP of the g/w. So if the NAT for masq is done
in POSTROUTING (after filtering) do I need to except INPUT packets
to ports in the masquerading range (~61000:65535 ????) ?

The Linux 2.4 Packet Filtering HOWTO appears to suggest that I can
ignore the fact that I'm nat'ing and use forwarding rules for packets
being masq'd and de-masq'd and that I do not need to worry about
INPUT for packets that are going to my masq'd range.

Have I understood this correctly ?

thanks,

Wilson

P.S. I'm not subscribed here. Can you reply to:
research at mclachlan dot com dot au


