From: i.chudov@volga.ttk.ru
Subject: Questionable cBPF behaviour
Date: Thu, 20 Jul 2017 13:04:02 +0400
Message-ID: <OF7A64FDC6.3789138A-ON44258163.003003C1-44258163.0031CF49@volga.ttk.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello everybody!

I try to filter (DROP) DNS ANY queries using the classic BPF (Berkley=20
Packet Filter). Unfortunately there are lots of poorly written=20
documentation on BPF assembler usage so I really need some help.

The task is to load BPF opcodes into xt_bpf to filter the UDP DNS packets=20
by their payload. I use cbpf compiler from the netsniff-ng package to=20
convert assembler to opcodes and bpf_dbg from Cloudflare bpftools to debug =

the code. (I test the code against tcpdump'ed packets containing DNS ANY=20
queries.) I load the filtering code using:
iptables -I INPUT 1 -m bpf --bytecode '<bytecode>'

I don't know if I have to add -j DROP or -j ACCEPT because there is no=20
information regarding further behaviour of iptables after getting cBPF=20
program return code.

The problem is that despite the packet counter ticks of catched packets=20
and despite addition or removal of -j ACCEPT/DROP I still see the DNS ANY=20
queries in BIND9 logs.

I will appreciate any help and am ready to give further comments regarding =

the code behaviour. Here is the filter's code:
; Check if we've got the IP packet on top of Ethernet frame:
check_ip:
        ldh [12]                ; Load the value from offset 12 into A=20
register.
        jneq #0x800, pass       ; Check if we're dealing with IP packet or =

pass it AS IS.

; Check the protocol field for packet type =3D=3D 17 (UDP)
check_proto:
        ldb [23]                ; Check. tcpdump has advised me to use=20
offset 23 instead of 27.
        jneq #0x11, pass        ; Pass the packet if it's type is not UDP.

; Check for the packet dport =3D=3D 53.
check_dport:
        ldh [36]                ; Load the u16 into A register from offset =

36.
        jneq #0x35, pass        ; Check if the dport is 53.

; Check if we have the unfragmented packet (or the first fragment).
check_fragmentation:
        ldh [20]                ; Skip all headers right to UDP payload=20
(Load UDP Fragment Offset).
        jset #0x1fff, pass      ; Returns 0. Test if we have the=20
unfragmented packet or packet's first fragment, drop the packet otherwise.
        ldxb 4*([14]&0xf)
        ldb [x + 24]
        jset #0x80, pass

; Check for DNS QTYPE =3D=3D ANY and QCLASS =3D=3D IN
find_qtype:
        ldb [54]               ; Load first byte of the query RR into A.=20
It contains relative count/offset of query bytes or 0x00 in the end.
        add #0x37              ; Add 54 (query offset byte position) + 1=20
(+ 1 byte forward) to the offset value in A to make the offset absolute.
        tax                    ; Move the absolute offset to X.
        ldb [x + 0x0]          ; Load the value from the absolute offset.
        jeq #0x00, check_qtype ; Move to the QTYPE check code if it's the=20
end of the query string.
        add x                  ; Add the absolute offset from A to=20
relative offset in X.
        add #0x1               ; Move the absolute offset 1 byte forward,=20
to the next offset value.
        tax                    ; Move the new (adjusted) absolute offset=20
from A to X.
        ldb [x + 0x0]          ; Load the value by the new calcaulated=20
offset.
        jeq #0x00, check_qtype ; Check against end of the query once=20
again.
        add x
        add #0x1
        tax
        ldb [x + 0x0]
        jeq #0x00, check_qtype ; And again, and again...
        jmp pass               ; Pass the packet if we were unable to find =

the desired value. A little failover.

; Check the query type in case we were able to find the end of the string!
check_qtype:
        txa                     ; Move the absolute offset from X into A.
        add #0x1                ; Move the offset 1 byte forward from=20
query end.
        tax                     ; Move the absolute offset value to the X=20
register from A.
        ld [x + 0x0]            ; Load the u32 from absolute offset=20
specified in X register.
        jeq #0x00FF0001, drop   ; Drop the packet if the value in A is=20
0x00FF0001 or else pass the packet.

pass:
        ret #-1           ; Label/Return code signaling to pass the=20
inspected packet.

drop:
        ret #0            ; Label/Return code signaling to drop packet.

--
With best regards/Mit freundlichen Gr=FC=DFen, Igor Chudov
TransTelecom-Volga JSC, Russian Federation
Leading Engineer/Network Maintainance Department,
Tel. (24/7/365): +7 937 266-51-34
