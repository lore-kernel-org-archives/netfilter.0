From: Burak Ozgoren <BOzgoren@gunessigorta.com.tr>
Subject: nat between dmz and local after external nat to dmz. is it possible?
Date: Thu, 19 Jan 2006 15:08:26 +0200
Message-ID: <OF0AEE21FD.FF24090B-ONC22570FB.0047FBB3-C22570FB.004871BE@gunessigorta.com.tr>
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

Hello,

My question is. Tcp connection coming from external (internet) is being 
nat to dmz. 

195.155.x.x port 12000 -> 192.168.x.x port 12000

i want to put a linux box with netfilter to dmz to nat these tcp packets 
to 10.10.x.x port 25.

two nat operations on the way, is it possible?

Thank you.

