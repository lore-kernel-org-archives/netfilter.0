From: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Subject: detect portscans in DNATed ports
Date: Thu, 10 Oct 2002 09:33:59 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004001c27059$4ede7fc0$3201a8c0@leonardo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter ML <netfilter@lists.samba.org>


    Hello Guys,

    I've a firewall script that deals with portscan in its external
interface. I'm doing that using psd module, which works just fine for this
situation. psd module is being called on INPUT rule.

    Altough it works absolutely fine when someone tries to portscan the
firewall, it seems to show all DNATed ports on the scanner. I'm sure it's
doing that because no DNATed packet reached INPUT rule, where psd is being
applied.

    Question is: in which chain/rule should I use psd module to get portscan
in DNATed ports ?? I was thinking in doing this on NAT OUTPUT .... what do
you think ?

    Sincerily,
    Leonardo Rodrigues


