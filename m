From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: RE: TCP delay, SMTP errors
Date: Tue, 11 Jun 2002 08:54:25 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <093e01c21160$464b2e60$2901a8c0@amos>
References: <3D052994.CD0F1237@planetconnect.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D052994.CD0F1237@planetconnect.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


Ramin wrote:

> First you have to find out what the reason of this delay is. Eg, is
this
> because of the load on the server or the client or is it because of
the
> poor layer 2 medium (lots of collisions...) or any other reason.
The load on the our switch is low. 99% idle on the firewall, and 90% on
the internal web server, both dual PIII's.

> Are you here implying that the delay is because of the NAT'ed
architecture?
That is my suspicion. I recall Linux NAT doing this type of thing
before.

> What does a simple ping show delay-wise?
Nothing irregular, all the ping times are the same.

> What is the routing to and from that external host? Is it asymmetric?
Static routing, one external network device.

> What happens if you connect to this external host from the external
interface of the firewall itself?
> Are you still experiencing delays?
Yes, the same delay is present connecting from the firewall.

> Is this only happening with TCP or all types of packets would have the
same delay?
Doing DNS queries using the dig program to our external DNS server is
fast. It seems
to be a delay in sending initial TCP data. 

Doug wrote:

> what happens when you use telnet from the website box to the mail
server's port 25?
> Do you get a delay rec'ving the SMTP banner?
Here is a delay of about a five seconds, then the SMTP banner displays. 

> Likely has nothing to do with netfilter...my money's on a paranoid
SMTP trying to
> do a reverse DNS lookup (or identd?) causing the delay. Maybe there's
no PTR record
> for the NAT (public) IP of the website?
I don't think so, try it for yourself (www4.cjhunter.com, 63.174.37.3).
We have no ident checks.

> Maybe your SMTP server has a big-ish list of DNS hosts to try before
it finally timesout?
Connecting to the mail server in quite fast outside the NAT'ed network.


Thanks for your good questions that help define the situation better.
Some extra info. 

Inbound connections are only allowed through --state
ESTABLISHED,RELATED.

Is there any way to explain these delays?


