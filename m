From: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Subject: iptables -I with interface behavior
Date: Fri, 7 Jan 2011 12:05:05 +0100
Message-ID: <9F69795E29C890408AC2DAF646C89BB37998F4E870@MAILBOX.arc.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello List,

I have encountered an unexpected behavior using iptables on Ubuntu lucid and would like to hear your opinition on it:

In a custom firewall setup, I have defined variables for the various interface names, I use them e.g.

Iptables -A FORWARD -i  "${MyInterfaceName}"  -j FORWARD-SOMECHAIN

Due to a configuration, the variable was empty, the execution of

Iptables -A FORWARD -i  "" -j FORWARD-SOMECHAIN

was equivalent to

Iptables -A FORWARD  -j FORWARD-SOMECHAIN

which would have caused a security problem. I would have expected the iptables call to
a) fail with "empty interface name" error or
b) work, but only jump on packets from interface "", so the rule would never jump to the table.

The man page on Ubuntu lucid would also indicate that that is unexpected:

       [!] -i, --in-interface name
              Name  of  an interface via which a packet was received (only for
              packets entering the  INPUT,  FORWARD  and  PREROUTING  chains).
              When  the  "!"  argument  is used before the interface name, the
              sense is inverted.  If the interface name ends in  a  "+",  then
              any  interface  which begins with this name will match.  If this
              option is omitted, any interface name will match.


Do you think, that
a) documentation should be updated
b) iptables or kernel should be updated
c) my interpretation of documentation is wrong

Kind Regards,
Roman

PS: I have not checked what iptables sends to kernel link and how kernel uses the name. So cause could be in iptables application or kernel layer.
