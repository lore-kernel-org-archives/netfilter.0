From: "Small, Jim" <jim.small@eds.com>
Subject: Linux/Windows pure SSL "VPN" Solution
Date: Wed, 2 Jun 2004 14:10:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <564DE4477544D411AD2C00508BDF0B6A206AAD93@usahm018.exmi01.exch.eds.com>
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

I have a situation (common) where I need access to my corporate network, but
the vendor will only allow traffic over ports 80 and 443.  The vendor would
like me to do an SSL VPN as they do not want to open other ports (read--no
IPSec).  I would like to do a Linux proof of concept solution using iptables
and some sort of Open Source SSL VPN (Linux server sitting on the Internet
or in one of our DMZs).

This looks promising:  http://www.hsc.fr/ressources/outils/ssltunnel/
It's just what I'm looking for but it doesn't support Windows clients.

I've looked at OpenVPN, CIPE, and vTun, but none of them appear to work only
over port 443.  OpenVPN works over 443, but also requires UDP/5000 which is
not possible.

Does anyone know of a pure (TCP/443 only) SSL Open Source solution?

Thanks,
   <> Jim

PS  I realize this is not a pure iptables question, so I'm prepared for
flames...  ;-)


