From: Geffrey Velasquez <g_netfilter@netfids.com>
Subject: Re[2]: Source and Destination port 0
Date: Tue, 15 Jul 2003 14:16:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <391677265.20030715141608@netfids.com>
References: <190809607.20030715121644@netfids.com>
 <20030715175713.GF24604@cannon.eng.us.uu.net>
Reply-To: Geffrey Velasquez <g_netfilter@netfids.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030715175713.GF24604@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

More detail:

RD> If the FORWARD chain is not blocking these faulty packets it might mean
RD> that the packets are being generated on the firewall itself.

Maybe, but in this suposed case, my firewall had to be compromised,
It has installed tripwire and.. I don't see signs of intrussion.

RD>  Try to block
RD> them on the OUTPUT chain as well and see what happens.

I put the rules also in the OUTPUT chain, and I still continue getting
the packets

RD> The next step would
RD> be to figure out why you get them.

Its a sample of the snort logs, the destination IP is an internal
NATed IP address, maybe source IP is spoffed:

[**] [116:56:1] (snort_decoder): T/TCP Detected [**]
07/15-13:46:24.988459 216.136.173.130:0 ->  . . . :0
TCP TTL:52 TOS:0x0 ID:59827 IpLen:20 DgmLen:68 DF
******S* Seq: 0x65FF5C67  Ack: 0x0  Win: 0xFFFF  TcpLen: 48

[**] [116:56:1] (snort_decoder): T/TCP Detected [**]
07/15-13:47:20.446750 66.163.169.17:0 ->  . . . :0
TCP TTL:51 TOS:0x0 ID:32453 IpLen:20 DgmLen:68 DF
******S* Seq: 0xFE485E60  Ack: 0x0  Win: 0xFFFF  TcpLen: 48

I will continue investigating, but someone could give me
recommendations?


Regards,
Geffrey


RD> Ramin

RD> On Tue, Jul 15, 2003 at 12:16:44PM -0500, Geffrey Velasquez wrote:

>> Hello Friends,
>> 
>> I have in my IDS logs packets comming from outside to DMZ servers with
>> source port 0 and destination port 0.
>> 
>> The IDS is located in the DMZ network, and I have an iptables
>> firewall, kernel-2.4.18-26.1.99_kb2c.1foo over RH 8 (that is the
>> kernel with superfreeswan patches).
>> 
>> I tried with this couple of rules on top of FORWARD chain:
>> 
>> $IPT -A FORWARD -p tcp --sport 0 -j LOG --log-prefix "Zero: "
>> $IPT -A FORWARD -p tcp --sport 0 -j DROP
>> 
>> also:
>> 
>> $IPT -A FORWARD -p tcp --sport 0 --dport 0 -j LOG --log-prefix "Cero: "
>> $IPT -A FORWARD -p tcp --sport 0 --dport 0 -j DROP
>> 
>> After that I continue viewing the bad packets on IDS, how could I
>> filter this kind of packets?
>> 
>> 
>> -- 
>> Best regards,
>>  Geffrey                          mailto:g_netfilter@netfids.com
>> 


