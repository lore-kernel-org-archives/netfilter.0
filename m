From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: bandwidth-limiting on LAN interface egress (2)
Date: Wed, 16 Nov 2011 09:50:33 -0600
Message-ID: <op.v41qaj2hx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

I have improved my previous post in hope of some advice, or at least a suggestion on where to ask this sort of question.

Suppose one is building a netfilter router, LAN to Internet, with multiple outward-facing interfaces (eth1, eth2, and eth3). There needs to be load-balancing over the outward interfaces.  There needs to be bandwidth-limiting for users on the LAN.  Users are typical Internet users (primarily http download with some important interactive traffic such as VOIP.)

Theoretically, can per-user bandwidth-limiting be done on egress of the LAN using htb+prio+sfq without encountering insurmountable latency problems due to queuing of incoming packets in the router?  Should traffic shaping (prioritizing of packets for interactive traffic) probably be an adequate solution to any latency problems?

Is there a way to use a policing queuing discipline in a case like this? (I assume it would have to be on egress of the LAN interface, since I cannot see how to police on ingress of the Internet-facing interfaces due to the per-user bandwidth-limiting.)

-- 
Lloyd
