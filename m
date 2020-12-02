From: Fatih USTA <fatihusta86@gmail.com>
Subject: Re: NAT table seems to be skipped for TCP traffic
Date: Wed, 2 Dec 2020 19:42:21 +0300
Message-ID: <e5970dd3-7f0b-ae4b-0c13-9e9af7772c21@gmail.com>
References: <E63D2EAC-A87A-4F1B-AEEC-CCF6496F8186@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=V2wY6rDi/a8uq+XZ5uVKXtBP9OZ741gNaNRTtFzQoKM=;
        b=iGNbOKnsahvOKeyE1z7VzsJ6LvAIlJEU17OOEoQ0FKYS9ausjLiQsaxwkPuQFPa5+c
         Xy/UoUDeprtSIbPTNxes7RNkNqWicxXPi+9GRdPV5MACtmwpbtNOmwlhteEGFtyXvVIs
         78hEjsXOfD88VuXdnvgRTnD9k1teV4zu1DmX1KgaYqYgf4jvl2xx1Fbj6z0ZyR9FAtw+
         bQYv8MlGlf7777aL/Q6frw+dJDYp0xtJM22LkUOjQrFZ4XiryREu73LMkJJ9zKUytCdH
         +6J8eTp/VLG6fHsxW5cXmgRz406LIIzet8JQ4qFziSSb3r0+Nwh7V88GyHmaJFOzJmUV
         v7AA==
In-Reply-To: <E63D2EAC-A87A-4F1B-AEEC-CCF6496F8186@gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Nicholas Amon <nicholasamon@gmail.com>, netfilter@vger.kernel.org


Did you enable ip forwarding on host machine?

sysctl net.ipv4.ip_forward

if is 0 then set to 1

sysctl -w net.ipv4.ip_forward=3D1


Fatih USTA

On 2.12.2020 18:44, Nicholas Amon wrote:
> Hi,
>
> I have a strange problem I=E2=80=99ve been troubleshooting for days to no=
 avail.  I have traffic from a host (192.168.2.2) that appears to skip the =
NAT table altogether for TCP traffic but not for ICMP traffic.
> My goal is to SNAT all traffic from the host but the  SNAT occurs for ICM=
P traffic but not for TCP traffic?!
>
> I have a Linux host that has KVM VMs. I've configured the host as a route=
r doing SNAT (well actually masquerading in this example, but I tried SNAT =
earlier):
>
> iptables SNAT rule:
>
> Chain PREROUTING (policy ACCEPT 59 packets, 4855 bytes)
>   pkts bytes target     prot opt in     out     source               dest=
ination
>     69  6603 LOG        all  --  *      *       0.0.0.0/0            0.0.=
0.0/0            LOG flags 0 level 7 prefix "PRE-RTG-nat:"
>
> Chain INPUT (policy ACCEPT 43 packets, 2697 bytes)
>   pkts bytes target     prot opt in     out     source               dest=
ination
>
> Chain OUTPUT (policy ACCEPT 88 packets, 5292 bytes)
>   pkts bytes target     prot opt in     out     source               dest=
ination
>     88  5292 LOG        all  --  *      *       0.0.0.0/0            0.0.=
0.0/0            LOG flags 0 level 7 prefix "OUT-nat:"
>
> Chain POSTROUTING (policy ACCEPT 61 packets, 3686 bytes)
>   pkts bytes target     prot opt in     out     source               dest=
ination
>    120  6965 LOG        all  --  *      *       0.0.0.0/0            0.0.=
0.0/0            LOG flags 0 level 7 prefix "POST-RTG-nat:"
>    431 21166 MASQUERADE  all  --  *      ens160  0.0.0.0/0            0.0=
.0.0/0
>
> The IP address of the ens160 interface is 10.8.131.129.
>
> Example tcpdump output captured on the KVM host when pinging a random hos=
t 5.5.5.5 from VM 192.168.2.2
>
> tcpdump -ni ens160  port 80 or icmp
>
> 20:09:43.547144 IP 10.8.131.129 > 5.5.5.5: ICMP echo request, id 52336, s=
eq 1, length 64
> 20:09:44.550362 IP 10.8.131.129 > 5.5.5.5: ICMP echo request, id 52336, s=
eq 2, length 64
> 20:09:45.574299 IP 10.8.131.129 > 5.5.5.5: ICMP echo request, id 52336, s=
eq 3, length 64
> 20:09:46.597927 IP 10.8.131.129 > 5.5.5.5: ICMP echo request, id 52336, s=
eq 4, length 64
>
> Example tcpdump output from the KVM host when curl 5.5.5.5 from VM 192.16=
8.2.2:
>
> tcpdump -ni ens160  port 80 or icmp
>
> listening on ens160, link-type EN10MB (Ethernet), capture size 262144 byt=
es
> 20:11:48.421960 IP 192.168.2.2.25867 > 5.5.5.5.80: Flags [S], seq 2120886=
070, win 64240, options [mss 1460,sackOK,TS val 2611268392 ecr 0,nop,wscale=
 7], length 0
> 20:11:49.446042 IP 192.168.2.2.25867 > 5.5.5.5.80: Flags [S], seq 2120886=
070, win 64240, options [mss 1460,sackOK,TS val 2611269421 ecr 0,nop,wscale=
 7], length 0
> 20:11:51.461925 IP 192.168.2.2.25867 > 5.5.5.5.80: Flags [S], seq 2120886=
070, win 64240, options [mss 1460,sackOK,TS val 2611271437 ecr 0,nop,wscale=
 7], length 0
>
> Notice how for the TCP traffic the source address is not NATed, 192.168.2=
.2, but for ICMP it NATs the traffic with the source reported as 10.8.131.1=
29. It seems the SNAT rule is not applying!
> I though next to add the LOG statements, as shown earlier in the iptables=
 rules above (there is a similar LOG rule in the FORWARD chain of the filte=
r table that outputs FWD-filter log statements not shown in the rules above=
), here is the output in the kernel logs when pinging:
>
> Dec  1 20:14:18 XXXXX kernel: [16654.813561] PRE-RTG-nat:IN=3Dveth1 OUT=
=3D MAC=3D4a:69:c2:22:60:28:b6:15:50:68:fc:76:08:00 SRC=3D192.168.2.2 DST=
=3D5.5.5.5 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D29316 DF PROTO=3DI=
CMP TYPE=3D8 CODE=3D0 ID=3D29910 SEQ=3D1
> Dec  1 20:14:18 XXXXX kernel: [16654.813582] FWD-filter:IN=3Dveth1 OUT=3D=
ens160 MAC=3D4a:69:c2:22:60:28:b6:15:50:68:fc:76:08:00 SRC=3D192.168.2.2 DS=
T=3D5.5.5.5 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D29316 DF PROTO=3D=
ICMP TYPE=3D8 CODE=3D0 ID=3D29910 SEQ=3D1
> Dec  1 20:14:18 XXXXX kernel: [16654.813588] POST-RTG-nat:IN=3D OUT=3Dens=
160 SRC=3D192.168.2.2 DST=3D5.5.5.5 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D6=
2 ID=3D29316 DF PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D29910 SEQ=3D1
> Dec  1 20:14:18 XXXXX kernel: [16654.813561] PRE-RTG-nat:IN=3Dveth1 OUT=
=3D MAC=3D4a:69:c2:22:60:28:b6:15:50:68:fc:76:08:00 SRC=3D192.168.2.2 DST=
=3D5.5.5.5 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D29316 DF PROTO=3DI=
CMP TYPE=3D8 CODE=3D0 ID=3D29910 SEQ=3D1
> Dec  1 20:14:18 XXXXX kernel: [16654.813582] FWD-filter:IN=3Dveth1 OUT=3D=
ens160 MAC=3D4a:69:c2:22:60:28:b6:15:50:68:fc:76:08:00 SRC=3D192.168.2.2 DS=
T=3D5.5.5.5 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D29316 DF PROTO=3D=
ICMP TYPE=3D8 CODE=3D0 ID=3D29910 SEQ=3D1
> Dec  1 20:14:18 XXXXX kernel: [16654.813588] POST-RTG-nat:IN=3D OUT=3Dens=
160 SRC=3D192.168.2.2 DST=3D5.5.5.5 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D6=
2 ID=3D29316 DF PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D29910 SEQ=3D1
>
> Here are the kernel logs when curl/TCP:
>
> ec  1 20:18:33 XXXXXX kernel: [16910.155962] FWD-filter:IN=3Dveth1 OUT=3D=
ens160 MAC=3D4a:69:c2:22:60:28:b6:15:50:68:fc:76:08:00 SRC=3D192.168.2.2 DS=
T=3D5.5.5.5 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D8112 DF PROTO=3DT=
CP SPT=3D33380 DPT=3D80 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
> Dec  1 20:18:33 XXXXXX kernel: [16910.155962] FWD-filter:IN=3Dveth1 OUT=
=3Dens160 MAC=3D4a:69:c2:22:60:28:b6:15:50:68:fc:76:08:00 SRC=3D192.168.2.2=
 DST=3D5.5.5.5 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D8112 DF PROTO=
=3DTCP SPT=3D33380 DPT=3D80 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
> Dec  1 20:18:34 XXXXXX kernel: [16911.169639] FWD-filter:IN=3Dveth1 OUT=
=3Dens160 MAC=3D4a:69:c2:22:60:28:b6:15:50:68:fc:76:08:00 SRC=3D192.168.2.2=
 DST=3D5.5.5.5 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D8113 DF PROTO=
=3DTCP SPT=3D33380 DPT=3D80 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
> Dec  1 20:18:34 XXXXXX kernel: [16911.169639] FWD-filter:IN=3Dveth1 OUT=
=3Dens160 MAC=3D4a:69:c2:22:60:28:b6:15:50:68:fc:76:08:00 SRC=3D192.168.2.2=
 DST=3D5.5.5.5 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D8113 DF PROTO=
=3DTCP SPT=3D33380 DPT=3D80 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
>
> I ran a follow-up test to determine if the traffic is in the POSTROUTING =
mangle table and it is there for both the ICMP and TCP traffic:
>
> ICMP
> Dec  1 20:31:29 XXXXXX kernel: [17685.625732] FWD-filter:IN=3Dveth1 OUT=
=3Dens160 MAC=3D4a:69:c2:22:60:28:b6:15:50:68:fc:76:08:00 SRC=3D192.168.2.2=
 DST=3D5.5.5.5 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D4680 DF PROTO=
=3DICMP TYPE=3D8 CODE=3D0 ID=3D25900 SEQ=3D1
> Dec  1 20:31:29 XXXXXX kernel: [17685.625738] RULE-PSTRTG-mangle:IN=3D OU=
T=3Dens160 SRC=3D192.168.2.2 DST=3D5.5.5.5 LEN=3D84 TOS=3D0x00 PREC=3D0x00 =
TTL=3D62 ID=3D4680 DF PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D25900 SEQ=3D1
> Dec  1 20:31:29 XXXXXX kernel: [17685.625743] POST-RTG-nat:IN=3D OUT=3Den=
s160 SRC=3D192.168.2.2 DST=3D5.5.5.5 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D=
62 ID=3D4680 DF PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D25900 SEQ=3D1
>
> TCP
> Dec  1 20:31:37 XXXXXX kernel: [17694.202915] FWD-filter:IN=3Dveth1 OUT=
=3Dens160 MAC=3D4a:69:c2:22:60:28:b6:15:50:68:fc:76:08:00 SRC=3D192.168.2.2=
 DST=3D5.5.5.5 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D8604 DF PROTO=
=3DTCP SPT=3D62653 DPT=3D80 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
> Dec  1 20:31:37 XXXXXX kernel: [17694.202926] RULE-PSTRTG-mangle:IN=3D OU=
T=3Dens160 SRC=3D192.168.2.2 DST=3D5.5.5.5 LEN=3D60 TOS=3D0x00 PREC=3D0x00 =
TTL=3D62 ID=3D8604 DF PROTO=3DTCP SPT=3D62653 DPT=3D80 WINDOW=3D64240 RES=
=3D0x00 SYN URGP=3D0
>
> The traffic seems to skip the NAT table altogether when it's TCP traffic.=
   Any idea what I'm doing wrong?
>
> Thanks,
>
> Nick
