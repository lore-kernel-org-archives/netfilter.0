From: "Jesper Lund" <jesper@ballbreaker.dk>
Subject: Re: How to block NetBios Traffic
Date: Sat, 21 Jun 2003 20:05:19 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2047.212.242.51.102.1056218719.squirrel@www.ramstedt.dk>
References: <BAY2-F589cPvs0Z60e200002d47@hotmail.com> 
     <20030621164835.GA12820@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030621164835.GA12820@cannon.eng.us.uu.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


> netbios-dgm     138/tcp                         # NETBIOS Datagram Service
> netbios-dgm     138/udp
>
> Just drop these in prerouting on the incoming interface. BTW, the reason
> that
> you see these does not mean that your firewall does respond to them. They
> are
> all being broadcast. That's why you see them with tcpdump.
>
> Ramin
>
> On Fri, Jun 20, 2003 at 05:43:00PM +0000, John Moore wrote:
>
>> Dear Sir,
>>
>>            I have setup a proxy server for internet access in my
>> organization which has 2 ethernet interfaces ; one on internal network
>> (private ip address) while other at external network (public ip
>> address).
>>            I am getting a lot of netbios traffic on my internal ethernet
>> interface. Below is some log from "tcpdump".
>>
>> 23:07:23.882767 10.8.99.94.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:25.099189 10.8.99.246.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:25.530105 10.8.99.151.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:25.588964 10.8.99.53.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:30.029731 10.8.99.32.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:31.967519 10.8.99.117.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:35.444045 10.8.99.93.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:40.557846 10.8.99.153.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:41.990228 10.8.99.72.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:43.427439 10.8.99.111.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:49.453507 10.8.99.252.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:49.989453 10.8.99.86.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:07:56.425559 10.8.99.95.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:08:00.874673 10.8.99.83.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:08:06.093484 10.8.99.152.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:08:11.742309 10.8.99.115.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>> 23:09:12.733224 10.8.99.248.netbios-dgm > 10.8.99.255.netbios-dgm: NBT
>> UDP
>> PACKET(138)
>>
>>
>>         Sir, I want to block this traffic using IPTABLEs. IPTABLES is
>> installed on my proxy server.
>> Please help me by telling me how to block this traffic.
>>         I hope a positive reply from your side.
>> Thank you.
>>
>> --------------------------------------------------------------------------------
>> You maust do the thing you can not do. And remember , the finest steel
>> gets
>> sent through the hottest furnace...
>>
>> Champion is not one who never fails , but one who NEVER QUITS...
>>
>>
>> -----------------------------------------------------------------
>>
>> _________________________________________________________________
>> MSN 8 with e-mail virus protection service: 2 months FREE*
>> http://join.msn.com/?page=features/virus
>>
>
>


-- 
www.ballbreaker.dk/antispam/

