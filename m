From: Rodrigo Severo <rodrigo.lists@fabricadeideias.com>
Subject: Re: Problem using fwmarks as routing key: "MASQUERADE: Route sent
 us somewhere else."
Date: Fri, 23 Jan 2004 17:13:07 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40117243.4090606@fabricadeideias.com>
References: <001c01c3e043$93583cd0$1684188d@Kiste> <20040123160603.GA7516@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040123160603.GA7516@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Thhoep,

>On Wed, Jan 21, 2004 at 06:25:22PM +0100, Thhoep wrote:
>  
>
>>-----------
>>kernel: request_module: failed /sbin/modprobe -- net-pf-10. error =3D =
256
>>kernel: MASQUERADE: Route sent us somewhere else.
>>    
>>
I think you can easily solve your problem substituting MASQUERADE with 
SNAT. There is one upside and one downside to this solution.

The downside is the extra work you will have setting a create/delete 
updated SNAT each time an ADSL goes up/down.

The upside is that it actually works :)

I say so because I have a working 2 ADSL connections + 1 fixed 
connection setup working fine with the MARK + ip rule + SNAT mix.


I hope it helps you,

Rodrigo Severo

-- 
----------------------------------------------------
Rodrigo Severo
F=E1brica de Id=E9ias
Fone: +55(61)321 1357
Fax: +55(61)223 1712
SBS - Quadra 2 - Ed. Empire Center - Sala 1301
Bras=EDlia/DF - Brasil
CEP: 70.070-904
----------------------------------------------------


