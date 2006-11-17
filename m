From: Mogens Kjaer <mk@crc.dk>
Subject: Re: NAT with two external IP numbers
Date: Fri, 17 Nov 2006 08:24:44 +0100
Message-ID: <455D63BC.8090703@crc.dk>
References: <455C5B7A.5040702@crc.dk>
	<7e67d4983f901ba3347a12c19f4fe4ce@former03.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7e67d4983f901ba3347a12c19f4fe4ce@former03.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

former03 | Baltasar Cevc wrote:
> Hi Mogens,
> 
>> Give the linux box two IP numbers externally,
>> e.g. 130.226.184.38 and 130.226.184.39, register
>> 130.226.184.38 with the journal, change the
>> internal IP numbers so that:
>>
>  > [...]
>>
>> /sbin/iptables -t nat -A POSTROUTING -s 172.20.0.0/17 -o eth0 -j 
>> MASQUERADE
>> /sbin/iptables -t nat -A POSTROUTING -s 172.20.128.0/17 -o eth0:1 -j 
>> MASQUERADE
> 
> eth0:1 is not a real interface so no packets can go out there. It would be
> good if iptables would throw an error, but probably it's hard for the 
> software
> to tell what are 'real' interfaces.
> 
> You must use the SNAT target to achieve what you want:
> /sbin/iptables -t nat -A POSTROUTING -s 172.20.0.0/17 -o eth0 -j SNAT 
> --to 130.226.184.38
> /sbin/iptables -t nat -A POSTROUTING -s 172.20.128.0/17 -o eth0 -j SNAT 
> --to 130.226.184.39

Thanks! It works.

iptables did give me a warning about eth0:1, but an "iptables -t nat -L"
did show that the command was accepted.

Mogens

-- 
Mogens Kjaer, Carlsberg A/S, Computer Department
Gamle Carlsberg Vej 10, DK-2500 Valby, Denmark
Phone: +45 33 27 53 25, Fax: +45 33 27 47 08
Email: mk@crc.dk Homepage: http://www.crc.dk

