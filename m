From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: invert problem with multiport
Date: Tue, 18 Jun 2002 15:18:22 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPMEDKCGAA.stewart.thompson@shaw.ca>
References: <3D0F56B9.5952D779@conterra.de>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D0F56B9.5952D779@conterra.de>
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
To: Christoph Gossen <gosen@conterra.de>, netfilter@lists.samba.org

Hi Christoph:

	I am still running iptables 1.24. However, in that version I
don't think it supported the ! negation on multiport. Later versions
may have added that capability. Perhaps one of the members of
the list has a more definitive answer.

Stu...............



-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of Christoph Gossen
Sent: June 18, 2002 8:50 AM
To: netfilter@lists.samba.org
Subject: invert problem with multiport

Hello,

I think there's a bug in the behaviour of the multiport module - for
example, a line like

        iptables -p tcp -A OUTPUT -m multiport ! --dport 25 -j DROP

causes the same behaviour as

        iptables -p tcp -A OUTPUT -m multiport --dport 25 -j DROP

or

        iptables -p tcp -A OUTPUT --dport 25 -j DROP

and NOT (as one would expect) that one caused by

        iptables -p tcp -A OUTPUT ! --dport 25 -j DROP

Inverting the (set of) port(s) due to the "!" sign in the first line
above is just ignored
(no syntax error occures)!

Any comments?

Thanks,

Christoph



