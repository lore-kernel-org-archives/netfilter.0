From: David Larson <digitaldavel@yahoo.com>
Subject: multi-homed responses to DNAT'd packets
Date: Sat, 30 Nov 2002 22:00:11 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021201060011.86334.qmail@web40302.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Anyone using DNAT (port-forwarding) on a multi-homed
linux box with netfilter?  I am having trouble getting
it to work.

My system is multi-homed (dsl and cable) and I have a
box with route2 configured to support inbound
connections to SMTP and HTTP services.  It is all
working fine with response packets going out the
correct interface.

I am trying to move these services off of the
firewall/router box.  I tried to configure DNAT to
"port-forward" these services to a new box, and the
DNAT starts out working fine, from the original
request (from outside), NAT'd properly to the new
inside box, the response goes back through the
firewall/router box, and the response gets NAT'd
properly, BUT ... the packet goes out the wrong
interface!  It goes out the interface of the "default"
gateway.

It appears that the iproute2 configuration is being
ignored.  I am using source routing to get packets
steered out the correct interface.

Any help much appreciated.
Dave Larson


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

