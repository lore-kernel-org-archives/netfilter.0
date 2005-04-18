From: danci@agenda.si
Subject: PREROUTING, DNAT and IPSEC
Date: Mon, 18 Apr 2005 12:53:31 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0504181225100.12044@desktop.agenda.si>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi!

I have three networks which are connected via IPSEC. One of them is 
'primary' - that means it is used for all incoming stuff (mail, web, ...), 
the other are 'remote'.

I need to allow some clients to connect to specific hosts inside of those 
networks - two TCP connections in each network.

Since I'd like to keep things centralised and network performance is not a 
huge issue, I was going to do a PREROUTING DNAT for those connection, 
using unique listening ports and DNAT-ing them to three internal IPs - one 
of them is in the 'primary' network, the other two are on the 'remote' 
networks.

While this works fine for the IP in the 'primary' network, it doesn't work 
for the other two. I guess it has something to do with IPSEC, but I can't 
figure it out.

Any ideas?

  Danilo

PS: The 'primary' IPSEC server is SuSE 9.1 with 2.6.5 kernel and 
freeswan-2.04_1.5.4 installed - it has no ipsec0 interface. The other 
IPSEC machines have older distibtutions, kernel and freeswan (1.91_0.9.1 
in one case).

