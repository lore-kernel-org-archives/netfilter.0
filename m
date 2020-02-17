From: Bernd Jerzyna <bjerzyna@gmail.com>
Subject: Problems with CONNTRACK --restore-mark
Date: Mon, 17 Feb 2020 17:32:01 +1000
Message-ID: <CAFOucxXziXWf7zx=6yo1QUWSH+QzNsgG8gvU7Ewx_v6iMHc8Yg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=sodaXXjeED4KTOi0nwRDtWblf5XPPLFBM2Xkq8TbSf0=;
        b=ICp0L02OJUgv1A7F90U9KcTL0PLYfZ64MDTRrfVBweYioo5CKk4B5jm4eInD6UK8nf
         6MNvPJZ74rqeWA9QOCSAKeebrONYjr4HOjc+lig2MJlPRPdZ+t2yJ1kuVMuGpqCw/4/K
         ke0nwAxL5gcHcREDdhyL6LYU2bshlBCuwqxYr6Z8b6w/5bK31JecSaRT5Dq/Jk7ehfTM
         U2MMZ6hf+ezkCM5OxLNvCwimg9oVY6+S/+6rc07gEF44TKdKzbK7avVUlk10RsMOf1n8
         cMd4DNwbYfd81AMyaAtepcvdIPpVnGwcmJjjbgmUMTalmno91wRX0biD38wJGAzHMFPt
         qjFg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

I'm having trouble marking a connection.

My iptables configuration is

[root@arnott ~]# iptables -t mangle -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
set_connmark  tcp  --  anywhere             anywhere             tcp
dpt:telnet state NEW
MARK       tcp  --  anywhere             anywhere             tcp
dpt:telnet MARK set 0x2
CONNMARK   tcp  --  anywhere             anywhere             tcp
dpt:telnet CONNMARK restore

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain set_connmark (1 references)
target     prot opt source               destination
MARK       tcp  --  anywhere             anywhere             tcp
dpt:telnet MARK set 0x1
CONNMARK   tcp  --  anywhere             anywhere             tcp
dpt:telnet CONNMARK save

What I expect is that on the first packet a connection mark is set
(0x1) and that it is restored to the packet mark for every packet in
that connection (after setting the packet mark to 0x2).

What I see, though, is that this only works for the first packet as
the iptables TRACE shows:

raw:PREROUTING:policy:4                      16835 TCP    10.3.118.45
   50759 94.142.241.111  23    ---        ['DF', 'SYN', 'OPT']
mangle:PREROUTING:rule:1                     16835 TCP    10.3.118.45
   50759 94.142.241.111  23    ---        ['DF', 'SYN', 'OPT']
mangle:set_connmark:rule:1                   16835 TCP    10.3.118.45
   50759 94.142.241.111  23    ---        ['DF', 'SYN', 'OPT']
mangle:set_connmark:rule:2                   16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x1        ['DF', 'SYN', 'OPT']
mangle:set_connmark:return:3                 16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x1        ['DF', 'SYN', 'OPT']
mangle:PREROUTING:rule:2                     16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x1        ['DF', 'SYN', 'OPT']
mangle:PREROUTING:rule:3                     16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'SYN', 'OPT']
mangle:PREROUTING:policy:4                   16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x1        ['DF', 'SYN', 'OPT']
nat:PREROUTING:policy:1                      16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x1        ['DF', 'SYN', 'OPT']
mangle:FORWARD:policy:1                      16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x1        ['DF', 'SYN', 'OPT']
filter:FORWARD:policy:1                      16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x1        ['DF', 'SYN', 'OPT']
mangle:POSTROUTING:policy:1                  16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x1        ['DF', 'SYN', 'OPT']
nat:POSTROUTING:policy:1                     16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x1        ['DF', 'SYN', 'OPT']
wire:POSTROUTING:policy:1                    16835 TCP    10.3.118.45
   50759 94.142.241.111  23    0x1        ['DF', 'SYN', 'OPT']
raw:PREROUTING:policy:4                      16836 TCP    10.3.118.45
   50759 94.142.241.111  23    ---        ['DF', 'ACK']
mangle:PREROUTING:rule:2                     16836 TCP    10.3.118.45
   50759 94.142.241.111  23    ---        ['DF', 'ACK']
mangle:PREROUTING:rule:3                     16836 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
mangle:PREROUTING:policy:4                   16836 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
mangle:FORWARD:policy:1                      16836 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
filter:FORWARD:policy:1                      16836 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
mangle:POSTROUTING:policy:1                  16836 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
wire:POSTROUTING:policy:1                    16836 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
raw:PREROUTING:policy:4                      16837 TCP    10.3.118.45
   50759 94.142.241.111  23    ---        ['DF', 'ACK']
mangle:PREROUTING:rule:2                     16837 TCP    10.3.118.45
   50759 94.142.241.111  23    ---        ['DF', 'ACK']
mangle:PREROUTING:rule:3                     16837 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
mangle:PREROUTING:policy:4                   16837 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
mangle:FORWARD:policy:1                      16837 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
filter:FORWARD:policy:1                      16837 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
mangle:POSTROUTING:policy:1                  16837 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
wire:POSTROUTING:policy:1                    16837 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
raw:PREROUTING:policy:4                      16838 TCP    10.3.118.45
   50759 94.142.241.111  23    ---        ['DF', 'ACK']
mangle:PREROUTING:rule:2                     16838 TCP    10.3.118.45
   50759 94.142.241.111  23    ---        ['DF', 'ACK']
mangle:PREROUTING:rule:3                     16838 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
mangle:PREROUTING:policy:4                   16838 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
mangle:FORWARD:policy:1                      16838 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
filter:FORWARD:policy:1                      16838 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
mangle:POSTROUTING:policy:1                  16838 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']
wire:POSTROUTING:policy:1                    16838 TCP    10.3.118.45
   50759 94.142.241.111  23    0x2        ['DF', 'ACK']


Using conntrack -E -d 94.142.241.111 I can see that the connection
mark is maintained at 0x1.
This is a test case iptables configuration to try to isolate the problem.

[root@arnott ~]# iptables --version
iptables v1.4.21

I'd appreciate any help with this.

Best regards
Bernd
