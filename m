From: =?utf-8?Q?Mart=C3=ADn?= <martin@familia-fiumara.com.ar>
Subject: Re: redirection trouble
Date: Mon, 03 Nov 2003 23:37:26 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <oprx3dkos4dpszyy@192.168.2.1>
References: <oprx3bjjmldpszyy@192.168.2.1> <200311032121.09664.Alistair@nerdnet.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311032121.09664.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
To: alistair@nerdnet.ca
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

En Mon, 3 Nov 2003 21:21:09 -0500, Alistair Tonner <Alistair@nerdnet.ca> 
escribió:

> On November 3, 2003 08:53 pm, Martín wrote:
>> This is the situation:
>>
>>
>>
>> Internal LAN machine (192.168.2.5)
>>
>>
>>
>> (eth1 192.168.2.1) NAT LINUX ( eth0 192.168.1.10 > adsl ppp0 IP dinamic)
>>
>>
>>
>> Server 200.45.45.200 (service at port 10000)
>>
>>
>>
>> This is what I intend to do:
>> For particular reasons, I need that a soft at 192.168.2.5 comunicate 
>> with a
>> server with a service at port 10000 (UDP), but this can´t be done 
>> through
>> normal NAT. So i want to establish a link between both (server and
>> 192.168.2.5) manually useing the NAT LINUX
>> So, 192.168.2.5 comunicates to 192.168.2.1 port 10000, the NAT LINUX
>> redirect this traffic to the server 200.45.45.200 port 10000. The server
>> will respond to the NAT LINUX who will redirect this traffic to 
>> 192.168.2.5
>> (port 10000 also)
>> I try to do all this in this way:
>>
>>
>> iptables -t nat -I PREROUTING 1 -i eth1 -d 192.168.2.1 -p udp --dport 
>> 10000
>> -j DNAT --to 200.45.45.200
>>
>> iptables -t nat -I POSTROUTING 1 -o eth0 -p udp --dport 10000 -j SNAT -- 
>> to
>> 192.168.2.5
>
> 	This line is SNATing the packet on the way out eth0 to 192.168.2.5 ,,,,, 
> 	This NOT what you want to do ... this packet then will look like it came 
> from and went to the same ip address,
>
> 	The first line takes the packet from the source pc and DNATs it out to 
> the internet ip address 200.45.45.200 ... the UNDOING of this is 
> automatic.   However ... what you DO need to do is
>
> iptables -t nat -I POSTROUTING 1 -o ppp0 -p udp -dport 10000 -j SNAT --to 
> (outiside ip of firewall)
>
> since sending the packet out the door to the internet with the source 
> address of 192.168.2.5 will cause the packet to drop dead somewhere.
>
> Again .. .the UNDOing of this is automatic.

Actually may be you don´t understand what I want to do. I will explain me a 
little better:

iptables -t nat -I PREROUTING 1 -i eth1 -d 192.168.2.1 -p udp --dport 10000 
-j DNAT --to 200.45.45.200


WITH THIS LINE I WANT TO CATCH THE TRAFFIC COMEING FROM 192.168.2.5 
DIRECTED TO 192.168.2.1 : 10000 AND REDIRECT IT TO 200.45.45.200
THIS LINE SEEMS TO BE CORRECT AS I CAN SEE IN A SNIFFER



iptables -t nat -I POSTROUTING 1 -o eth0 -p udp --dport 10000 -j SNAT --to 
192.168.2.5

WITH THIS LINE I WANT TO CATCH THE RESPONSES FROM 200.45.45.200 (RESPONSES 
TO THE REDIRECTED TRAFFIC I SENT FROM 192.168.2.5) AND REDIRECT THIS 
INCOMEING TRAFFIC TO 192.168.2.5
THE INGOING AND OUTGOING PORT IS ALWAYS 10000
WHAT I NEED TO DO IS STABLISH A CONNECTION BETWEEN 192.168.2.5 AND A 
SERVICE RUNNING IN 200.45.45.200 : 10000, BUT 192.168.2.5 MUST THINK ALL 
THE TIME THAT THE SERVICE IS RUNNING AT 192.168.2.1 : 10000










>
>>
>>
>> BUT THIS IS NOT WORKING. I GET A MESSAGE FROM THE SOFT AT 192.168.2.5
>> TELLING "CONNECTION TIMED OUT"... USEING TCPDUMP i get this as the only
>> thing comeing back...:
>>
>> 200.45.45.200.10000 > 168.226.174.184.10000:  udp 8 [tos 0x40]
>>
>>
>>
>> I would apreciate any help with this trouble
>> Thanks
>



-- 
Using M2, Opera's revolutionary e-mail client: http://www.opera.com/m2/

