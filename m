From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: HA Shorewall
Date: Mon, 13 Jul 2009 12:39:28 +0200
Message-ID: <4A5B0EE0.8030502@netfilter.org>
References: <6b16fb4c0907130309s28927403mbfd241b1a968a75b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6b16fb4c0907130309s28927403mbfd241b1a968a75b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kaushal Shriyan <kaushalshriyan@gmail.com>
Cc: netfilter@vger.kernel.org

Kaushal Shriyan wrote:
> Hi,
> 
> I am using Heartbeat as the HA Manager for my setup.
> 
> fw1 eth0 125.xxx.xxx.xxx external IP
> fw1 eth1 172.20.0.2 internal IP
> fw2 eth0 125.xxx.xxx.xxx external IP
> fw2 eth1 172.20.0.3 internal IP
> 
> External VIP : 125.xxx.xxx.xxx Internal VIP : 172.20.0.1
> 
> ##############ha.cf############################
> #File to write debug messages to
> debugfile /var/log/ha-debug
> #
> #
> #File to write other messages to
> #
> logfile        /var/log/ha-log
> #logfacility        local0
> bcast        eth0                # Linux
> auto_failback on
> node        fw1
> node        fw2
> ping 125.xxx.xxx.xxx 125.xxx.xxx.xxx
> ping 172.20.0.2 172.20.0.3
> respawn hacluster /usr/lib/heartbeat/ipfail
> apiauth ipfail gid=haclient uid=hacluster
> ################################################
> 
> ##############haresources########################################################################################################################
> fw1 ldirectord::ldirectord.cf LVSSyncDaemonSwap::master

LVS? This is not related with that at all.

> IPaddr2::172.20.0.1/24/eth1:1/172.20.0.255
> IPaddr2::125.xxx.xxx.xxx/28/eth0:0/125xxx.xxx.xxx
> #################################################################################################################################################
> 
> ##############ldirectord.cf##############################
> # Global Directives
> checktimeout=10
> checkinterval=2
> autoreload=no
> logfile="local0"
> quiescent=no
> ##############ldirectord.cf##############################
> 
> http://paste.ubuntu.com/216805/ ---> conntrackd.conf
> http://paste.ubuntu.com/216807/  ---> shorewall
> 
> 
> I could see connection in the connection table by running conntrackd
> -i on primary node (fw1) and conntrackd -e on secondary node (fw2)
> I have carried out some basic tests, when i do wget wget
> http://distfiles.gentoo.org/releases/amd64/current/install-amd64-minimal-20090702.iso
> on the client machine and stop heartbeat on primary node (fw1), the
> secondary node (fw2) takes over.
> The issue is the wget session gets disconnected and does not proceed
> from the last state.
> 
> I see it as
> 
> 2% [==>
>                                                ] 32,44,968
> --.--K/s    ETA 52:56
> 
> root@fw1:~# conntrackd -i
> tcp      6 ESTABLISHED src=172.20.0.10 dst=64.50.238.52 sport=46855
> dport=80 src=64.50.238.52 dst=125.18.21.21 sport=80 dport=46855
> [ASSURED] [active since 17s]
> root@fw1:~#
> root@fw2:~# conntrackd -e
> tcp      6 ESTABLISHED src=172.20.0.10 dst=64.50.238.52 sport=46855
> dport=80 [ASSURED] [active since 35s]
> root@fw2:~#
> 
> when i stop heartbeat, the conntrackd -i on fw2 and conntrackd -e on
> fw1 doesnot show up anything.
> 
> Please let me know if anyone needs more information from me

Does the conntrackd.log file shows a commit of the entries in the 
external cache into the kernel during the failover? Did you install the 
scripts to do that?
