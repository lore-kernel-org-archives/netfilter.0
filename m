From: =?iso-8859-1?Q?Andr=E9_Paulsberg-Csibi_=28IBM_Consultant=29?= 
        <Andre.Paulsberg-Csibi@evry.com>
Subject: RE: Filtering content inside packets , specifically RELATED data in
 the various ICMP TYPE 3 packets
Date: Fri, 13 Jan 2017 11:44:17 +0000
Message-ID: <8ab166a389ea4b63bd46c325c11f8834@CCDEX021.corp.corpcommon.com>
References: <d60d0ad0fe82496a86f052993fe2cb9b@CCDEX021.corp.corpcommon.com>
 <7a697d77-84f1-2403-37ad-74d53f6ce41a@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7a697d77-84f1-2403-37ad-74d53f6ce41a@plouf.fr.eu.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

APC >> Now the problem is to create a rule that would perform this task , b=
ut looking at the module for string match
APC >> and searching google has left me a bit unsure if I am going in the r=
ight direction ...

PH  > The u32 match may be more precise as it allows to match a pattern at =
a specific offset.

Thank you , I will search "iptables u32 match" on google :-)


APC >> Since the IPTABLES normally can find this data in its RELATED functi=
on in the STATE-MODULE ,

PH  > Conntrack is independent of iptables.
PH  > Conntrack sets the state, and iptables just checks it.

I was hoping it was not so , but this explains why I have not found options=
 for this so far .


PH  > But I'd like to ask why do you bother to log such packets ?

I am not sure I 100% understand what exactly you are asking , since I want =
to remove these from my logs ...
... I will assume you are asking generally why I log INVALID / OUT-OF-STATE=
 packets .

The reason is simple , if there is some kind of TIME-OUT issue , you will i=
n most cases find it almost immediately with a fast look in the LOG .
and you will not have to create some massive tcpdump / pcap files to invest=
igate why something is not working or being broken .

Logging level is also adjusted for this for most systems that have to be PC=
I-DSS compliant ,
or at least the general "understanding" or conception is that such is neede=
d .
This typically means that all systems follow the same standard , even when =
it does not have to be PCI-DSS compliant at the moment or ever .


Best regards
Andr=E9 Paulsberg-Csibi
Senior Network Engineer=20
Fault Handling
IBM Services AS


