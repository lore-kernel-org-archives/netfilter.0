From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: no route to host on port 80
Date: 11 May 2003 04:06:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052640379.10080.104.camel@alpha.newkirk.us>
References: <3EB5D2C1.5080001@ruffrecordings.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EB5D2C1.5080001@ruffrecordings.com>
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
To: Tim Dionne <tim@ruffrecordings.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2003-05-04 at 22:56, Tim Dionne wrote:
> Hi --
> 
> I'm trying to allow outside access to my linux box on port 80.  However,
>    when I try to connect (using a web browser, or telnet) the connection
> is not created.  When I use telnet and specify port 80 I get a "no route
> to host" error.  I've experimented with my firewall by completely
> removing all rules from all chains, but the connection can still not be
> made.  I can establish connections on all other ports except 80!  Can
> anyone help me?
> 
> Thanks.
> 

Hmmm.  If this is a connection from outside that's failing, it sounds
like an ISP blocking port 80 inbound to me.  I have that situation with
VerizonDSL, and have been forced to run Apache on port 83.  (either that
or pay $30/month extra for 'business' instead of 'residential' service -
everything the same except static IP and port 80 unblocked)

If you have the machine on a LAN then ensure that you can successfully
access port 80 from the LAN.  If it stands alone, then at least try
browsing from it to http://localhost:80 and make sure you can access it
that way.  If all of that is successful, try setting Apache (or whatever
web server) up to respond to requests on a different port number, and
try accessing it from outside with the explicit port number. 

j



