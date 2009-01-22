From: Yoann Juet <yoann.juet@univ-nantes.fr>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Thu, 22 Jan 2009 10:54:39 +0100
Message-ID: <4978425F.1030003@univ-nantes.fr>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org>
Reply-To: yoann.juet@univ-nantes.fr
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060909040904040400080102"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49778AF4.7000201@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------060909040904040400080102
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I see tons of messages "[warning] delayed packet?", even before the 
first failover, but nothing related to EINVAL. Does it help ?

FYI, the cluster is a KVM guest using hardware virtualization with net 
virtio.

Regards,

Pablo Neira Ayuso wrote:
> Hi Yoann,
> 
> Yoann Juet wrote:
>> I have a testbed cluster with two firewall nodes and conntrack sync.
>> Initially, node1 is the primary and node2 the backup.
>>
>> 1) I open a jabber connection. node1 replicates the conntrack session to
>> node2 (conntrackd in synchronization mode FT-FW).
>> 2) First failover : node2 becomes the new primary, node1 the backup.
>> node2 recovers the TCP session. Everything seems to work fine at this
>> moment.
>> 3) Second failover : just 1 to 2 minutes after the first failove, node1
>> becomes the primary, node2 the backup. The jabber TCP session is still
>> into the conntrack table but the session is broken. I see many packets
>> denied due to the INVALID state.
>>
>> "nf_ct_tcp: ACK is over the upper bound (ACKed data not seen yet) IN=
>> OUT=xxxxxx"
>>
>> The TCP window tracking rejects packets after the second failober. I
>> just have to activate "nf_conntrack_tcp_be_liberal" to make it work
>> again, but that's not, for me, a good solution:
>>
>> echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
>>
>> Why conntrackd cannot recover the TCP session in the second failover ?
>> Is it a known issue, possibly due to a misconfiguration ? I'm using
>> debian/lenny (kernel 2.6.26-1-amd64) with heartbeat2, conntrack 0.9.6
>> and a shell script that executes :
>>
>> ** on the new primary :
>>                conntrackd -c -C /etc/conntrackd.conf
>>                conntrackd -f -C /etc/conntrackd.conf
>>                conntrackd -R -C /etc/conntrackd.conf
>>
>> ** on the new backup :
>>                conntrackd -n -C /etc/conntrackd.conf
> 
> Please, have a look at the conntrackd log file (/var/log/conntrackd.log
> or syslog depending on your configuration). I think that it must be
> reporting EINVAL while trying to update the entries during the second
> fail-over.
> 


--------------060909040904040400080102
Content-Type: text/x-vcard; charset=utf-8;
 name="yoann_juet.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="yoann_juet.vcf"

begin:vcard
fn:Yoann Juet
n:Juet;Yoann
org;quoted-printable:;DSI Universit=C3=A9 de Nantes
adr;quoted-printable:BP92208;;2, rue de la Houssini=C3=A8re;Nantes;;44322;France
email;internet:yoann.juet@univ-nantes.fr
title;quoted-printable:Ing=C3=A9nieur s=C3=A9curit=C3=A9 & r=C3=A9seau
tel;work:02.51.12.53.93
tel;fax:02.51.12.58.60
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------060909040904040400080102--
