From: "J Webster" <webster_jack@hotmail.com>
Subject: openvpn over udp failing
Date: Fri, 6 Aug 2010 13:15:35 -0400
Message-ID: <BAY145-ds3FB0B1B5B904843D4A32BF3910@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org


 I have an openvpn server running on port 1194 (tcp) successfuly.
 The box is 1 server split into 2 IP addresses xx.xx.xx.198 and 
xx.xx.xx.199.
 A proxy server runs on the 198 server and the VPN on 199.
I have been trying to set up a 2nd openvpn service running on the UDP port 
1194. The service is running but I am getting a handshake error between the 
client and the server.
The tcp connection works successfully so I can only think this is a firewall 
issue for the udp service.

Could this be a routing issue on the server?
I noted that when I connect the VPN via TCP to xxx.xxx.xx.199 and go to 
what's my IP it gives me the 2nd IP of the server which is xxx.xxx.xxx.198
My routing table doesn't show anything that might cause that behaviour 
though I did originally put in a routing to allow connections to port 443 on 
the server because xx.xx.xx.198 is the primary address on
eth0 and is preferred over xx.xx.xx.199 by default source address

[root ~]# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
10.8.0.2        *               255.255.255.255 UH    0      0        0 tun1
172.16.0.2      *               255.255.255.255 UH    0      0        0 tun0
10.8.0.0        10.8.0.2        255.255.255.0   UG    0      0        0 tun1
172.16.0.0      172.16.0.2      255.255.255.0   UG    0      0        0 tun0
88.208.236.0    *               255.255.252.0   U     0      0        0 eth0
169.254.0.0     *               255.255.0.0     U     0      0        0 eth0
default         server88-208-23 0.0.0.0         UG    0      0        0 eth0

CLIENT:
Fri Aug 06 08:10:59 2010 us=843000 WARNING: normally if you use --mssfix 
and/or --fragment, you should also set --tun-mtu 1500 (currently it is 1460)
Fri Aug 06 08:10:59 2010 us=843000 Control Channel MTU parms [ L:1502 D:138 
EF:38 EB:0 ET:0 EL:0 ]
Fri Aug 06 08:10:59 2010 us=859000 Data Channel MTU parms [ L:1502 D:1450 
EF:42 EB:135 ET:0 EL:0 AF:3/1 ]
Fri Aug 06 08:10:59 2010 us=859000 Local Options String: 'V4,dev-type 
tun,link-mtu 1502,tun-mtu 1460,proto UDPv4,comp-lzo,cipher BF-CBC,auth 
SHA1,keysize 128,key-method 2,tls-client'
Fri Aug 06 08:10:59 2010 us=859000 Expected Remote Options String: 
'V4,dev-type tun,link-mtu 1502,tun-mtu 1460,proto UDPv4,comp-lzo,cipher 
BF-CBC,auth SHA1,keysize 128,key-method 2,tls-server'
Fri Aug 06 08:10:59 2010 us=859000 Local Options hash (VER=V4): '32690600'
Fri Aug 06 08:10:59 2010 us=859000 Expected Remote Options hash (VER=V4): 
'2f6c656c'
Fri Aug 06 08:10:59 2010 us=859000 Socket Buffers: R=[8192->8192] 
S=[8192->8192]
Fri Aug 06 08:10:59 2010 us=859000 UDPv4 link local: [undef]
Fri Aug 06 08:10:59 2010 us=859000 UDPv4 link remote: xx.xxx.xxx.199:1194
Fri Aug 06 08:11:59 2010 us=546000 TLS Error: TLS key negotiation failed to 
occur within 60 seconds (check your network connectivity)
Fri Aug 06 08:11:59 2010 us=546000 TLS Error: TLS handshake failed
Fri Aug 06 08:11:59 2010 us=546000 TCP/UDP: Closing socket
Fri Aug 06 08:11:59 2010 us=546000 SIGUSR1[soft,tls-error] received, process 
restarting

SERVER:
Fri Aug  6 13:10:01 2010 us=291165 70.81.232.170:39903 TLS: tls_process: 
chg=0 ks=S_PRE_START lame=S_UNDEF to_link->len=0 wakeup=604800
Fri Aug  6 13:10:01 2010 us=291178 70.81.232.170:39903 ACK reliable_can_send 
active=1 current=0 : [1] 0
Fri Aug  6 13:10:01 2010 us=291211 70.81.232.170:39903 ACK 
reliable_send_timeout 2 [1] 0
Fri Aug  6 13:10:01 2010 us=291225 70.81.232.170:39903 TLS: tls_process: 
timeout set to 1
Fri Aug  6 13:10:01 2010 us=291246 70.81.232.170:39903 TLS: 
tls_multi_process: i=1 state=S_INITIAL, mysid=28dcf511 d87ab2df, 
stored-sid=00000000 00000000, stored-ip=[undef]
Fri Aug  6 13:10:01 2010 us=291266 70.81.232.170:39903 TLS: 
tls_multi_process: i=2 state=S_UNDEF, mysid=00000000 00000000, 
stored-sid=00000000 00000000, stored-ip=[undef]
Fri Aug  6 13:10:01 2010 us=291286 PO_CTL rwflags=0x0001 ev=5 arg=0x080c8c54
Fri Aug  6 13:10:01 2010 us=291299 PO_CTL rwflags=0x0001 ev=6 arg=0x080c8bc8
Fri Aug  6 13:10:01 2010 us=291315 I/O WAIT TR|Tw|SR|Sw [1/7657]
Fri Aug  6 13:10:02 2010 us=298669  event_wait returned 0
Fri Aug  6 13:10:02 2010 us=298704 I/O WAIT status=0x0020
Fri Aug  6 13:10:02 2010 us=298719 MULTI: REAP range 48 -> 64
Fri Aug  6 13:10:02 2010 us=298735 70.81.232.170:39903 TIMER: coarse timer 
wakeup 1 seconds
Fri Aug  6 13:10:02 2010 us=298766 70.81.232.170:39903 TLS: 
tls_multi_process: i=0 state=S_PRE_START, mysid=bbc34abf 90267ad0, 
stored-sid=6e570880 af58924d, stored-ip=70.81.232.170:39903
Fri Aug  6 13:10:02 2010 us=298784 70.81.232.170:39903 TLS: tls_process: 
chg=0 ks=S_PRE_START lame=S_UNDEF to_link->len=0 wakeup=604800
Fri Aug  6 13:10:02 2010 us=298796 70.81.232.170:39903 TLS Error: TLS key 
negotiation failed to occur within 60 seconds (check your network 
connectivity)
Fri Aug  6 13:10:02 2010 us=298808 70.81.232.170:39903 TLS Error: TLS 
handshake failed
Fri Aug  6 13:10:02 2010 us=298820 70.81.232.170:39903 PID packet_id_free
Fri Aug  6 13:10:02 2010 us=298867 70.81.232.170:39903 PID packet_id_free
Fri Aug  6 13:10:02 2010 us=298882 70.81.232.170:39903 PID packet_id_free
Fri Aug  6 13:10:02 2010 us=298895 70.81.232.170:39903 TLS: 
tls_session_init: entry
Fri Aug  6 13:10:02 2010 us=298915 70.81.232.170:39903 PID packet_id_init 
seq_backtrack=64 time_backtrack=15
Fri Aug  6 13:10:02 2010 us=298963 70.81.232.170:39903 PID packet_id_init 
seq_backtrack=64 time_backtrack=15
Fri Aug  6 13:10:02 2010 us=298982 70.81.232.170:39903 TLS: 
tls_session_init: new session object, sid=587007a3 becc1a5e
Fri Aug  6 13:10:02 2010 us=299003 70.81.232.170:39903 TLS: 
tls_multi_process: i=1 state=S_INITIAL, mysid=28dcf511 d87ab2df, 
stored-sid=00000000 00000000, stored-ip=[undef]
Fri Aug  6 13:10:02 2010 us=299024 70.81.232.170:39903 TLS: 
tls_multi_process: i=2 state=S_UNDEF, mysid=00000000 00000000, 
stored-sid=00000000 00000000, stored-ip=[undef]
Fri Aug  6 13:10:02 2010 us=299041 70.81.232.170:39903 
SIGUSR1[soft,tls-error] received, client-instance restarting
Fri Aug  6 13:10:02 2010 us=299079 MULTI: multi_close_instance called

 

