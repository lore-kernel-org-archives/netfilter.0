From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: port forwarding form IP range
Date: Mon, 13 Mar 2006 10:15:53 +0100 (CET)
Message-ID: <51754.193.173.147.3.1142241353.squirrel@webmail.sterenborg.info>
References: <581260b00603110440y7cca1117o@mail.gmail.com>
	<20060313085358.83165.qmail@web50511.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060313085358.83165.qmail@web50511.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, March 13, 2006 09:53, Nilesh wrote:
> Thanks Leandro,
>
> I have tried with this rules but unfortunately not
> working.
> Squid server running on the 192.168.0.3 and its
> working  fine. I have not installed any firewall on
> the 192.168.0.3.
> In my Internet browser settings If I chnage the
> settings from 192.168.0.1:3128 to 192.168.0.3:3128 I
> can surf the web.
> but If I dont change to 192.168.0.3:3128 proxy
> settings I get the connection timout error.
>
> I think DNAT is not working

Probably you tell Netfilter to do DNAT, but are not allowing it.
Do you have a FORWARD rule that allows this traffic or is your policy ACC=
EPT ?

Please don't top-post.


Gr,
Rob


> --- Leandro Silva <lansoweb@gmail.com> wrote:
>
>> Hello !
>>
>> You can use something like that:
>>
>> iptables -I PREROUTING -t nat -s 192.168.0.10 -p tcp
>> --dport 80 -j
>> DNAT --to 192.168.0.3:3128
>> iptables -I PREROUTING -t nat -s 192.168.0.10 -p tcp
>> --dport 3128 -j
>> DNAT --to 192.168.0.3:3128
>>
>> If you have iprange compiled for iptables you can
>> use:
>>
>> iptables -I PREROUTING -t nat -m iprange --src-range
>> 192.168.0.10-192.168.0.20 -p tcp --dport 80 -j DNAT
>> --to
>> 192.168.0.3:3128
>> iptables -I PREROUTING -t nat -m iprange --src-range
>> 192.168.0.10-192.168.0.20 -p tcp --dport 3128 -j
>> DNAT --to
>> 192.168.0.3:3128
>>
>> I hope this can help,
>> Leandro
>>
>> 2006/3/11, Nilesh <niluforalways@yahoo.com>:
>> > Dear all,
>> >
>> > I have two squid proxy servers and two ISP
>> >
>> > 1)      192.168.0.1 port 3128
>> > 2)      192.168.0.3 port 3128
>> >
>> > We have around 70 comps assigned IP's between
>> > 192.168.0.4 to 192.168.0.250
>> > The default proxy we are using is 192.168.0.1
>> which is
>> > on the ISP 1.
>> > Now I have configured 192.168.0.3 squid proxy
>> server
>> > on ISP 2 line.
>> > Both ISP 1 and ISP 2 are landing (connected) on
>> the
>> > same Switch.
>> >
>> > Now I want setup the request coming from IP range
>> > (192.168.0.10 to 192.168.0.20) for the
>> > 192.168.0.1:3128
>> > Will be forward to 192.168.0.3:3128
>> > So the users from this IP range will access only
>> > 192.168.0.3 proxy server.
>> >
>> > Could any one please help me which rules should I
>> use
>> > in IPTABLES .
>> >
>> > I have attached herewith my rc.firewall file.
>> >
>> > Please help me.
>> >
>> > Regards
>> > Nilesh.



