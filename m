From: Tim Nelson <tnelson@rockbochs.com>
Subject: Re: Bridging / VLANs / ebtables
Date: Tue, 16 Dec 2014 15:15:33 -0600 (CST)
Message-ID: <1414006.345549.1418764533790.JavaMail.root@rockbochs.com>
References: <CAA5aLPhyZnMoMqSYkYA3YHHMs1UX-kLURLZW4UgBHotDVSmCRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPhyZnMoMqSYkYA3YHHMs1UX-kLURLZW4UgBHotDVSmCRQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


----- Original Message -----
> I might not be correct. In my understanding an Interface can be a
> part
> of multiple vlans but it should not be possible to have all those
> vlan
> interfaces (on the same physical interface) in the same bridge.
> 
> Can you share some more details of why do you require such set up?
> What all are the connected devices and what is vlan config of each (I
> understand you cannot change this configuration)?
> 

Greetings-

The use case is a server connected to a switch (provided, not able to manage/configure), where it has access to three subnets, delivered via ethernet on the link untagged, and tagged in VLANs 2/3. I have a need to bridge the untagged parent interface (eth0) and VLAN 3 (eth0.3), while leaving the VLAN 2 interface (eth0.2) untouched.

Believe me, I understand this is an odd situation, but I'm very curious if it is possible using ebtables or some other filtering/manipulation application to make it work.

Thank you,

--Tim
