From: Stuart Bailey <Stuart.Bailey@ast-uk.com>
Subject: Input interface not showing in iptables-save for mangle table
Date: Tue, 4 Jul 2017 13:36:16 +0000
Message-ID: <823DAD67B7E6624DB0F0E7732DED62128CFF7F1E@ASTMBX01.ast.ast-uk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


Hello,
I have a program that creates firewall rules using libiptc. One rule that is created is an entry in teh mangle table.
This is displayed using iptables -L -v -t mangle:

# iptables -L -v -t mangle
Chain PREROUTING (policy ACCEPT 3160 packets, 541K bytes)
 pkts bytes target     prot opt in     out     source               destination        
 6282 1245K MARK       tcp  --  wifi4  any     anywhere             anywhere             ! match-set users_list src MARK set 0x63
 6282 1245K MARK       tcp  --  lan4   any     anywhere             anywhere             ! match-set users_list src MARK set 0x63
    0     0 MARK       tcp  --  wifi4  any     anywhere             anywhere             match-set users_list src MARK set 0x1
    0     0 MARK       tcp  --  lan4   any     anywhere             anywhere             match-set users_list src MARK set 0x1


This clearly shows the input interface as wifi4 and lan4.

However, if I use iptables-save, the input interface is missing:

*mangle
:PREROUTING ACCEPT [3239:547882]
:INPUT ACCEPT [3233:547072]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [3233:508803]
:POSTROUTING ACCEPT [3233:508803]
-A PREROUTING -p tcp -m set ! --match-set users_list src -j MARK --set-xmark 0x63/0xffffffff
-A PREROUTING -p tcp -m set ! --match-set users_list src -j MARK --set-xmark 0x63/0xffffffff
-A PREROUTING -p tcp -m set --match-set users_list src -j MARK --set-xmark 0x1/0xffffffff
-A PREROUTING -p tcp -m set --match-set users_list src -j MARK --set-xmark 0x1/0xffffffff


What can cause this problem?

My program adds the interface to the iptc_entry struct:


        struct ipt_entry            *pEntry;

        ...

        pEntry->ip.src.s_addr  = 0;
        pEntry->ip.dst.s_addr  = 0;
        pEntry->ip.smsk.s_addr = 0;
        pEntry->ip.dmsk.s_addr = 0;
        pEntry->ip.proto       = protocolToUint(pProtocol);
        pEntry->ip.flags       = 0;
        pEntry->ip.invflags    = 0;

        if (_pIface)
            strncpy(pEntry->ip.iniface,  _pIface, IFNAMSIZ);



Many thanks,

Stuart

This email and any attachments are confidential and intended solely for the individual to whom it is addressed. Any view or opinion expressed belongs solely to the author and does not necessarily represent those of Applied Satellite Technology Ltd, its subsidiaries or any affiliated group company (AST).

If you are not the intended recipient please do not disclose, copy or distribute information in this email nor take any action in reliance of its content; to do so is strictly prohibited and may be unlawful. Please inform us if you have received this message in error before deleting it. All liability is excluded to the extent permitted by law for any claims arising as a result of the use of this medium to transmit information by or to AST. Thank you for your co-operation.

Applied Satellite Technology Ltd | Company Number: 2153172 England | Registered Office: Satellite House, Bessemer Way, Harfreys Industrial Estate, Great Yarmouth, Norfolk NR31 0LX (UK)
