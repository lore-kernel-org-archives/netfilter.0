From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: spoof attack
Date: Tue, 17 Feb 2004 23:58:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402172358.19532.Antony@Soft-Solutions.co.uk>
References: <20040217194649.25aae312.fadel@ferasoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040217194649.25aae312.fadel@ferasoft.com.br>
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
To: netfilter@lists.netfilter.org

On Tuesday 17 February 2004 10:46 pm, Djalma Fadel Junior wrote:

> hi there,
>
> I got the following log in my /var/messages:
>
> ----
> zeus kernel: sp00f attempt: IN=eth0 OUT=
> MAC=00:04:75:a0:c8:51:00:c0:df:ee:1d:dd:08:00 SRC=192.168.0.189
> DST=XXX.XXX.XXX.XXX LEN=1500 TOS=0x00 PREC=0x00 TTL=43 ID=17351 DF
> PROTO=TCP SPT=80 DPT=41971 WINDOW=57920 RES=0x00 ACK URGP=0 ----
>
> where:
>        XXX.XXX.XXX.XXX is my public IP.
>        eth0 is my EXTERNAL_DEVICE
>        eth1 is my INTERNAL_DEVICE
>        192.168.0.0/24 is my network

So, a packet addressed from 192.168.0.189 came in your external interface, 
addressed to your public IP address, and came from TCP source port 80 to 
destination port 41971.

> the attack duration was about 10 minutes. It happens 2 times in the last 3
> months.

> my firewall rules to prevent this are as below:
>
> ----
> $iptables -A PREROUTING -t nat -i ${EXTERNAL_DEVICE} -s ${INTER_IPADDR} -j
> LOG --log-level ${LOGLEVEL} --log-prefix "sp00f attempt: "
>
> $iptables -A PREROUTING -t nat -i ${EXTERNAL_DEVICE} -s ${INTER_IPADDR} -j
> DROP ----

So, these rules will log and then drop such packets.

> My questions:
>
> 1) How to understand the MAC logged by iptables since MAC has 6 bytes long?
>    00:04:75:a0:c8:51:00:c0:df:ee:1d:dd:08:00

00:04:75:a0:c8:51 is the MAC address of your firewall interface
00:c0:df:ee:1d:dd is the MAC address of the router it's connected to
08:00 means the protocol in use is IPv4 over ethernet

> 2) Is there some way to get the real IP where its come from?

The source IP address is 192.168.0.189

There is no way to tell where that machine is on the Internet (and it wouldn't 
be any easier if it were a public routable address either - anyone can spoof 
any address from anywhere).

> 3) Are my rules enough to avoid spoof?

Depends what you mean by "avoid".

Your rules will log spoofing attempts, and prevent packets with internal 
addresses being accepted on the external interface.   That's about as much as 
you can hope for.

Regards,

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


