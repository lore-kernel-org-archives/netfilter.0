From: Greg Procunier <greg.procunier@gmail.com>
Subject: Mangle VLAN Priority Bit
Date: Thu, 19 Feb 2015 12:00:56 -0500
Message-ID: <CALd5Md2bjm8Ss4L_Ck=OUcL3MeZCRiCMWa+0gtdY+rgM=X5yGQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=KqRelkrO5G21/AcURPD985qt1roeOXscbtHsa7P8E8I=;
        b=mpsKSA1zxBSEd4ouHTQ4iH7H71mkpK/j/GqW4u35BmeM2MEnGmMYHaT3fAx4LQk0PA
         cOFJaN2CW1f9R7Rpm8aeq+NjOmyr+MpOeTjDvavLQ3Fq80CZDK2TQLWtxPLuFP06CYQg
         J0L2TasAOG64WAEhqSakVwi3GZcgCCXXizqkzRY4vuF/KHq3H7/y0HlY4fMB8F2gEEIb
         GSNzr6TV/iwMpLVW1qJPsEx+ol3BhaXbVSymgZt+OMLVpFyDPJvm6V0Z/63PspOw3g93
         U1FkfzwrLcMZQxA45eNiFTPG3m6o/mE4Jkfu46ZSfFSLrhW7c4UH8PZGTv/CvtjVSffj
         44bQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Does anyone know if netfilter/xtables is able to modify the vlan
priority bit of an ethernet frame?

We have Cisco UCS deployed in our environment and within the fabric
interconnect we can define different traffic classes (CoS).  One of
the capabilities of the CoS scheme in the UCS is we can honor a host
administratively setting the CoS bit to something other than its
default value.

Eg. a CoS 0 (best-effort) adapter sending CoS 5 (Platinum) traffic.

Our use case for this kind of mangling is to opportunistically
priority different types of traffic based on their purpose.  In our
example we have file servers running redhat cluster for storage
services, these servers push out a lot of bulk data to clients however
there are certain types of lighter more latency sensitive traffic
(cluster heartbeats / quorum pokes) which should be treated
differently than the bulk data.

Our CoS 5 traffic class is configured to be lossless and multicast
optimized (special resources for enhanced processing of multicast
messages).

If we were able to mangle the vlan prio bit of certain types of
traffic we could do some fairly powerful shaping of traffic within the
FI of the UCS.

Eg:

iptables -t mangle -p udp -d a.b.c.d --dport 12345 -j  L2COSMARK --priority 5


Any suggestions or direction on if this is possible would be greatly
appreciated.
