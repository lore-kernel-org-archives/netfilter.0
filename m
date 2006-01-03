From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: pom-ng "condition" for 2.6 kernels
Date: Tue, 03 Jan 2006 15:48:00 +0100
Message-ID: <43BA8EA0.5060907@arcoscom.com>
References: <43B8526C.4040706@arcoscom.com>	
	<1136224428.5569.9.camel@davila.nicaraguaopensource.com>	
	<43BA8786.4070809@arcoscom.com>
	<1136298300.2565.10.camel@davila.nicaraguaopensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1136298300.2565.10.camel@davila.nicaraguaopensource.com>
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
To: Jorge Davila <davila@cablenet.com.ni>
Cc: netfilter@lists.netfilter.org

Jorge, I don't know if you stand me, but the problem isn't if I know how=20
to use patch-o-matic.

The problem is a bug in patch-o-matic (or mistake) that don't allow to=20
use "condition" patch with 2.6.x kernels.

I explain in the message you reply.

Regards

Jorge Davila escribi=F3:

> well, you can do the next to avoid write some vars in the ./runme
> command:
>=20
> export KERNEL_DIR=3D/path/to/kernel/source/code
> export IPTABLES_DIR=3D/path/to/iptables/source/code
>=20
> in the patches source code, run:
>=20
> ./runme <pending|base|extras>
>=20
> I don't exactly what option will show you the patch that you want apply.
>=20
> Jorge.
>=20
> El mar, 03-01-2006 a las 15:17 +0100, Samuel D=EDaz Garc=EDa escribi=F3:
>=20
>>Fine, I know how to apply pom without problems.
>>
>>The problem is that applying over a 2.6.14.5 kernel (2.6.x kernels) the=20
>>"condition" patch isn't showed for the apply.
>>
>>"Kovacs Krisztian" (hidden_#arroba#_balabit.hu) sent to me the patch to=20
>>apply over an 2.6.14.5 kernel and appears to be working fine (at least=20
>>applied, compiled and installed with the new compiled kernel).
>>
>>I had tried to found the problem, and I think that the "condition" isn't =

>>ported into 2.6.x kernels because a "linux-2.6" directory doesn't exist=20
>>into the "patchlets/condition", and that (I think) is because=20
>>"condition" isn't showed while "./runme extra" is running.
>>
>>I want to know if really "condition" is included for 2.6 kernels into=20
>>pom-ng and why is failing the "./runme".
>>
>>Sorry for my poor english.
>>
>>Regards.
>>
>>Jorge Davila escribi=F3:
>>
>>
>>>In the patches source code directory:
>>>
>>>KERNEL_DIR=3D/the/path/to/kernel-2.6.14/source/code/directory
>>>IPTABLES_DIR=3D/the/path/to/iptables/source/code/directory ./runme
>>><pending|base|extras>
>>>
>>>Of course, you need the source code for your kernel and for iptables.
>>>
>>>Jorge.
>>>
>>>El dom, 01-01-2006 a las 23:06 +0100, Samuel D=EDaz Garc=EDa escribi=F3:
>>>
>>>
>>>>Is there any way to apply "condition" patch into 2.6.14 kernel?
>>>>
>>>>I can see "linux" directory into "patchlets/condition" but not a=20
>>>>"linux-2.6" directory.
>>>>
>>>>Any help about it?
>>>>
>>>>Thanks
>>>>
>>

--=20
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

M=F3vil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83

