From: Fred Richards <Toril@twcny.rr.com>
Subject: Web based Netfilter Frontend?
Date: Mon, 03 Jun 2002 22:45:28 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFC29C8.5090505@twcny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.samba.org>

	Ok, here comes another goofy thread attempt by yours truely.  (Last time 
my request ended up being possible to accomplish in a much different 
matter).

  	I have a simple question... I've been using netfilter on a few 
different machines, Slackware mostly, 2.4.18 and .19 kernels, IPtables 
1.2.6a.  I like using the endosheild script, I've modified it to do 
exactly what I need to.  I pay for 3 IP addresses from my cable provider 
and am thinking of cancelling 2 to route everything through the main 
dedicated linux box ... it's all set and ready to go.

	And the question is... are there any web-based frontends for modifying 
IPtables rules?  Something in PHP or maybe perl?  Even if they're not 
that fancy, and only allow modifications of incoming DNAT rules (kinda 
like port forwarding.)  My thinking is that my wife runs servers all the 
time, on different ports all the time.  I want her to be able to go to a 
local page, on the Lan side of the linux machine, use a few drop down 
boxes to modify incoming rules to forward ports to her machine.  I know 
how to do this on the command line... but to have her be able to do it 
on the fly instead of me modifying them all the time is desirable.  (Her 
local ip would also never change.  The local network is 172.16.0.0/28 
with the lower 7 ips reserved for static addresses, and the upper handed 
out by a dhcp server on the linux box, for guests, etc.)

	Anyone know of a good way to do this?  I have everything in place ... the 
dhcp server, the netfilter script, the rules, the natting, etc.  Just 
need a simple way to modify already exsisting rules.  I've looked on 
freshmeat, but can't find exactly what I need ... any help would be 
appreciated ... thanks...

						-- Fred


