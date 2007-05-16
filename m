From: "Vasantha Kumar Puttappa" <vasanthakumar@iitb.ac.in>
Subject: Packets lost
Date: Wed, 16 May 2007 18:37:01 +0530 (IST)
Message-ID: <3388.10.107.26.27.1179320821.squirrel@gpo.iitb.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi All,
 Please somebody guide me here.

I am tracking all udp packets (in particular, SIP based UDP packets)that
goes through iptables using LOG mechanism.
I use the following command,
    iptables -A INPUT -p udp -j LOG --log-level-4.

In addition, i also run 'Ethereal' to make sure that all the packets
captured goes through iptables as well.

Here is the problem,
  Sometimes, a random number of packets doesnot go through IPtables and
they are completely lost. Although, I can see those packets in Ethereal.

 I tried increasing the backlog queue and ip_queue length, but still no use.
 I am using Netgear's wireless network card (WG511, made in taiwan).


 Somebody please guide me. How do I findout the cause of this.

 Regards
 Vasanth






