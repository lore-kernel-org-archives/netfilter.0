From: Bryan Wright <bryan@virginia.edu>
Subject: Communication between internal hosts, using external addresses
Date: Tue, 18 Sep 2007 16:28:24 +0000 (UTC)
Message-ID: <loom.20070918T180920-169@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <http://lists.netfilter.org/pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi folks,

     This is one of those problems where the best solution may
just be "don't do that", but here's my question for what it's
worth:

     I have two hosts, "A" and "B", which are both on a private
internal network behind a firewall, and have the addresses
"A.internal" and "B.internal" there.  One of the hosts ("B")
is available to the outside world as "B.external", which is
forwarded through the firewall.  Both "A" and "B" are masqueraded
through the firewall to the outside world.

     Sometimes "A" needs to talk to "B".  Obviously, the best
way to do this would be for "A" to, e.g., "ssh B.internal".
This is awkward, though, since from other hosts, outside the
firewall, the command would be "ssh B.external", so it would
be convenient if this address worked internally, too.  

     Unfortunately, it doesn't.  Watching with wireshark, it
appears that the hosts fail to set up a TCP session because of
confusion about addresses.  Traffic arriving at "B" appears to
come from "A.internal", so "B" answers directly to this, causing 
the reply arriving at "A" to appear to be from "B.internal", which 
isn't what "A" was looking for.  

     I realize I could just fudge the issue by fiddling with
DNS entries or /etc/hosts files, but maintaining that becomes
a hassle.

     Can anyone suggest how to make this work transparently?
Do I need to change the masquerading setup so that both internal
and external interfaces are masqueraded?  That sounds like it's
asking for trouble.

     Thanks in advance,
     Bryan
--
========================================================================
Bryan Wright              |"If you take cranberries and stew them like 
Physics Department        | applesauce, they taste much more like prunes
University of Virginia    | than rhubarb does."  --  Groucho 
Charlottesville, VA  22901|
(434) 924-7218            |         bryan@virginia.edu
========================================================================



