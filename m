From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: track bandwith used
Date: Wed, 30 Jun 2004 15:46:28 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <13c101c45ed2$8db2b9a0$49caa8c0@caris.priv>
References: <00e501c45ea3$28e2d110$49caa8c0@caris.priv> <200406301717.52224.Antony@Soft-Solutions.co.uk> <138c01c45ec2$8467d480$49caa8c0@caris.priv> <200406301807.57782.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

yes it does.  Thank you very much.  I have been looking for an explanation
like that on the net. :)

Do you have a link to where this netfilter documentation is ?

Peter

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Wednesday, June 30, 2004 2:07 PM
Subject: Re: track bandwith used


On Wednesday 30 June 2004 5:51 pm, Peter Marshall wrote:

> You could make a connection out to a remote server.  That remote server
> might try to make a connection back to us that has nothing to do with the
> reason we connected to them.

Such a connection would not be regarded as RELATED by the netfilter code.

>  But the server may see it as related and allow it.

I think you should read about netfilter's definition of RELATED.   It
doesn't
just mean "any packet which comes back from an IP address we're already
talking to".

For example, I said that FTP data connections were RELATED to the FTP
control
connection - but that is only if you have loaded the FTP Conntrack Helper
module, or compiled FTP Conntrack support into your kernel.   That helper is
what RELATEs the two parts of FTP together in netfilter.

Basically, if you don't have a helper module which understands why a
connection should be RELATED to another one, then it won't be.

Arbitrary packets from IP addresses which happen to be part of an
ESTABLISHED
connection don't count - they will be seen as NEW incoming connections, and
make their own way through your ruleset (until they are persumably DROPped),
having no assiciation whatever to anything else which may be in your
connection tracking table.

Hope this clarifies things?

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the
list;
                                                           please don't CC
me.



