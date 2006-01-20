From: Burak Ozgoren <BOzgoren@gunessigorta.com.tr>
Subject: Fw: nat between dmz and local after external nat to dmz. is it
	possible?
Date: Fri, 20 Jan 2006 16:18:43 +0200
Message-ID: <OFCD89F525.04A4F486-ONC22570FC.004E1BB5-C22570FC.004ED0BC@gunessigorta.com.tr>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Yes, it is possible with one interface to dmz.



----- Forwarded by Burak Ozgoren/BIM/Gunessigorta on 20.01.2006 16:16 
-----

Burak Ozgoren/BIM/Gunessigorta 
19.01.2006 15:08

To
netfilter@lists.netfilter.org
cc

Subject
nat between dmz and local after external nat to dmz. is it possible?





Hello,

My question is. Tcp connection coming from external (internet) is being 
nat to dmz. 

195.155.x.x port 12000 -> 192.168.x.x port 12000

i want to put a linux box with netfilter to dmz to nat these tcp packets 
to 10.10.x.x port 25.

two nat operations on the way, is it possible?

Thank you.

