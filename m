From: "Panayiotis Gotsis" <pgotsis@btinternet.com>
Subject: About mangle table
Date: Wed, 12 Jun 2002 01:50:35 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <EPEFJKLDAJCANCAHGNDCOEIEFJAA.pgotsis@btinternet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: netfilter@lists.samba.org

Hello from a newcomer and.. here I go!

The problem I face is something a search in the Internet did not solve,
neither does the documentation on www.netfilter.org

I am trying to use the command

iptables -t mangle -A PREROUTING -s <source_address> -j MARK --set-mark 1
/* the value is for the example, I try to use 2 or 3 also */

I am using iptables 1.2.6a.

The error I get is:

'ptables v1.2.6a: Bad MARK value `1
Try `iptables -h' or 'iptables --help' for more information.

I have seen a lot of tutorials using mark values of 1. Is it a problem with
the new version of Iptables? Am I doing something wrong? Or should I check
for some other problem in my configuration?

Thanks for the time

Panos Gotsis


