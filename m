From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: iptables-like firewall for windows?
Date: Fri, 22 Aug 2003 18:22:27 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DKEDJAAMDCDBHFKPBEMPIEJBCHAA.markee@bandwidthco.com>
References: <3F461A22.90300@bus.okstate.edu>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F461A22.90300@bus.okstate.edu>
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
To: Jason Joines <joines@bus.okstate.edu>, netfilter@lists.netfilter.org

Take a look at Pktfilter at http://www.hsc.fr/ressources/outils/pktfilter/
It's stateless, but very good and quite flexible nevertheless.  Also, like
netfilter, it's free.  I've been using it for about eight months and it gets
the job done very well indeed.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Jason Joines
Sent: Friday, August 22, 2003 6:27 AM
To: netfilter@lists.netfilter.org
Subject: OT: iptables-like firewall for windows?


  We have a completely Linux back-end environment but unfortunately
hundreds of windows desktops.  I'm pretty tired of all the attacks on
the unprotected windows boxes but don't have the authority to put up a
network firewall.  We protect all of our Linux servers with iptables.
Does anyone know of a similar tool for windows, particularly w2k?  The
built-in stuff seems to be virtually worthless.

Thanks,

Jason Joines
Open Source = Open Mind
========================





