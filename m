From: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Subject: question on recent module
Date: Fri, 24 Jan 2003 11:17:40 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c2c3b3$5adfe4a0$3201a8c0@leonardo>
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

    I'm trying to setup recent module for doing some great things here :)
Basically what I want is. Match some kind of traffic and, if that happens,
traffic for that source address will be completly and silently dropped. All
examples of recent module I found were used on FORWARD chain, which is not
my case, as machine running recent will be the final destination of the
connection.

    So, seems I'm successfully matching packets I need (
/proc/net/ipt_recent/myrulename ) is created and sources are being added
there. What I need now is: how can I make a rule on filter OUTPUT to DROP
all traffic if the source address was matched by recent module ? As I read,
I can only check recent matches against source address ( --rcheck ). In
OUTPUT chain, source address is my own address and the address I need to
match is the DESTINATION one.

    Can recent module help me in this situation ? Hope you understood it.

    Anyway, thanks for your attention :)

    Sincerily,
    Leonardo Rodrigues


