From: Alain Fauconnet <alain@cscoms.net>
Subject: how can 'iptables -D ...' get EAGAIN?
Date: Fri, 20 Dec 2002 14:48:12 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021220144812.B16450@cscoms.net>
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

On a server that has a very dynamic set of iptables  rules  (used  for
traffic accounting), I occasionally see a  'iptables  -D ...'  command
in the session start or session end scripts return:

iptables: Resource temporarily unavailable

I've checked the source  code  for  any  occurance  of  EAGAIN  (which
matches this message) but there isn't any.

Can someone explain in which case iptables would get a EAGAIN error?

This  is  a -D (delete rule) command, not -L, so I don't think that it
can be DNS-related, can it?

Thanks in advance for any hint,
Greets,
_Alain_

