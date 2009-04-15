From: sgmayo@mail.bloomfield.k12.mo.us
Subject: NAT and a public IP
Date: Wed, 15 Apr 2009 11:46:59 -0500 (CDT)
Message-ID: <4658.204.184.27.217.1239814019.squirrel@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have my machines on a private network that are then NATed to one of my
public IPs.

i.e.
IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $Public_IP

Every once in a bit I need to do something with a public IP other than the
one that is SNATed.  I usually just plug the machine into the public side
of the switch and let it have a public IP.

I was just curious if there was a way that I could stick the public IP
machine inside my private network and have my IPTABLEs route anything
coming from ETH1 (my private network card) with a public IP that is within
my public IP range, to just go on to the outside world without getting
SNATed.

In othewords if I put public ip xx.xx.xx.xx in a windows machine and stuck
it in my private network then it would still have public ip xx.xx.xx.xx
instead of $Public_IP (from the above SNAT) when it came out of my box.

Thanks.


-- 
Scott Mayo - System Administrator
Bloomfield Schools

Question: Because it reverses the logical flow of conversation.
Answer: Why is putting a reply at the top of the message frowned upon?

