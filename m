From: Fabian Hartmann <realdeal@realdealz.ch>
Subject: RE: Instructions on how to redirect port 80 to port 8080
Date: Wed, 18 Feb 2004 16:01:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077116509.40337e5d7ef5f@www.realdealz.ch>
References: <9908FCB837A50642B74E2BEC198843095CC655@csrees-exchsrvb.csrees.usda.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9908FCB837A50642B74E2BEC198843095CC655@csrees-exchsrvb.csrees.usda.gov>
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
To: "Martinez, Michael" <MMARTINEZ@CSREES.USDA.GOV>
Cc: netfilter@lists.netfilter.org


> The telnet's being done from the box itself, telneting to the network ip
> (not loopback) of the box. The same response occurs if the telnet is
> done from another box.
> 
if you do telnet from the localhost, you must have a rule in the OUTPUT chain, 
which redirects packets from port 80 to 8080. otherwise you won't be 
redirected! (Locally generated packets always go out through OUTPUT chain)

something like this should help
iptables -A OUTPUT -t nat -p tcp --dport 80 -j REDIRECT --to 8080

or try telnet from the LAN, which should work with the PREROUTING Rule.
> 
> --> -----Original Message-----
> --> From: Fabian Hartmann [mailto:realdeal@realdealz.ch] 
> --> Sent: Wednesday, February 18, 2004 9:53 AM
> --> To: Martinez, Michael
> --> Subject: RE: Instructions on how to redirect port 80 to port 8080
> --> 
> --> 
> --> > 
> --> > This isn't working. I can "telnet `hostname` 8080" and get an http
> --> > response, but when I do "telnet `hostname` 80" the 
> --> response I get is
> --> > "telnet: Unable to connect to remote host: Connection refused."
> --> > 
> --> Where are you doing the telnet from? from the lan or from 
> --> the firewall itself?
> --> 
> --> ---
> --> Fabian Hartmann
> --> 
> --> realdeal@realdealz.ch
> --> www.realdealz.ch
> --> 
> 


---
Fabian Hartmann

realdeal@realdealz.ch
www.realdealz.ch

