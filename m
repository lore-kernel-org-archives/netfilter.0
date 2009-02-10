From: Yoann Juet <yoann.juet@univ-nantes.fr>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Tue, 10 Feb 2009 14:13:52 +0100
Message-ID: <49917D90.8090706@univ-nantes.fr>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org> <497CA7A2.2000906@netfilter.org> <497E0EA9.1020408@univ-nantes.fr> <497E40B0.2090709@netfilter.org> <4981D4EB.3060007@univ-nantes.fr> <49881800.20707@netfilter.org> <49896FEA.3050803@univ-nantes.fr> <4989713B.2010502@netfilter.org> <498C004A.20506@univ-nantes.fr> <49901394.30504@netfilter.org>
Reply-To: yoann.juet@univ-nantes.fr
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090804070905060805030803"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49901394.30504@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------090804070905060805030803
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi pablo,

Pablo Neira Ayuso wrote:
> Hi again Yoann,
> 
> Yoann Juet wrote:
>> I'm still facing the same difficulties with conntrack-tools 0.9.10 and
>> kernel 2.6.28.
>>
>> Log on FW1 after the second failover:
>>
>> Feb  6 09:55:46 FW-DSI-1-IRT kernel: [ 1352.601798] RULE -1 -- DENY
>> IN=eth0 OUT=eth1 SRC=193.52.101.32 DST=172.18.244.10 LEN=255 TOS=0x00
>> PREC=0x00 TTL=62 ID=8698 DF PROTO=TCP SPT=5222 DPT=34189 WINDOW=501
>> RES=0x00 ACK PSH URGP=0
>>
>> As you can see, this TCP connection is present:
>>
>> root@fw1-irt:~# conntrack -L  |grep 34189
>> conntrack v0.9.10 (conntrack-tools): 14 flow entries has been shown.
>> tcp      6 10581 ESTABLISHED src=172.18.244.10 dst=193.52.101.32
>> sport=34189 dport=5222 packets=63 bytes=12039 src=193.52.101.32
>> dst=172.18.244.10 sport=5222 dport=34189 packets=58 bytes=22146
>> [ASSURED] mark=0 secmark=0 use=1
> 
> This is weird, look like some problem in your scripts or the commit is
> not working in node fw1-irt. The packet counters of the entry above show
> that this is the old entry which is stuck in the cache after the second
> failover. This should be deleted when fw1-irt's script issues the commit
> (conntrackd -c). Does the log file tells that the commit was successful?
> 

I confirm that "conntrackd -c" is executed on FW1-IRT on the second 
failover. FYI, my LSB script executes the following instructions (start= 
new active node ; stop = new passive node):

...
case "$1" in
         start)
                 conntrackd -c -C /etc/conntrackd.conf
                 conntrackd -f -C /etc/conntrackd.conf
                 conntrackd -R -C /etc/conntrackd.conf
                 exit 0
                 ;;

         stop)
                 #conntrackd -t -C /etc/conntrackd.conf
                 conntrackd -n -C /etc/conntrackd.conf
                 exit 0
                 ;;

         *)
                 exit 0
                 ;;
esac


> The following attached patch adds more verbose output to tell you that
> some old entries has been deleted. Just in case that you need more
> information for troubleshooting.
> 
> 

Thanks, maybe with this patch I'll see what's wrong with my setup.




--------------090804070905060805030803
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


--------------090804070905060805030803--
