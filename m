From: Sandro Dentella <sandro@e-den.it>
Subject: fwmark & route pb
Date: Mon, 24 Oct 2005 18:40:00 +0200
Message-ID: <20051024164000.GA20276@casa.e-den.it>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

  I already sent this mail to LARTC mailing list w/ no luck so I hope to find
  more hints in this list...

  I use '-t mangle ... -j MARK' to mark packets that a rule 'ip rule
  fvwmark' will route to a specific table. This is primarily to test if a
  connection is available without messing with everybody's routing
  table. (Actually I have and 'adsl' teble and an 'isdn' table)

  What happens is that packets go to a test host in the internet, come back,
  are visible to tcpdump... but not to ping!

  I *think* it's a routing problem since ig I use the 'isdn' table as default
  ping works normally.


  I can't immagine what happens to the packet between being seen by tcpdump
  and arriving at ping...

  I described my setup a litte more deeply here:
  http://mailman.ds9a.nl/pipermail/lartc/2005q4/017168.html

  TIA
  sandro
  *:-)

-- 
Sandro Dentella  *:-)
http://www.tksql.org                    TkSQL Home page - My GPL work

