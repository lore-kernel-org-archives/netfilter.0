From: Alexis <alexis@attla.net.ar>
Subject: Re[2]: strange connetions to exodus.net
Date: Sat, 21 Feb 2004 15:06:28 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <96993686.20040221150628@attla.net.ar>
References: <20040221122547.1cb9a3eb.anmeyer@gmx.net>
 <1077377146.5329.8.camel@tarkus> <20040221170951.6d7ddfae.anmeyer@gmx.net>
 <200402211136.22220.JALaramie@Loudoun-Fairfax.com>
 <20040221181940.7dc7d439.anmeyer@gmx.net>
Reply-To: Alexis <alexis@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040221181940.7dc7d439.anmeyer@gmx.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Meyer <anmeyer@gmx.net>
Cc: netfilter@lists.netfilter.org

Now we see.

Like you said, if this is your webserver, some site inside your
webserver are using ads in this destination

exodus are only the dns for this addresses, but you are connecting to servedby.advertising.com

and, in your schema, where is 192.168.20.60?




Hello Andreas,

Saturday, February 21, 2004, 2:19:40 PM, you wrote:

AM> Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com> wrote:

>> > Ted:
>> >
>> > Feb 21 16:59:22 delta kernel: DROP-TCP :IN= OUT=eth1 SRC=192.168.20.60 \
>> >  DST=209.225.11.237 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 PROTO=TCP \
>> >  SPT=41504 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0
>> > Feb 21 16:59:23 delta kernel: DROP-TCP :IN= OUT=eth1 SRC=192.168.20.60 \
>> >  DST=82.139.196.116 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=22160 PROTO=TCP \
>> >  SPT=41501 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0
>> >
>> > Good point but this is my own site at 82.139.196.116 and I am sure
>> > there is nothing pointing to exodus.net. Is this a DNS thing?
>> 
>> I don't see any IPs in your postings that point to exodus.net so I don't know
>> where you're seeing that. The IP in your first posting is most likely adware
>> running on the client 192.168.20.60 and the IP in your 2nd posting doesn't
>> resolve. You need to check the processes running on 192.168.20.60 to see
>> which one is calling these sites.

AM> # dig -x 209.225.0.6

AM> ; <<>> DiG 9.2.2 <<>> -x 209.225.0.6
AM> ;; global options:  printcmd
AM> ;; Got answer:
;; ->>>HEADER<<- opcode: QUERY, status: NOERROR, id: 65525
AM> ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 4, ADDITIONAL: 0

AM> ;; QUESTION SECTION:
AM> ;6.0.225.209.in-addr.arpa.      IN      PTR

AM> ;; ANSWER SECTION:
AM> 6.0.225.209.in-addr.arpa. 3600  IN      PTR     servedby.advertising.com.

AM> ;; AUTHORITY SECTION:
AM> 0.225.209.in-addr.arpa. 3600    IN      NS      dns03.exodus.net.
AM> 0.225.209.in-addr.arpa. 3600    IN      NS      dns04.exodus.net.
AM> 0.225.209.in-addr.arpa. 3600    IN      NS      dns01.exodus.net.
AM> 0.225.209.in-addr.arpa. 3600    IN      NS      dns02.exodus.net.

AM> ;; Query time: 290 msec
AM> ;; SERVER: 192.168.1.75#53(192.168.1.75)
AM> ;; WHEN: Sat Feb 21 18:01:40 2004
AM> ;; MSG SIZE  rcvd: 170

AM> # dig -x 209.225.11.237

AM> ; <<>> DiG 9.2.2 <<>> -x 209.225.11.237
AM> ;; global options:  printcmd
AM> ;; Got answer:
;; ->>>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 64855
AM> ;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 0

AM> ;; QUESTION SECTION:
AM> ;237.11.225.209.in-addr.arpa.   IN      PTR

AM> ;; AUTHORITY SECTION:
AM> 11.225.209.in-addr.arpa. 3600   IN      SOA    
AM> dns01.exodus.net. hostmaster.exodus.net.11.225.209.in-addr.arpa.
AM> 2002091300 10800 3600 604800 86400


AM> My LAN looks like this:

AM> WKS 192.168.1.3 connection per webbrowser to Squid at 192.168.1.75
AM> and the request from Squid is routed to the gateway 192.168.20.210

AM> and as soon I start a request a tail -f /var/log/firewall on the
AM> Squid-machine shows the request the above IPs. I don't known why.




-- 
Best regards,
 Alexis                            mailto:alexis@attla.net.ar


