From: "Leandro Takashi Hirano" <takashi@alcidesmaya.com.br>
Subject: Re: IP Spoofing
Date: Wed, 5 Nov 2003 18:19:01 -0200 (BRST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <60250.200.180.160.130.1068063541.squirrel@www.alcidesmaya.com.br>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br>
        <200311051951.hA5Jpdr13332@agate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311051951.hA5Jpdr13332@agate.rockstone.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Lista de Mail netfilter <netfilter@lists.netfilter.org>

Thanks Antony...

Do you have a script or something where I can find protection rules?



> On Wednesday 05 November 2003 7:31 pm, Leandro Takashi Hirano wrote:
>
>> Thanks for the port scanner help....
>>
>> Now I would like to know about the IP Spoofing rule, how does it
>> works?
>>
>> -	iptables -A INPUT -s 192.168.1.0/24 -i ! eth0 -j DROP
>
> Any packet with a source address in the Class C range 192.168.1.x which
> does  not come from eth0 will be DROPped.
>
>> -	iptables -A INPUT ! -s 192.168.1.0/24 -i eth0 -j DROP
>
> Any packet which comes from eth0 and has a source address other than the
>  Class C  192.168.1.x will be DROPped.
>
>> I don=B4t know how can it block ip spoofing attack...
>
> These rules assume that eth0 is your internal network, and your internal
>  network range is 192.168.1.0/24.
>
> No packets with your own source address should come from outside (rule
> 1) and  all packets from inside should have your own source address
> (rule 2).
>
> Therefore these two rules stop people on the outside pretending that
> they  live on your network, and people on the inside pretending that
> they don't.
>
> Antony.
>
> --
>
> In Heaven, the police are British, the chefs are Italian, the beer is
> Belgian, the mechanics are German, the lovers are French, the
> entertainment  is American, and everything is organised by the Swiss.
>
> In Hell, the police are German, the chefs are British, the beer is
> American,  the mechanics are French, the lovers are Swiss, the
> entertainment is Belgian,  and everything is organised by the Italians.
>                                                      Please reply to the
> list;
>                                                            please don't
> CC me.




