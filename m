From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NATing PPTP GRE traffic
Date: Tue, 20 Jan 2004 14:59:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401201459.06571.Antony@Soft-Solutions.co.uk>
References: <20040120143327.32258.qmail@e-xyn.com> <00d701c3df62$ec8e3e80$686fa8c0@vincent>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00d701c3df62$ec8e3e80$686fa8c0@vincent>
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
To: netfilter@lists.netfilter.org

On Tuesday 20 January 2004 2:37 pm, Derek Vincent wrote:

> Philipp, I not running ppp on the firewall it running on a server behind
> the firewall... so I do not have ppp0 interface...

So substitute the eth0, eth1, or whatever name of your external interface for 
ppp0 in the rules suggested :)

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


