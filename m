From: "Anna Skorokhodova \(newmail\)" <anute@newmail.ru>
Subject: NT WS client behind IPTABLES + POM FW while disconnecting PPTP server
Date: Wed, 18 Feb 2004 10:50:49 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <030001c3f5f3$ecd7a780$0101a8c0@ntanna>
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
To: netfilter@lists.netfilter.org

Dear Sirs,
I got iptables' FW based on RH 7.2 kernel 2.4.20
to make multiple connection from NATed LAN to the same PPTP outside server i
patched my kernel with your patch-o-matic(extras/pptp*)
then installed iptables v.1.2.9 from this netfilter.org site.

it really works, thanks.

but there is one problem with computers in LAN wich OS is NT Workstation
SP6.


at NT WS after disconnetecting from PPTP server, connection always keeps
alive.
netstat -a says connection still ESTABLISHED, but in fact no packets are
going to remote PPTP server
ipconfig says no PPP interface is up.

here are 2 NetMon logs for disconnecting PPTP from NT WS below:
1) no FW, no iptables  - NT WS has own real IP and directly connected to ISP
frm   prot         src                     dst
1.     PPTP    RealIP                   Extern_PPTP_srv
        descript-- Control Packet(1): Clear Call Request(12)
2.     PPTP    Extern_PPTP_srv    RealIP
        descript-- Control Packet(1): Call Disconnected Notify(13)
3.     PPTP    RealIP                   Extern_PPTP_srv
        descript-- Control Packet(1): Stop Session Request(3)
4.     PPTP    Extern_PPTP_srv    RealIP
        descript-- Control Packet(1): Stop Session Reply(4)
5.     TCP      RealIP                  Extern_PPTP_srv
        descript-- .A...F, len:0,seq 76865-76865,ack:710275290,win 8384
                       src-port:1035 dst-port:1723
6.     TCP      Extern_PPTP_srv    RealIP
        descript-- .A...F,len:0,seq: ...,ack: ..., win: ... src-port:1723,
dst-port:1035
7.     TCP      RealIP                   Extern_PPTP_srv
        descript-- .A.... ,len:0,seq: ...,ack: ..., win: ... src-port:1035,
dst-port:1723

connection with External_PPTP_server was correctly disconnected.

2) the same NT WS - but  NATed throught FW iptables
1.      PPTP     192.168.0.52         Extern_PPTP_srv
        descript-- Control Packet(1): Clear Call Request(12)
2.      TCP     Extern_PPTP_srv    192.168.0.52
        descript-- .A.... ,len:0, seq: ...,ack: ...,win: ..., src-port:1723,
dst-port:1048

as you can see here are no any stop_session control mesgs , while
disconnecting.
and connection still alive.

what should i do to fix this problem?

Thank you in advance,
Anna Skorokhodova
IT Manager
NF Oy, Russia


