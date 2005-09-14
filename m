From: venkata subramanian <venkatasubramanian@gmail.com>
Subject: 1. Switch Flooding 2. Chains traversal
Date: Wed, 14 Sep 2005 10:05:04 +0530
Message-ID: <acf1defa050913213555e04129@mail.gmail.com>
Reply-To: venkatasubramanian@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
1. Switch Flooding
       We have a nice problem in our organisation. Due to viruses,
some windows machine or the other starts flooding the network with
packets. And, in the end, one of our switches comes down making us to
manually restart the switch.
       I don't (intuitively) see how iptables can help in this
scenario.... But, I want to know whether any solution exists to this?
If I make all the machine's gateway as a linux system, and rate limit
the packets there will it help?
   =20
2. Chain traversal
       Why is this chain traversal looking complicated? if there is
atleast one rule in every inbuilt chain, it seems that there are many
possible permutations of the chain traversal. How do you guys manage
with it?

