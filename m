From: Kaushal Shriyan <kaushalshriyan@gmail.com>
Subject: Re: HA Shorewall
Date: Mon, 13 Jul 2009 16:08:48 +0530
Message-ID: <6b16fb4c0907130338g32f28265od2d754f1674395b4@mail.gmail.com>
References: <6b16fb4c0907130309s28927403mbfd241b1a968a75b@mail.gmail.com> 
	<4A5B0EE0.8030502@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=4ue75b7tlMh9MxJ9KvQgVVznFzDO3unlW5SYYU8yh/8=;
        b=epQ84tTol21x44f/qSz6h5bTTE3e4MY8DBhRjSI2jtEYp1IzC4q6xPYieeg0HiKda/
         e2+dPy1zjfG7IPYOnx/keDUL8HXcb1klnuODDx2jWt94wqkgAP6DAMEFItW2UzrGfDnw
         7F+JXmBJT30lWTmjYqK0L8ycTN7GgbUjqywBo=
In-Reply-To: <4A5B0EE0.8030502@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Mon, Jul 13, 2009 at 4:09 PM, Pablo Neira Ayuso<pablo@netfilter.org>=
 wrote:
> Kaushal Shriyan wrote:
>>
>> Hi,
>>
>> I am using Heartbeat as the HA Manager for my setup.
>>
>> fw1 eth0 125.xxx.xxx.xxx external IP
>> fw1 eth1 172.20.0.2 internal IP
>> fw2 eth0 125.xxx.xxx.xxx external IP
>> fw2 eth1 172.20.0.3 internal IP
>>
>> External VIP : 125.xxx.xxx.xxx Internal VIP : 172.20.0.1
>>
>> ##############ha.cf############################
>> #File to write debug messages to
>> debugfile /var/log/ha-debug
>> #
>> #
>> #File to write other messages to
>> #
>> logfile =A0 =A0 =A0 =A0/var/log/ha-log
>> #logfacility =A0 =A0 =A0 =A0local0
>> bcast =A0 =A0 =A0 =A0eth0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# Linux
>> auto_failback on
>> node =A0 =A0 =A0 =A0fw1
>> node =A0 =A0 =A0 =A0fw2
>> ping 125.xxx.xxx.xxx 125.xxx.xxx.xxx
>> ping 172.20.0.2 172.20.0.3
>> respawn hacluster /usr/lib/heartbeat/ipfail
>> apiauth ipfail gid=3Dhaclient uid=3Dhacluster
>> ################################################
>>
>>
>> ##############haresources###########################################=
#######################################################################=
######
>> fw1 ldirectord::ldirectord.cf LVSSyncDaemonSwap::master
>
> LVS? This is not related with that at all.
>
>> IPaddr2::172.20.0.1/24/eth1:1/172.20.0.255
>> IPaddr2::125.xxx.xxx.xxx/28/eth0:0/125xxx.xxx.xxx
>>
>> ####################################################################=
#######################################################################=
######
>>
>> ##############ldirectord.cf##############################
>> # Global Directives
>> checktimeout=3D10
>> checkinterval=3D2
>> autoreload=3Dno
>> logfile=3D"local0"
>> quiescent=3Dno
>> ##############ldirectord.cf##############################
>>
>> http://paste.ubuntu.com/216805/ ---> conntrackd.conf
>> http://paste.ubuntu.com/216807/ =A0---> shorewall
>>
>>
>> I could see connection in the connection table by running conntrackd
>> -i on primary node (fw1) and conntrackd -e on secondary node (fw2)
>> I have carried out some basic tests, when i do wget wget
>>
>> http://distfiles.gentoo.org/releases/amd64/current/install-amd64-min=
imal-20090702.iso
>> on the client machine and stop heartbeat on primary node (fw1), the
>> secondary node (fw2) takes over.
>> The issue is the wget session gets disconnected and does not proceed
>> from the last state.
>>
>> I see it as
>>
>> 2% [=3D=3D>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 ] 32,44,968
>> --.--K/s =A0 =A0ETA 52:56
>>
>> root@fw1:~# conntrackd -i
>> tcp =A0 =A0 =A06 ESTABLISHED src=3D172.20.0.10 dst=3D64.50.238.52 sp=
ort=3D46855
>> dport=3D80 src=3D64.50.238.52 dst=3D125.18.21.21 sport=3D80 dport=3D=
46855
>> [ASSURED] [active since 17s]
>> root@fw1:~#
>> root@fw2:~# conntrackd -e
>> tcp =A0 =A0 =A06 ESTABLISHED src=3D172.20.0.10 dst=3D64.50.238.52 sp=
ort=3D46855
>> dport=3D80 [ASSURED] [active since 35s]
>> root@fw2:~#
>>
>> when i stop heartbeat, the conntrackd -i on fw2 and conntrackd -e on
>> fw1 doesnot show up anything.
>>
>> Please let me know if anyone needs more information from me
>

> Does the conntrackd.log file shows a commit of the entries in the ext=
ernal
> cache into the kernel during the failover?

Yes.

Did you install the scripts to do
> that?
>

Hi Pablo,

I have in corporated the primary-backup.sh in the shorewall
script(http://paste.ubuntu.com/216807/ ) in ha resources file.

case "$1" in
  start)
     shorewall_start
        iptables -I INPUT -d 225.0.0.50 -j ACCEPT
        iptables -I OUTPUT -d 225.0.0.50 -j ACCEPT
        #script_master.sh
        /usr/sbin/conntrackd -c
        /usr/sbin/conntrackd -f
        /usr/sbin/conntrackd -R
        #script_backup.sh
        /usr/sbin/conntrackd -B

     ;;
  stop)
     shorewall_stop
     /usr/sbin/conntrackd -t
     /usr/sbin/conntrackd -n

Thanks and Regards

Kaushal
