From: Per Jessen <per@computer.org>
Subject: Re: basic load distribution using -m statistic --mode nth
Date: Fri, 28 Mar 2008 09:31:24 +0100
Message-ID: <47ECACDC.4090106@computer.org>
References: <47EC9CDF.5080009@computer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47EC9CDF.5080009@computer.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Per Jessen wrote:
> Patrick McHardy wrote:
>=20
>> DNAT is terminal, so you need:
>>
>> rule 1: --every 2 --packet 0
>> rule 2: unconditional
>>
>=20
> Thanks Patrick!  Just what I needed.


Hmm, I can't help wondering what the issue is in my second rule:


rule 1: --every 2 --packet 0
rule 2: --every 2 --packet 1

Why aren't they hit in a sequence of 1-2-1-2-1-2-1-2 etc ?


/Per Jessen, Z=FCrich
