From: Tiaan Wessels <tiaan@netsys.co.za>
Subject: Re: Packet duplication
Date: Thu, 25 Oct 2007 07:35:18 +0000
Message-ID: <47204736.8030803@netsys.co.za>
References: <47184C6D.40202@netsys.co.za> <47186FC3.6030402@freemail.hu> <471875A4.8010000@netsys.co.za> <471882D0.2060602@freemail.hu> <47188A9A.2080604@netsys.co.za> <003801c81242$c160fec0$0b0ffe0a@NS006819> <471F003A.7090501@netsys.co.za> <001501c81620$a81ac3b0$0b0ffe0a@NS006819> <471F17BC.9060507@netsys.co.za> <001601c81629$cd4831f0$0b0ffe0a@NS006819> <471F21E7.2000901@netsys.co.za> <002e01c8163b$d1f931b0$0b0ffe0a@NS006819> <471F5E9C.5010802@netsys.co.za> <000b01c81654$93026210$fa92fea9@tanjian> <4720345D.40906@netsys.co.za> <000301c816d8$1e355da0$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000301c816d8$1e355da0$0b0ffe0a@NS006819>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Rob Sterenborg wrote:
>> thanks a million Rob,
>>     
>
> You're welcome..
>
>   
>> I got it working at last using your instructions.
>> cheers
>>     
>
> Does this mean that the ROUTE patch is actually working (I didn't get to
> test that) and which kernel version did you use?
>
>   
not exactly, it only meant all error messages was gone printed to the 
tty when i run the iptables command. i'm now trying to create what i 
originally set out to do. if you'r interested here's my scenario.

i have one machine with two interfaces eth0 192.168.51.151 and eth1 
192.168.3.11. i have udp packets coming in on eth1 from 192.168.3.77 
destined for 192.168.3.11:9090 . i want to duplicate these packets so 
they go to their original destination but also go out on eth0 to 
192.168.51.46:9090. that's in short what i'm trying. so i have the 
following rules i'm trying now (hope this is not laughable as i'm a novice)

/usr/local/sbin/iptables -F INPUT
/usr/local/sbin/iptables -F OUTPUT
/usr/local/sbin/iptables -F FORWARD
/usr/local/sbin/iptables -t nat -F POSTROUTING
/usr/local/sbin/iptables -t nat -F PREROUTING
/usr/local/sbin/iptables -t mangle -F POSTROUTING
/usr/local/sbin/iptables -t mangle -F PREROUTING

/usr/local/sbin/iptables -t mangle -A PREROUTING -p udp --dport 9090 -j 
ROUTE --tee
/usr/local/sbin/iptables -t nat -A PREROUTING -p udp --dport 9090 -j 
DNAT --to-destination 192.168.51.46:9090

but alas once i run these commands the packets just disappear. it 
doesn't reach either of the two destinations then. any comments ?
