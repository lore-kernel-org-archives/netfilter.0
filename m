From: =?iso-8859-1?Q?Gunnar_Fr=F6din?= <gunnar68@gunfro.com>
Subject: Re: Port forwarding.
Date: Mon, 28 Jun 2004 15:21:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000b01c45d12$c159aa50$6600a8c0@simba>
References: <001301c45cf0$9f7cf710$6600a8c0@simba> <200406281134.37964.Antony@Soft-Solutions.co.uk> <001b01c45d0a$5529b7b0$6600a8c0@simba> <200406281352.20521.Antony@Soft-Solutions.co.uk>
Reply-To: =?iso-8859-1?Q?Gunnar_Fr=F6din?= <gunnar68@gunfro.com>
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

Okey it works now........
The fault was in question 3.
the mail server pointed at another router/firewall.
and the mail server reported the "external" ip# in response to a smtp helo
command. nice :-) but as I understan it shound't well well.

Thanks for now Antony.

Regards Gunnar



Okay, three more questions:

1. Is a mail server running on 192.168.0.100 (!) ?   Can you telnet to it on
the real 192.168.0.100 address from a local client?

2. Are there any access controls on the mail server, restricting the IPs
from
which it will accept connections?

3. Does the default route of the mail server point back to the firewall?

Regards,

Antony

--
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the
list;
                                                           please don't CC
me.




