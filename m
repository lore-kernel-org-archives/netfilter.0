From: "mdpeters" <michael.peters@lazarusalliance.com>
Subject: Re: transparent bridge troubles?
Date: Fri, 7 Jan 2005 16:16:49 -0500
Message-ID: <003b01c4f4fe$3388f260$3e0010ac@esonet18>
References: <7C9884991ADAE0479C14F10C858BCDF5679643@alderaan.smgtec.com><20050107204433.GA1112@bender.817west.com><002e01c4f4fb$4a24f080$3e0010ac@esonet18>
	<20050107210103.GA1193@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Du'oh!

I changed it and this is what I see so far. I'm running a Nessus scan on one 
side of the bridge and the target system is at the other side of the bridge.

PRE QUEUEIN=safetynet0 OUT=safetynet0 PHYSIN=eth2 PHYSOUT=eth1 
SRC=68.16.185.132 DST=68.16.185.130 LEN=41 TOS=0x00 PREC=0x00 TTL=64 ID=3072 
PROTO=TCP SPT=3133 DPT=45495 WINDOW=2048 RES=0x00 ACK URGP=0

POST QUEUEIN=safetynet0 OUT=safetynet0 PHYSIN=eth2 PHYSOUT=eth1 
SRC=68.16.185.132 DST=68.16.185.130 LEN=41 TOS=0x00 PREC=0x00 TTL=64 ID=3072 
PROTO=TCP SPT=3133 DPT=45495 WINDOW=2048 RES=0x00 ACK URGP=0


----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 07, 2005 4:01 PM
Subject: Re: transparent bridge troubles?


> On Fri, Jan 07, 2005 at 03:55:58PM -0500, mdpeters wrote:
>> OK. This is what I have loaded now.
>>
>> /usr/local/sbin/iptables -P FORWARD DROP
>> /usr/local/sbin/iptables -A FORWARD -j LOG --log-prefix
>> /var/iptablequeue/pre_queue
>> /usr/local/sbin/iptables -A FORWARD -p tcp --syn -m state --state NEW -j
>> QUEUE
>> /usr/local/sbin/iptables -A FORWARD -p tcp -m state --state
>> RELATED,ESTABLISHED -j QUEUE
>> /usr/local/sbin/iptables -A FORWARD -p udp -j QUEUE
>> /usr/local/sbin/iptables -A FORWARD -p icmp -j QUEUE
>> /usr/local/sbin/iptables -A FORWARD -j LOG --log-prefix
>> /var/iptablequeue/post_queue
>>
>> I should see some sort of log file in /var/iptablequeue/post_queue or
>> /var/iptablequeue/pre_queue now? Should I try sending packets through the
>> bridge to generate something?
>
> uh--no.  those rules might not even load.  "--log-prefix" specifies a
> string to prefix the log entries in your syslog files.  my rules were
> literal:
>
> /usr/local/sbin/iptables -A FORWARD -j LOG --log-prefix "PRE QUEUE: "
>
> ...
>
> /usr/local/sbin/iptables -A FORWARD -j LOG --log-prefix "POST QUEUE: "
>
> so the entries in /var/log/messages will have the strings "PRE QUEUE: "
> and "POST QUEUE: " in them for identification purposes.
>
> -j
>
> --
> "Kids, you tried your best and you failed miserably. The lesson is,
> never try."
>        --The Simpsons
>
> 


