From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: IRC and Conntrack problem
Date: Sun, 3 Nov 2002 06:15:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021103111528.GA14182@Ajftl1.ajfthome.on.ca>
References: <00d601c28286$83cf1390$6928a8c0@MIHAI>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00d601c28286$83cf1390$6928a8c0@MIHAI>; from cloud@sky.kappa.ro on Sat, Nov 02, 2002 at 10:42:56 -0500
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Mihai Tanasescu <cloud@sky.kappa.ro>
Cc: netfilter@lists.netfilter.org


	1) the ipt_conntrack_irc and ipt_nat_irc modules need to know  
what
	    ports you are connecting to the IRC servers on.  You pass 
these
	    port numbers as a parameter to the module when loaded.

	2) IRC clients behind the firewall *must* use their *inside* ip
	    address *not* the firewall ip address ... this is notable in
	    MIRC -- the client defaults to using the ip reported by the
	    server. -- that turns the connection requests into something
             that iptables will drop as a forged IRC command -- check
             your logs.


  In my case:
/sbin/modprobe ip_conntrack_irc 
ports=6663,6664,6665,6666,6667,6668,6669,7000
/sbin/modprobe ip_nat_irc ports=6663,6664,6665,6666,6667,6668,6669,7000

You can edit ip_conntrack_irc.c and ip_nat_irc.c and change MAX_PORTS 
if you
  need more ports to connect to and then rebuild the modules.
	 

On 2002.11.02 10:42 Mihai Tanasescu wrote:
> I have installed the kernel module for conntracking irc connections.
> Still I can only receive dcc sends but I can't initiate any dcc send
> sessions. I get the error message failed to connect or something like
> that.
> What am I doing wrong?
> 


