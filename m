From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: order of HOOK functions
Date: Sat, 27 Mar 2010 17:37:06 +0530
Message-ID: <cfeab66d1003270507x34619d33i8623473e10496af5@mail.gmail.com>
References: <cfeab66d1003230911q931ed69od7d0d38b013a175b@mail.gmail.com>
	 <cfeab66d1003230913u499712dbp164e2fdb72a6491a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=m54JFp2qCez976Uq8idaM7qxSPsD8VpGIc8pcHiFiqs=;
        b=iAKGdKF7HzSAKnPS0dBRptPK8lxvaHJxOOMLKfOCnZx/BZ+3CUBrQZsVSSIs4+n1U8
         eVXu1NhZlRjXfL97CFzoVmyxKihb5cjDRO8ixE7X1jRkmEEmkXeG0hkzqIv0CqQYAprN
         x9iSBJqUcEFupM/7uaioeWvZn/fOt6KhSOG/s=
In-Reply-To: <cfeab66d1003230913u499712dbp164e2fdb72a6491a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I should have done some more google , before asking simple questions li=
ke this .

enum nf_ip_hook_priorities {
        NF_IP_PRI_FIRST =3D INT_MIN,
        NF_IP_PRI_CONNTRACK_DEFRAG =3D -400,
        NF_IP_PRI_RAW =3D -300,
        NF_IP_PRI_SELINUX_FIRST =3D -225,
        NF_IP_PRI_CONNTRACK =3D -200,
        NF_IP_PRI_MANGLE =3D -150,
        NF_IP_PRI_NAT_DST =3D -100,
        NF_IP_PRI_FILTER =3D 0,
        NF_IP_PRI_SECURITY =3D 50,
        NF_IP_PRI_NAT_SRC =3D 100,
        NF_IP_PRI_SELINUX_LAST =3D 225,
        NF_IP_PRI_CONNTRACK_CONFIRM =3D INT_MAX,
        NF_IP_PRI_LAST =3D INT_MAX,
};


Thanks,
Ratheesh.

On Tue, Mar 23, 2010 at 9:43 PM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
> On Tue, Mar 23, 2010 at 9:41 PM, ratheesh k <ratheesh.ksz@gmail.com> =
wrote:
>> I have a rule
>>
>> R1------> =A0iptables -A FORWARD =A0-j ACCEPT =A0-
>>
>> After applying =A0the above rule , i executed the below program
>>
>>
>> ********************************************************************=
************************************
>> /* copied from http://sts.synflood.de/dump/doc/p61-0x0d_Hacking_the_=
Linux_Kernel_Network_Stack.txt
>> */
>>
>>
>> =A0 /* Initialisation routine */
>> =A0 =A0 =A0 =A0 =A0int init_module()
>> =A0 =A0 =A0 =A0 =A0{
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Fill in our hook structure */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0nfho.hook =A0 =A0 =3D hook_func;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Handler function */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0nfho.hooknum =A0=3D NF_IP_PRE_ROUTING; /*=
 First for IPv4 */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0nfho.pf =A0 =A0 =A0 =3D PF_INET;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0nfho.priority =3D NF_IP_PRI_FIRST; =A0 /*=
 Make our func first */
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0nf_register_hook(&nfho);
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> =A0 =A0 =A0 =A0 =A0}
>>
>> /* This is the hook function itself */
>> unsigned int hook_func(unsigned int hooknum,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct sk_buff **skb,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct net_device =
*in,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct net_device =
*out,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int (*okfn)(struct sk_bu=
ff *))
>> {
>> =A0 =A0return NF_DROP; =A0 =A0 =A0 =A0 =A0 /* Drop ALL packets */
>> }
>>
>> ********************************************************************=
**********************************************************
>> I executed below rule - R2 =A0 .
>>
>> R2 =A0 --- > iptables =A0-I =A0FORWARD -j REJECT .
>>
>>
>> Question : to which target is chosen ( DROP or REJECT or ACCEPT ) . =
{
>> order of hook function ?? }
>>
>> Thanks,
>> RAtheesh
>
>
>
> There is a mistake in the question . Hook is NF_IP_FORWARD =A0.
>
> Thanks,
> Ratheesh
>
