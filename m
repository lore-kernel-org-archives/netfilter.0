From: Joost Remijn <remijnj@eidetica.com>
Subject: Re: Arbitrary Netmasks
Date: Tue, 28 May 2002 15:30:31 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0205281529270.27586-100000@fruit.eidetica.com>
References: <20020528132402.GN9802@ns>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020528132402.GN9802@ns>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Frost <sfrost@snowman.net>
Cc: Thomas Heinz <josef.k@mytomorrow.de>, netfilter-devel@lists.samba.org, netfilter@lists.samba.org



On Tue, 28 May 2002, Stephen Frost wrote:

> * Thomas Heinz (josef.k@mytomorrow.de) wrote:
> > Netfilter supports arbitrary netmasks for IP addresses which is more
> > powerful than just those IP/x (0 <= x <= 32) expressions.
> > For example one could use IP/255.0.255.255 (IP/23.13.42.0 would also work
> > ;-).
> >
> > Are masks that cannot be expressed in the IP/x schmeme (at least not in one
> > rule) used in practise? Are they used at all in firewall rulesets?
>
> I'm pretty confident they're not valid and don't make sense.


But something like IP/255.255.255.192 is still valid and is probably used
quite a lot. At least i use it. It's easy to use a $NETMASK variable in
scripts for this.

Joost


