From: Eddahbi Karim <installation_fault_association@yahoo.fr>
Subject: UDP connections and Conntrack...
Date: Sat, 03 Jan 2004 06:04:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073106266.24037.13.camel@gamux>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hiya,

When a client sends an UDP datagram to an UDP server, the connection is
ESTABLISHED when the server sends back an UDP datagram and the client
sends another UDP datagram or does the connection is ESTABLISHED when
the server answer to the first UDP datagram ?

For example, is it like that :

Client -> DATA -> Server
Client <- DATA <- Server

Connection ESTABLISHED for the server !

Or

Client -> DATA -> Server
Client <- DATA <- Server
Client -> DATA -> Server

Connection ESTABLISHED for the server !


Thanks,


-- 
--
Eddahbi Karim

Phone :
(33) (0)6 61 30 57 77

France


