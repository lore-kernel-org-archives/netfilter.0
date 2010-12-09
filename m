From: Matty Sarro <msarro@gmail.com>
Subject: Need to translate source IP prior to routing for SNMP issue
Date: Thu, 9 Dec 2010 10:55:47 -0500
Message-ID: <AANLkTino0xLVHOjpYsgnsdzmztGiiWim6r-W6PkpVErE@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=tGdTwsTcsszM2HIVOEy0WjcQlMtJPGmswVoe50GYIhM=;
        b=dpGqc1Dq1vDeikuF39ELaHG+Lhc/e276u/AdITvujLAxnRngxIfLSstbT19xdXKvAc
         5aEqqYqzaMEzuHcYYyCVQw2Y6uL9OZLA7iH5XYd9zDOD/U3CBiqMBEQhwb5HlSrlflte
         mcEkqGuuqvdRM3gJFuiu4JSmSpt14U/5kJdhQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hey everyone! I am running into a rather interesting issue and was
hoping someone may be able to help. We are running a custom SNMP
daemon on a server (its part of a vendor application). The servers are
all multihomed, with one NIC on a service/public facing subnet, and
the other NIC on a management subnet. We need all SNMP traffic to use
the management subnet.

We have set up 2 routing tables in IPROUTE2 to ensure all traffic goes
out the interface that it comes in. It's tested, and everything is
working except for SNMP. What happens with snmp is the snmp manager
sends a request (for example, GET). The request is received by the
SNMP daemon on the target server. The target server then generates a
reply, but when it does, it uses the IP address of the service
interface, not the management interface. We have reconfigured the
application, but its still insisting on using that IP. The reply
packet is then routed out the service interface because of the source
IP. I have numerous packet traces verifying that this is the behavior.

So what I need is the source IP address to be re-written from the
service IP, to the management ip, so it can be routed out the correct
interface. This ONLY needs to be done for snmp traffic, and it needs
to be done prior to any routing. Is this possible? Any help would
really be appreciated, this appears to be an application issue but we
need to find a workaround until the vendor fixes it.

Thank you everyone!
