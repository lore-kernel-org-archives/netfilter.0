From: Nathan Whittacre <nwhit@whittrio.com>
Subject: Connection Tracking
Date: Mon, 06 Oct 2003 10:42:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F81A99B.4000102@whittrio.com>
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
To: netfilter@lists.netfilter.org

I have the following situation:

A server for what is called directed host sits behind a NAT'd firewall 
with a local IP.  I have port 1066 forwarded to that server(10.2.0.1). 
The way this protocol works is that the remote computer connects to it 
on port 1066, exchanges some data over the existing connection and then 
the server initiates a connection back to the client on the client's 
port 1066.  This is fine as long as the client has a static, un-NAT'd 
internet IP, but the connection is dropped by the server if it does not 
get a reply from port 1066.  I have a few client machines on a NAT'd 
network that need to connect to this remote server, but with only one 
gateway internet IP.  They do not necessarily need to connect at the 
same time.  Is there any way to write a connection tracking script that 
senses the outbound connection to port 1066 on the remote side and then 
DNATs the inbound 1066 to the local IP once the connection is established?

I have a tcpdump of the connection avaiable if that would be of any help.

Thank you,
Nathan Whittacre


