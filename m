From: "Akos Szalkai" <szalkai@2fkft.com>
Subject: mangle after nat in the postrouting chain
Date: Fri, 28 Nov 2003 18:33:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031128173350.GJ5232@2fkft.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello,

is there any kind of patch (or even consideration to create one) for
packet mangling in the POSTROUTING chain after NAT?  (At least as far as
I see, right now it's mangle first, then NAT.)  I can also see the
advantages of mangle before NAT, so perhaps the ideal solution would be
mangling twice on the POSTROUTING chain, if it is possible.

The situation where I would find mangling after NAT very handy is the
following.  I have two independent internet connections, and a few NAT
rules which eventually decide the source address of the outgoing packet.
And only now, knowing the source address is it possible to route the
packet correctly.  Since we are way after routing here, only mangle
could help.

Please correct me if I am not understanding things correctly.

Akos

-- 
Akos Szalkai <szalkai@2f.hu>
IT Consultant, CISA
2F 2000 Szamitastechnikai es Szolgaltato Kft.
Tel: (+36-1)-4887700  Fax: (+36-1)-4887709  WWW: http://www.2f.hu/

