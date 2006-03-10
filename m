From: Nathaniel Hall <nathaniel.d.hall@gmail.com>
Subject: Re: Error in Masquerade ??
Date: Fri, 10 Mar 2006 07:57:49 -0800
Message-ID: <20060310075749.97grq9b1g9w0w88w@www.spider-comm.com>
References: <581260b00603100701n3beddb20p@mail.gmail.com>
	<1142004434.2617.26.camel@davila.nicaraguaopensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1142004434.2617.26.camel@davila.nicaraguaopensource.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jorge Davila <davila@nicaraguaopensource.com>
Cc: netfilter@lists.netfilter.org

You shouldn't have to use SNAT at all.  Here is an example of a rule 
that I use
and it works great.

iptables -t nat -A POSTROUTING -s <network>/<subnet> -o eth0 -j MASQUERADE

I have to add a new rule for every rule that I want masqueraded, but I don'=
t
have to do any SNAT rules.

Nathan

Quoting Jorge Davila <davila@nicaraguaopensource.com>:

> Leandro:
>
> You need another rule to alter the source ip address of the outgoing
> packets.
>
> iptables -t nat -A POSTROUTING -o eth0 \
> -j SNAT --to-source <server_address>
>
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> Jorge.
>
> El vie, 10-03-2006 a las 12:01 -0300, Leandro Silva escribi=F3:
>> I have the following rule in my firewall:
>> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>> And that's the only rule if postrouting chain. It's working fine but
>> from time to time a packet leaves the server with the original ip and
>> not with the server's. It's happening  like 1 "wrong" packet for 100
>> or 200 ok.
>> I've tried in other servers with same results and different
>> "Mandrakes" ( 9.1, 10,1 and 2006.0 ). And different cpus ( p3, p4,
>> amd, all with 512 mb ram ).
>> Any ideias ?
>>
>> Thanks a lot
>> Leandro
>>
> --
> Jorge Isaac Davila Lopez
> Nicaragua Open Source
> +505 808 2478
> davila@nicaraguaopensource.com
>
>
>




