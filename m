From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Is ip_conntrack_ftp needed for 1:1 nat?
Date: Wed, 07 Jun 2006 14:56:31 +0200
Message-ID: <4486CCFF.2070903@plouf.fr.eu.org>
References: <A78C6C481BFAE949BC5990E1EEB2FE1257BF@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A78C6C481BFAE949BC5990E1EEB2FE1257BF@q.LeBlancNet.us>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Robert LeBlanc wrote :
> Is ip_conntrack_ftp needed for 1:1 nat?

The short answer is : yes, and ip_nat_ftp (which needs ip_conntrack_ftp)
is needed too to handle properly any NAT situation.

The longer answer is : the FTP conntrack and NAT helper modules are not
absolutely necessary in all NAT situations. But even in the case when
they are not absolutely necessary, they can make the NAT and filtering 
setup much simpler.

To summarize, what do these modules do ?

In both active and passive modes, ip_conntrack_ftp expects and marks as
RELATED the first packet of an FTP data connection related to an
established control FTP connection.

In passive mode, ip_nat_ftp modifies if necessary (i.e. when the client
address is masqueraded) the address and port numbers in the PORT
commands sent by the client to the server over the control connection
which tell the server which address and port to connect to to establish
the data connection. In passive mode, it modifies if necessary (i.e.
when the server address is masqueraded) the address and port numbers in
the reply to the PASV command sent by the server to the client over the
control connection to tell the client which address and port to connect
to to establish the data connection.

  Note that both modules must be given in the 'ports' parameter the list 
of destination ports that may be used for FTP control connection 
whenever there are  non standard ones (other than 21). This implies that 
you must explicitly load ip_conntrack_ftp before ip_nat_ftp, else 
ip_nat_ftp will automatically load ip_conntrack_ftp but without telling 
it which ports to monitor !

So, when are the FTP helper modules not necessary ?

- In passive mode when the server address is not masqueraded. If the 
client is masqueraded, the NAT device must masquerade and accept any 
connection from the client.

- In active mode when the client address is not masqueraded. If the 
server is masqueraded, the NAT device must masquerade and accept any 
connection from the server with uses the ftp-data source port (20/TCP by 
default).

- In passive mode when the server is masqueraded but is able to send its
apparent address in the PASV reply and to use a restricted range of
local ports for data connections. The NAT device must redirect (DNAT)
and accept NEW connections on this port range to the server private
address.

- In active mode when the client is masqueraded but is able to send its
apparent address in the PORT command and to use a restricted range of
local ports for data connections. The NAT device must redirect (DNAT)
and accept NEW connections on this port range to the client private
address.


