From: =?iso-8859-1?Q?Andr=E9_Paulsberg-Csibi_=28IBM_Consultant=29?= 
        <Andre.Paulsberg-Csibi@evry.com>
Subject: RE: Multicast does not work on ebtables
Date: Thu, 11 May 2017 08:41:43 +0000
Message-ID: <bc4cc23390c941f0ac149e7b5f97daf0@CCDEX021.corp.corpcommon.com>
References: <4289f9ef5464dbbcdaee38396ae06e5b@grandcloud.cn>
 <450a7935d46549e2a57147a7eead73be@CCDEX021.corp.corpcommon.com>
 <0f700380dcf7bbad5386b5e966643f87@grandcloud.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=evry.onmicrosoft.com;
 s=selector1-evry-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0UcZUcdE0lEp1qLfItuJXjjUpPtv3qCTUQ4cT1q5ssM=;
 b=tTkOsnt6uN30irBlsBjEp4qmJE1ZvAKDAFJdDxKHtviqKROJ0Dikfyoyek8lSPj8ew6FsCM0gYYV55XyEAkAnXe9dHMW7aPth565v7mbGA7CEhfqGwMgzToDAXRNHpDpt65OjUlMJbDdz85mCJgSPr2ECWbJhP/Xqe8NPGBNFyI=
In-Reply-To: <0f700380dcf7bbad5386b5e966643f87@grandcloud.cn>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "xiegaofeng@grandcloud.cn" <xiegaofeng@grandcloud.cn>, Netfilter <netfilter@vger.kernel.org>

I understand , but if you allow it in this CHAIN tap1_IC it will not go int=
o the CHAIN for tap3_OC=20

If you cannot find the issue , I guess you will need to take a look at the =
combined setup from the HOST if theses VMs .

brctl show
ifconfig
ebtables-save
ebtables -L

And see if counters and tcpdumps of the interfaces and bridges can help you=
 track down where the packets are going or being DROPed .



Best regards
Andr=E9 Paulsberg-Csibi
Senior Network Engineer=20
Fault Handling
IBM Services AS
andre.paulsberg-csibi@evry.com
M +47 9070 5988




-----Original Message-----
From: xiegaofeng@grandcloud.cn [mailto:xiegaofeng@grandcloud.cn]=20
Sent: 11. mai 2017 09:01
To: Andr=E9 Paulsberg-Csibi (IBM Consultant) <Andre.Paulsberg-Csibi@evry.co=
m>; Netfilter <netfilter@vger.kernel.org>
Subject: Re: Multicast does not work on ebtables

Sorry, it's my input error.

When hit the rules of tap1, I copied and pasted them for tap1 and tap2,
but forgot to modify them altogether.

In my last mail, there are three kinds of errors about ebtables rules.

1. It should be ebtables, not ebtalbes.

2. In the following rule, It should be -A, not -p.
ebtables -p tap2_OC --among-src 52:54:0:1:6c:c1=3D10.200.10.101 -j ACCEPT

3. In the FORWARD chain, it should be:

   ebtables -A FORWARD -i tap1 -j tap1_IC
   ebtables -A FORWARD -o tap1 -j tap1_OC

   ebtables -A FORWARD -i tap2 -j tap2_IC
   ebtables -A FORWARD -o tap2 -j tap2_OC

   ebtables -A FORWARD -i tap3 -j tap3_IC
   ebtables -A FORWARD -o tap3 -j tap3_OC

tap1_IC and tap1_OC are for tap1.
tap2_IC and tap2_OC are for tap2.
tap3_IC and tap3_OC are for tap3.

In my test, the Broadcast packets from VM1 won't enter into VM3,
but the Multicast packets from VM1 enter into VM3.

I don't known why.

