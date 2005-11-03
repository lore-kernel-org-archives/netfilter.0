From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: Re: iptables problem
Date: Thu, 3 Nov 2005 16:54:01 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0511031652560.8922@darkstar.sysinfo.com>
References: <20051103062533.C48C96AA57@smtp.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051103062533.C48C96AA57@smtp.sterenborg.info>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1




Why not have one system that reaches out for the files, and brings them 
inside, then point the kiosks at that one system?  Far easier to maintain 
and troubleshoot and far less FW coding.


Thanks,

Ron DuFresne


On Thu, 3 Nov 2005, Rob Sterenborg wrote:

>>     Yes, the kiosks are behind the firewall (iptables) and need
>> unrestricted access to and from the internet, but only for FTP.
>
> ...
>
>>     All right, so this is what I currently have in my iptables rules:
>>
>> -A PREROUTING -i eth0 -p tcp -m tcp --dport 21 -j DNAT
>> --to-destination 192.168.1.xxx
>> -A PREROUTING -i eth0 -p tcp -m tcp --dport 20 -j DNAT
>> --to-destination 192.168.1.xxx
>>
>>     ...and further down:
>>
>> -A FORWARD -i eth0 -o eth2 -p tcp -m state --state NEW -m tcp
>> --dport 21 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>> -A FORWARD -i eth0 -o eth2 -p tcp -m state --state NEW -m tcp
>> --dport 20 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
>
> I assume your FORWARD policy is DROP ?
>
> If you use RELATED,ESTABLISHED, you only need to allow port 21. Port 20
> is then RELATED to the connection. So, do you also have (something like)
> :
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>
> You *do* load the ftp conntack helpers, do you ?
>
>>     In my logs, I see this:
>>
>> kernel: New not syn:IN=eth2 OUT=eth0 SRC=192.168.1.xxx
>> DST=206.112.90.196 LEN=67 TOS=0x00 PREC=0x00 TTL=127 ID=1587 DF
>> PROTO=TCP SPT=1186 DPT=21 WINDOW=65338 RES=0x00 ACK PSH URGP=0
>>
>> kernel: New not syn:IN=eth2 OUT=eth0 SRC=192.168.1.xxx
>> DST=206.112.90.196 LEN=67 TOS=0x00 PREC=0x00 TTL=127 ID=1588 DF
>> PROTO=TCP SPT=1181 DPT=21 WINDOW=65196 RES=0x00 ACK PSH URGP=0
>>
>> kernel: New not syn:IN=eth2 OUT=eth0 SRC=192.168.1.xxx
>> DST=206.112.90.196 LEN=67 TOS=0x00 PREC=0x00 TTL=127 ID=1589 DF
>> PROTO=TCP SPT=1184 DPT=21 WINDOW=65338 RES=0x00 ACK PSH URGP=0
>
> This looks like an ACK to me. Not sure why such packet would be in the
> NEW state on port 21, where a ftp-client would connect to at first so I
> would think it would be in the ESTABLISHED state. (Also not sure what
> the logging rule looks like.)
> Maybe someone else who has better knowledge of this can help here.
>
> You could skip the tcp-flags at first and see if that works.
>
>>     The other problem is that, while I can change the FTP port on the
>> kiosks, I can't change it on the other end (the receiving and sending)
>> so I'm not sure how to handle that part.  They will always attempt to
>> connect on the standard FTP port, which two of these machines
>> won't be listening to since I would've changed them so they don't
>> conflict with one another.  Or is that not so?
>
> You don't have to run the ftp service of the kiosk hosts on different
> ports : just forward the external ports, let's say (40/)41 and (60/)61,
> to ports (20/)21 on the kiosk hosts. But that is no solution to your
> problem I suppose, because of the serverside problem.
>
> Maybe you can let the kiosk hosts connect to the server and perform GET
> and PUT commands. The server then only has to put the needed updates in
> a specific directory where the kiosk hosts can download them from. This
> way the hosts themselves don't have to be reachable on the internet
> which would be better from a security point of view.
>
>
> Gr,
> Rob
>
>

- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFDaob8st+vzJSwZikRAqYCAKDUUlIYj/Kc10C/NxsnEpRxRb4jjQCfTBU3
RYixAO5DstCZTr9QMCqXygI=
=hj6F
-----END PGP SIGNATURE-----

