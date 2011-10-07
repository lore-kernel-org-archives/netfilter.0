From: Duane Larson <duane.larson@gmail.com>
Subject: Need to remove 802.1Q tagging
Date: Fri, 7 Oct 2011 14:20:59 -0500
Message-ID: <CAFcM1Eo0X77tfC4yYHjLPJs=xPGyrV-WUMnCnEWvbD2p5uW+9Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=+lDdiLwiiEN15b3o3KUoW/NugKjpcQ/R4Zu90alVu1M=;
        b=UcOswvUR/DNLDoN0MVTFKdkg3g1n/idRZ7hpx7xIaajDW9I4Nd8lR1T3YP5DrvKYd/
         IiN43LWMw3WPMuNsqPkdf9eJ7nM7xu1U8Lr5C9hl27yijoVclbZrkLWcyZzTW+3sxRKW
         hAlXCZ2992nLTwWkQqJBoDFF6lnRUKKd09I5Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have the following scenario

Internet Access
       |
       |
UserPortal AAA Device
       |
       |
       |
       |
Cisco CMTS Cable Modem Router
       |
       |
Cable Modem Cloud



The issue we have is that the UserPortal device is a Linux box and all
the traffic that will come from the Cable modem clients will be tagged
with VLANs.  The UserPortal can't be configured with all the VLAN
interfaces because some sites will have close to 2000 VLANs.  So I ran
across ebtables and brctl and it sounds like it might be able to solve
my issue.  This is the topology I am thinking might work

Internet Access
       |
       |
UserPortal AAA Device
       |
       |
Linux Bridge/ebtables
       |
       |
Cisco CMTS Cable Modem Router
       |
       |
Cable Modem Cloud


I am thinking that the two interfaces on the Linux box will be bridged
(in transparent mode) and when traffic passes through the linux box
the vlan 802.1q tag can be removed and then the traffic goes to the
UserPortal device without issue.  And when the traffic comes back from
the UserPortal to the Cisco CMTS Cable Modem Router the Linux Bridge
will be able to send the traffic to the client that initiated the
conversation in the first place.

Is my thinking correct?  Will this work?  What all do I need to be
aware of and are there any current examples that point to what I am
trying to do???  I am very new to netfilter and ebtables (I found out
about it last night).  I have a project that is very close to failing
unless we can find some type of layer 2 solution.

Any help or pointers are appreciated.
