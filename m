From: "Small, Jim" <jim.small@EDS.COM>
Subject: RE: Can netfilter do this?
Date: Thu, 25 Mar 2004 15:53:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <564DE4477544D411AD2C00508BDF0B6A1E7E2A20@USAHM018.amer.corp.eds.com>
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
To: netfilter@lists.netfilter.org

> -----Original Message-----
> > Is netfilter capable of knowing when someone is crafting SMTP (or FTP or
> > HTTP or ...) packets that violate RFC rules to exploit a vulnerability
> > in some server?

Snort is an excellent "tool"/Network Intrusion Detection System.  You might
also be interested in this:
http://l7-filter.sourceforge.net/

Snort is more robust, but also more complex.

<> Jim



