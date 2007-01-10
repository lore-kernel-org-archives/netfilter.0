From: "Matt" <Matt@PlumSoftware.co.uk>
Subject: RE: 2 Internet connection and one local network
Date: Wed, 10 Jan 2007 14:39:35 -0000
Message-ID: <117F5E7DA31C17478948DC39E01B948B400F9F@frost.PlumSoftwareLtd.local>
References: <45A3520F.9020400@techside.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <45A3520F.9020400@techside.it>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Sorry I missed this part:

>>>What is the meaning of: echo 0 > =
/proc/sys/net/ipv4/conf/eth1/rp_filter

I think it disables the reverse path filter for that interface (eth1). =
Now you might ask, what is the reverse path filter? And I don't know! =
Apparently it does this:

> # prevent incoming packets on masqueraded connections from being =
dropped
> # as "martians" due to the destination address being translated before =
the
> # rp_filter check is performed

However, when I commented out the line it made no difference so I've =
left it there for people to comment back in if they find they have =
problems as described.


Regards,

Matt.




