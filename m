From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: Linux/Windows pure SSL "VPN" Solution
Date: Wed, 2 Jun 2004 18:23:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16574.21333.1170.59072@saint.heaven.net>
References: <564DE4477544D411AD2C00508BDF0B6A206AAD93@usahm018.exmi01.exch.eds.com>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <564DE4477544D411AD2C00508BDF0B6A206AAD93@usahm018.exmi01.exch.eds.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Small, Jim" <jim.small@eds.com>
Cc: netfilter@lists.netfilter.org

Small, Jim writes:
> I've looked at OpenVPN, CIPE, and vTun, but none of them appear to work only
> over port 443.  OpenVPN works over 443, but also requires UDP/5000 which is
> not possible.

OpenVPN defaults to port 5000 but does not require port 5000.  You can
run it without ever touching port 5000.

In addition, OpenVPN is advancing rapidly, and its author, Jim Yonan,
is very open to feature requests.  There is a substantial user base
and an active openvpn-users mailing list at sourceforge.net.

--
Dick St.Peters, stpeters@NetHeaven.com 

