From: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Subject: questions on iptables
Date: Thu, 21 Nov 2002 19:14:43 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005601c291ab$65755a60$3201a8c0@leonardo>
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

    I'm trying to get some rules with netfilter and I'm having difficulties
on it. I'd like your help:

    1) I'd like to setup a connection limit per second on an specific port.
I know this can be done with limit module. Altough, I'd like to have the
limit applied for each IP and not on the port. Example: port 80, 5
connections per second. I'd like to have EACH ip that is connecting over
port 80 to have a 5/sec limit. If one IP reached the limit, only that ip
wouldnt match the rule. Other IPs would access it with no problems. Can this
be done ?

    2) I'd like to make a general rule for blocking connections with SPT =
DPT .... is this possible ?


    Well, thanks for your attention :)

    Sincerily,
    Leonardo Rodrigues



