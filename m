From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Problems with xtables-addons 1.3.7 on Gentoo
Date: Fri, 5 Aug 2011 20:49:13 +0700
Message-ID: <CAA2qdGV8wOB0t8ArT6xQWGLKtpDFCu5aKomBH4vZ7=Zky4L_Rg@mail.gmail.com>
References: <CAA2qdGWwQC7G-YR=onrUBVAOEG1yrM8Ambr3m5JxvEOPjj1c+A@mail.gmail.com>
	<1312551665.24824.9.camel@rybalov.eng.ttk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1312551665.24824.9.camel@rybalov.eng.ttk.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: nowhere <nowhere@hakkenden.ath.cx>
Cc: netfilter@vger.kernel.org

On Fri, Aug 5, 2011 at 20:41, nowhere <nowhere@hakkenden.ath.cx> wrote:
> =D0=92 =D0=9F=D1=82=D0=BD, 05/08/2011 =D0=B2 20:19 +0700, Pandu Polua=
n =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> I'm having troubles with xtables-addons 1.3.7 on Gentoo.
>>
>> I successfully installed xtables-addons (no errors), but all attempt=
s
>> to create an IP set (e.g., `ipset --create test hash:ip`) resulted i=
n
>> the following error message:
>>
>> FATAL: Error inserting ip_set
>> (/lib/modules/2.6.39-hardened-r8PANS_GW_BN_02/xtables_addons/ip_set.=
ko):
>> Invalid module format
>>
>> `insmod` begat an additional information:
>>
>> insmod: error inserting
>> '/lib/modules/2.6.39-hardened-r8PANS_GW_BN_02/xtables_addons/ip_set.=
ko':
>> -1 Invalid module format
>>
>> `dmesg | tail -1` gave a worrying error:
>>
>> [ 4085.271442] ip_set: exports duplicate symbol ip_set_nfnl_put (own=
ed
>> by kernel)
>>
>> What should I do?
>
> Do you by any chance have ipset enabled in kernel config or ipset
> separatedly installed with "modules" use-flag?
>

Yes, I have ipset enabled in kernel, and no, I don't have ipset
installed separately.

A kind friend at gentoo-user led me to CONFIG_IP_SET

Apparently xtables-addons hates IP_SET=3Dy

So, I rebuild the kernel with IP_SET=3Dm , and all is well.

Anyways, thank you for your attempt to help :-)

Rgds,
--=20
Pandu E Poluan
~ IT Optimizer ~

 =E2=80=A2 Blog : http://pepoluan.tumblr.com
 =E2=80=A2 Linked-In : http://id.linkedin.com/in/pepoluan
