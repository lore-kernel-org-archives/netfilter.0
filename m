From: "Svein E. Seldal" <Svein.Seldal@solidas.com>
Subject: Re: FTP/auth problems (slooow links)
Date: Sun, 13 Oct 2002 22:36:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA9D952.3030709@solidas.com>
References: <3DA97045.2040803@solidas.com> <20021013164821.GA689@Ajftl1.ajfthome.on.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alistair Tonner <Alistair@alistairt.ath.cx>
Cc: netfilter@lists.netfilter.org

Alistair Tonner wrote:
 >
 >     I wonder ... are the boxes inside purely WIN boxes?

No. I've tested mostly all combinations of servers (win/linux), clients 
(win/linux), client apps. (ftp/ie/leech/etc.), and the conclusion is 
clear: Once the connection has gone through, then the data throughput is 
what it is expected to be. Example: one large file takes the same amount 
of time, regardless of it being transferred directly vs. through the 
router. But many small files are considerable slower (up to 100 times 
slower).

I have got reports that (external and internal) websites can take very 
long time to come up, but once it has connected to the server, then the 
data comes very quickly. I have got a gut feeling that this initial 
connection opening delay is the same we are seeing on the FTP, only its 
more evident on FTP. If I'm connecting to websites internally, the 
complete page comes up very quickly. But if I try to connect to the same 
page, via. the router, then the pictures takes very long time to complete.

So, I'm rephrasing the question: "What can be the reason that the router 
is having such long initial delays on connections?"

 >     -- What sort of outside connection do you have?

2.3MBit SDSL. The data from my router is going into a DSL router from
cisco. I.e internet -- cisco dsl router -- linux router -- lan. However
for the testing on this example, the data goes from lan to linux router
to lan again, never via. the cisco router nor the dsl link. The linux
router is sole reason for the delay!

And I dont think this is a MTU issue here, as the router and the server 
and the client is all sharing the same network switch. If a packet from 
the client is received on the router addressed to the server, then it 
will be received on eth0 and transmitted on eth0 again.


Thanks,
Svein E. Seldal



