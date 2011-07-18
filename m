From: Kumar Swamy <kswamy@barracuda.com>
Subject: 2.6.36.2:  Kernel oops when ipvs is used with ip_queue in x86_64
Date: Mon, 18 Jul 2011 03:58:49 -0700
Message-ID: <65C6A498BB5BF245BD7195255041FA2E04C751BCB4@bn-scl-be03.Cudanet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kumar Swamy <kswamy@barracuda.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Hello,=20

Please pardon me if this is a known issue and point me to the fix. I ha=
ve the following setup

Kernel : 2.6.36.2 arch: x86_64=20

1) ip_queue module is loaded and a iptable rule with QUEUE target is ad=
ded for an interface (IF1 - 192.168.132.215).
=A0=A0=A0 -A INPUT -d 192.168.132.215/32 -p tcp -m tcp --dport 80 -j QU=
EUE
2) =A0An ipvs rule with wrr load balancing listening on port 80 on IF1 =
and one real server.
=A0=A0=A0 =A0=A0ipvsadm-save
-A -t 192.168.132.215:http -s wrr
-a -t 192.168.132.215:http -r 192.168.132.232:http -m -w 100
3) A userland program which uses libipq to handle packets from QUEUE ta=
rget.=20

Now any traffic on 192.168.132.215:http is causing kernel to panic. I d=
ebugged userland program which sets the verdict NF_ACCEPT =A0(ipq_set_v=
erdict(ipq,id, NF_ACCEPT, 0, NULL); I guess ip_queue module reinjects t=
he packet but somehow leading to kernel Oops. I don't see the panic if =
there is no ipvs rule , I tested this by deleting ipvs rules and listen=
ing on application sockets.=20

Jul 14 02:43:28 2011 kumar 2011 kernel: [ 401.459462] BUG: unable to ha=
ndle kernel NULL pointer dereference at (null)
Jul 14 02:43:28 2011 kumar 2011 kernel: [ 401.459776] IP: [<ffffffff810=
a1edf>] put_page+0x1f/0x160
Jul 14 02:43:28 2011 kumar 2011 kernel: [ 401.460016] Oops: 0000 [#1] S=
MP
Jul 14 02:43:28 2011 kumar 2011 kernel: [ 401.460016] last sysfs file: =
/sys/devices/pci0000:00/0000:00:18.3/temp1_input
Jul 14 02:43:28 2011 kumar 2011 kernel: [ 401.460016] Stack:
Jul 14 02:43:28 2011 kumar 2011 kernel: [ 401.460016] Call Trace:
Jul 14 02:43:28 2011 kumar 2011 kernel: [ 401.460016] Code: fc ff ff eb=
 e4 0f 1f 80 00 00 00 00 55 48 89 e5 48 83 ec 30 48 89 5d d8 4c 89 65 e=
0 48 89 fb 4c 89 6d e8 4c 89 75 f0 4c 89 7d f8 <66> f7 07 00 c0 0f 85 0=
a 01 00 00 8b 47 08 f0 ff 4f 08 0f 94 c0
Jul 14 02:43:28 2011 kumar 2011 kernel: [ 401.460016] RIP [<ffffffff810=
a1edf>] put_page+0x1f/0x160
Jul 14 02:43:28 2011 kumar 2011 kernel: [ 401.460016] CR2: 000000000000=
0000

Any help is appreciated.

Thanks,
Kumar

'Like' us on Facebook for exclusive content and other resources on all =
Barracuda Networks solutions.=0D
Visit http://barracudanetworks.com/facebook=0D
=0D

