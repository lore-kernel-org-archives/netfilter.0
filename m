From: "Ing. Rogelio Sevilla Fernandez" <sevilla@col.gob.mx>
Subject: Re: Problems With MASQ/ Kernel 2.4.29
Date: Fri, 11 Mar 2005 18:25:39 -0600
Message-ID: <20050311182539.1qvnqcekngg40kkk@mail.col.gob.mx>
References: <20050311180127.rcp5r70mjo0c4c4c@mail.col.gob.mx>
	<42323616.7010900@triple-it.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42323616.7010900@triple-it.nl>
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
To: Geert van der Ploeg <geert@triple-it.nl>
Cc: netfilter@lists.netfilter.org

Sorry, its correct.. i got the problem on POSTROUTING rule.



Quoting Geert van der Ploeg <geert@triple-it.nl>:

> Ing. Rogelio Sevilla Fernandez wrote:
>> I recently compiled kernel 2.4.29 with all netfilter options as modules.
>>
>> All start ok, but when i set the MASQUERADE jump target on POSTROUTING
>> i got:
>> iptables -t nat -I PREROUTING -o eth0 -j MASQUERADE
>> iptables: target problems.
>
> when using PREROUTING rules, you should specify the incoming 
> interface, not the outgoing.
> Or, said the other way around: when using an outgoing interface, you 
> should specify POSTROUTING rules.
>
> So, because you try to masquerade, what you really want is:
> iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE
>
> See section 5 in the NAT-howto for iptables.
>
>
> Hope this helps.
>
>
> Regards,
>
> Geert van der Ploeg
>



-----------------------------------------------------
"2005, A=D1O DE LA FEDERACION DE ESTUDIANTES COLIMENSES"


