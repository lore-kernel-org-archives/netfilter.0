From: =?iso-8859-1?Q?Andr=E9_Paulsberg-Csibi_=28IBM_Consultant=29?= 
        <Andre.Paulsberg-Csibi@evry.com>
Subject: RE: Multicast does not work on ebtables
Date: Thu, 11 May 2017 05:32:51 +0000
Message-ID: <450a7935d46549e2a57147a7eead73be@CCDEX021.corp.corpcommon.com>
References: <4289f9ef5464dbbcdaee38396ae06e5b@grandcloud.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=evry.onmicrosoft.com;
 s=selector1-evry-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=skwLEuMfMWDAPeq4swcAgBIZrHDMzU0yVJflXX9kz7s=;
 b=C6KvrGIUKsmqOToeYWIBcqplH2JhIQWNwK+wHMVCUDM18zuB+u3RD5/03mOKQALXC0G0TzwEFipe+GRP/HAQLLpN4qF/0bEOQuckFkuoloLjQu76hn4bP3IMXYW3GkSsWoci4mGDud1Wg9JKZfTe2VRalY53oKNELpqPYkukd8s=
In-Reply-To: <4289f9ef5464dbbcdaee38396ae06e5b@grandcloud.cn>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "xiegaofeng@grandcloud.cn" <xiegaofeng@grandcloud.cn>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am not sure I read your rules correctly , the layout might be different i=
n the actual ruleset ,
but as far as I can tell the FIRST rule that would match your traffic would=
 be this one :

 ebtables -A FORWARD -i tap1 -j tap1_IC

*ebtalbes -N tap1_IC
 ebtables -P tap1_IC DROP
 ebtables -A tap1_IC --among-src ! 52:54:0:1:6c:c1=3D10.200.10.101 -j DROP
 ebtables -A tap1_IC --among-dst 52:54:0:1:6c:c2=3D10.200.10.102 -j ACCEPT
 ebtables -A tap1_IC -d Broadcast -j ACCEPT
*ebtalbes -A tap1_IC -d Multicast -j ACCEPT

So reading the rules , after hitting the last rules here you go to ACCEPT a=
nd no further ruleset is used ,
Aka it will NEVER process the rules for outgoing to tap3 "ebtables -A FORWA=
RD -o tap3 -j tap1_OC" as you already allowed it prior !

On a second note , there are several places your rules are using wrong word=
 " ebtalbes" instead of "ebtables"
( not sure if that is only in this mail , or if that is also in the actual =
ruleset )



Best regards
Andr=E9 Paulsberg-Csibi
Senior Network Engineer=20
Fault Handling
IBM Services AS
andre.paulsberg-csibi@evry.com
M +47 9070 5988




-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.o=
rg] On Behalf Of xiegaofeng@grandcloud.cn
Sent: 9. mai 2017 10:47
To: netfilter@vger.kernel.org
Subject: Multicast does not work on ebtables

Hi,

My host has three virtual machines: VM1 VM2, and VM3. Their interfaces=20
in the
physical host respectively are tap1, tap2, and tap3; and their IPs are
     10.200.10.101(52:54:0:1:6c:c1),
     10.200.10.102(52:54:0:1:6c:c2),
     10.200.10.103(52:54:0:1:6c:c3).
tap1, tap2 and tap3 are bound on a same linux bridge.

I hope that tap1 and tap2 can communicate with each other, not tap3.

The ebtables rules are as follow.

# For tap1
ebtalbes -N tap1_IC
ebtables -P tap1_IC DROP
ebtables -A tap1_IC --among-src ! 52:54:0:1:6c:c1=3D10.200.10.101 -j DROP
ebtables -A tap1_IC --among-dst 52:54:0:1:6c:c2=3D10.200.10.102 -j ACCEPT
ebtables -A tap1_IC -d Broadcast -j ACCEPT
ebtalbes -A tap1_IC -d Multicast -j ACCEPT

ebtalbes -N tap1_MI
ebtables -P tap1_MI DROP
ebtables -A tap1_MI --among-dst 52:54:0:1:6c:c1=3D10.200.10.101 -j RETURN
ebtables -A tap1_MI -d Broadcast -j RETURN
ebtalbes -A tap1_MI -d Multicast -j RETURN

ebtables -N tap1_OC
ebtables -P tap1_OC DROP
ebtables -A tap1_OC -j tap1_MI
ebtables -A tap1_OC --among-src 52:54:0:1:6c:c2=3D10.200.10.102 -j ACCEPT

ebtables -A FORWARD -i tap1 -j tap1_IC
ebtables -A FORWARD -o tap1 -j tap1_OC

# For tap2
ebtalbes -N tap2_IC
ebtables -P tap2_IC DROP
ebtables -A tap2_IC --among-src ! 52:54:0:1:6c:c2=3D10.200.10.102 -j DROP
ebtables -A tap2_IC --among-dst 52:54:0:1:6c:c1=3D10.200.10.101 -j ACCEPT
ebtables -A tap2_IC -d Broadcast -j ACCEPT
ebtalbes -A tap2_IC -d Multicast -j ACCEPT

ebtalbes -N tap2_MI
ebtables -P tap2_MI DROP
ebtables -A tap2_MI --among-dst 52:54:0:1:6c:c2=3D10.200.10.102 -j RETURN
ebtables -A tap2_MI -d Broadcast -j RETURN
ebtalbes -A tap2_MI -d Multicast -j RETURN

ebtables -N tap2_OC
ebtables -P tap2_OC DROP
ebtables -A tap2_OC -j tap2_MI
ebtables -p tap2_OC --among-src 52:54:0:1:6c:c1=3D10.200.10.101 -j ACCEPT

ebtables -A FORWARD -i tap2 -j tap1_IC
ebtables -A FORWARD -o tap2 -j tap1_OC

# For tap3
ebtalbes -N tap3_IC
ebtables -P tap3_IC DROP
ebtables -A tap3_IC --among-src ! 52:54:0:1:6c:c3=3D10.200.10.103 -j DROP
ebtables -A tap3_IC -d Broadcast -j ACCEPT
ebtalbes -A tap3_IC -d Multicast -j ACCEPT

ebtalbes -N tap3_MI
ebtables -P tap3_MI DROP
ebtables -A tap3_MI --among-dst 52:54:0:1:6c:c3=3D10.200.10.103 -j RETURN
ebtables -A tap3_MI -d Broadcast -j RETURN
ebtalbes -A tap3_MI -d Multicast -j RETURN

ebtables -N tap3_OC
ebtables -P tap3_OC DROP
ebtables -A tap3_OC -j tap3_MI

ebtables -A FORWARD -i tap3 -j tap1_IC
ebtables -A FORWARD -o tap3 -j tap1_OC

For TCP, UDP or BROADCAST, it works as expected. But for Multicast, it's=20
not.

When VM1 sends a Multicast packet, VM2 can receive it and it's OK, but=20
VM3 will
also receive it. It's not right, because the chain tap3_OC does not have=20
the
matched rule and will DROP it by default. I do not known why VM3 can=20
receive
this Multicast packet. I'm not sure whether it is a bug.

Thanks,
Aaron

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://emea01.safelinks.protection.outlook.com/?ur=
l=3Dhttp%3A%2F%2Fvger.kernel.org%2Fmajordomo-info.html&data=3D02%7C01%7C%7C=
e0d3df1e6a0a4726767208d496b8e6dd%7C40cc2915e2834a2794716bdd7ca4c6e1%7C1%7C0=
%7C636299168271803731&sdata=3D0YbTKK49pozyz0luRPB2Ae%2FnMFDWJFszQEdXx39Mfuw=
%3D&reserved=3D0
