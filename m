From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: REDIRECT after SNAT?
Date: Sat, 24 May 2003 11:37:45 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CC8@wardrive.citadelcomputer.com.au>
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
To: Paul Clark <paul@xmill.com>, netfilter@lists.netfilter.org

I know what your trying to do.. there is no way really as even large =
ISPs who use TProxies don't do this and when you browse some sites they =
say "Hey, your from <insert IP here>" and it's not yours...

The reason it won't work is that once REDIRECT runs it enters Squid =
immediately and squid then takes over and you can't change the address.
If you SNAT it first, then it just goes out and the REDIRECT won't =
activate..

You'd basically have to write your own netfilter module which does this =
and maybe it could work..

eg.

iptables -A PREROUTING -t nat -i $INTDEV -p tcp --dport 80 -m =
SNEAKYMODULE --use_orig_source -j REDIRECT --to-port 3128

that would be nice.. ;)

Some websites are now smarter and they ignore HTTP_REMOTE server =
variables because they also see a X_HTTP_FORWARDER variable which the =
proxy adds to the header as showing the REAL source of the request.. =
this is usually the client not the proxy IP.. but it's up to the website =
to know this..

-----Original Message-----
From: Paul Clark [mailto:paul@xmill.com]
Sent: Saturday, May 24, 2003 3:07 AM
To: netfilter@lists.netfilter.org
Subject: REDIRECT after SNAT?


Hi,

Is there any way to force a REDIRECT to (e.g.) a local Web server =
_after_
SNAT has been done?  I have a Truly Evil Scheme to map VLANs to SNAT =
address
ranges, and I want it to work with a transparent proxy -on the same =
device-
(I'm pretty sure it would work fine split across two devices).

The problem is that the SNAT has to happen in nat:POSTROUTING, and =
REDIRECTs
have to happen in nat:PREROUTING - so by the time my Evil SNAT Hackery =
has
happened, it's too late to force it to the local machine.

Is there such a thing as a 'retry this packet from the beginning' =
target?

Thanks in advance

Paul




