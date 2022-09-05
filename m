From: "Viton, Pedro (Nokia - ES/Madrid)" <pedro.viton@nokia.com>
Subject: Segmentation fault when starting conntrackd
Date: Mon, 5 Sep 2022 06:08:43 +0000
Message-ID: <PR3PR07MB8130E53D6E800C939928AE66FF7F9@PR3PR07MB8130.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ev+MF5Aimf2rx889gpNcrDnm84kyLZ+HufxNSniz2C4=;
 b=SwnFt+/8bfoHS56mrTTZnUfxc8MyIcckrJTF1T57YceOYa2aPcd/TDYRd/5+V3LWVmK4895tXkdAxckgb1zeVOOI2m/iVpfOKT8FgCVshKSV7fhx7yJVkUAG9jmHd8yzxoCLujkgSrjE0xbjMmS52ecQKvTbyPIcSvayKENS9O8=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi:

I'm trying to have conntrackd working, but after creating a configuration f=
ile for FTFW over UDP , I get a Segmentation Fault error when staring it up
I've also tried with NOTRACK over TCP, but same result.

[root@luna38 ~]# /usr/sbin/conntrackd -C /opt/AAA/load-balancer/run/conntra=
ckd/conntrackd.conf
Segmentation fault
[root@luna38 ~]#


In my case, I'm running the conntrackd that comes with default package in R=
HEL 7.9 (kernel 3.10.0-1127), which is version 1.4.4 (I'm aware it is not t=
he latest one)

My configuration file is the following one:

Sync {
        Mode FTFW {
        }

        UDP {
            IPv4_address 10.10.10.38
            IPv4_Destination_Address 10.10.10.33
            Interface ens256
            Port 3780
        }
}

General {
        Nice -20
        LogFile on
        LockFile /var/lock/conntrack.lock
        UNIX {
                Path /var/run/conntrackd.ctl
                Backlog 20
        }
        Filter From Userspace {
                Protocol Accept {
                        TCP
                }
                Address Ignore {
                        IPv4_address 127.0.0.1
                        IPv4_address 10.10.10.38
                        IPv4_address 10.10.10.33
                }
         }
}

The IP address of the server where I'm trying to start conntrackd has 10.10=
.10.38 IP address, and it is on ens256 interface. And the 10.10.10.33 is th=
e replicated one
$ ip addr
...
4: ens256: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP gro=
up default qlen 10000
    link/ether 00:0c:29:ef:63:30 brd ff:ff:ff:ff:ff:ff
    inet 10.10.10.38/24 brd 10.10.10.255 scope global ens256
       valid_lft forever preferred_lft forever
    inet6 2001:db0:10:10::38/64 scope global
       valid_lft forever preferred_lft forever
    inet6 fe80::20c:29ff:feef:6330/64 scope link
       valid_lft forever preferred_lft forever


Is there any other log file where I could see the root cause of the Segmant=
ation Fault?
The /var/log/conntrackd.log doesn't give any clue.

Or maybe my configuration file is not correct?

Any help will be appreciated.

Thanks a lot:
  Pedro
