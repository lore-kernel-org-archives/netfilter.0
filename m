From: michael@floog.net
Subject: Fwd: Re: How to drop/reject packets amongst LAN clients?
Date: Mon, 10 May 2004 10:46:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084211177.409fbfe9b99c3@webmail.floog.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org



----- Forwarded message from michael@floog.net -----
    Date: Mon, 10 May 2004 10:36:27 -0700
    From: michael@floog.net
Reply-To: michael@floog.net
 Subject: Re: How to drop/reject packets amongst LAN clients?
      To: Cedric Blancher <blancher@cartel-securite.fr>

Fantastic mailing list!
I just finished a response to Antony Stone in which I inquired about a
possible 3rd NIC.  I checked my email at the same time and see your
response with an answer about the very inquiry I made only a minute
before!  :-)

Thank you so much for your input.

I think I will read up on this and see if it's something I can handle.

Mike


Quoting Cedric Blancher <blancher@cartel-securite.fr>:

> your box. If you want to achieve this, then you have a Linux box a a
> filtering bridge. Cheap quick recipe would be to add a third
> ethernet
> interface to your box and configure it like this :
> 
> eth0 gos to the internet
> eth1 goes to a switch where *.2 to *.6 are connected
> eth2 goes to a switch where *.7 to *.9 are connected
> create a bridge (br0) to which belong eth1 and eth2.
> assign br0 former eth1 IP
> 
> Activate bridge filtering (available in stock 2.6 kernels) using
> Netfilter and you're done. Just filter traffic in FORWARD chain,
> using
> physdev match to specify eth1 and eth2 and incoming and/or outgoing
> interface, and restrict traffic other than IP stuff using ebtables.
> 
> See http://ebtables.sourceforge.net/ documentation section.
> 
> 
> -- 
> http://www.netexit.com/~sid/
> PGP KeyID: 157E98EE FingerPrint:
> FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature virus.
> >> Copy me to your signature file and help me spread!
> 





----- End forwarded message -----






