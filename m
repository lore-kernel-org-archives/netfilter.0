From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: IPSec passthrough
Date: Wed, 28 May 2003 08:33:25 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D12@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: dhiraj.2.bhuyan@bt.com, netfilter@lists.netfilter.org

A Helper module would be needed, why not put a single tunnel on the =
firewall and route them through?? Why does each machine required to have =
it's own tunnel? I guess you have your own reasons but a single tunnel =
at the firewall is 1 solution for now..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: dhiraj.2.bhuyan@bt.com [mailto:dhiraj.2.bhuyan@bt.com]
Sent: Wednesday, May 28, 2003 1:45 AM
To: netfilter@lists.netfilter.org
Subject: IPSec passthrough


Dear List,
Does anyone know whether there is patch that will allow kernel 2.4 or
greater to support setting up of multiple IPSec tunnels (passthrough) to =
the
same destination - ie more than one machine behind the firewall trying =
to
set up IPSec tunnel to the "same" remote host? When I was testing kernel
2.4.20 for passthrough capability a few months back, there was no patch =
that
would allow me to do that (single passthorough worked fine). I presume =
this
has something to do with writing a conntrack IPSec helper?
Regards,
Dhiraj Bhuyan
BTexact


