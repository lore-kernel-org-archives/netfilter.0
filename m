From: Mark Fox <mark.fox@gmail.com>
Subject: Implications of a permissive FORWARD chain
Date: Tue, 18 Feb 2014 17:53:35 +0000 (UTC)
Message-ID: <loom.20140218T183628-993@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've been waffling over a permissive or restrictive FORWARD chain and have
realized that my understanding of the implications is lacking. So I'll just
ask: What are the implications of a permissive FORWARD chain?

My situation is that I am deploying a virtualization/containerization host
at a facility that has one big network for everything (servers, desktop
workstations, etc.). There is no DMZ. As one would expect, the network is
really chatty.

Traffic has to be forwarded to/from the VM/container host to/from the VMs or
containers, so a DROP policy on the FORWARD chain means carefully crafting
rules to allow traffic to be forwarded to the VMs/containers. I have no
issues with that, but it does mean that the future users of the VM/container
host would have to craft their own rules when they add new VMs/containers.

