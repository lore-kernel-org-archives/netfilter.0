From: "ml@bortal.de" <ml@bortal.de>
Subject: Firewall br0
Date: Wed, 10 Oct 2007 11:22:32 +0200
Message-ID: <470C99D8.1030109@bortal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello List,

i have a linux box with 3 interfaces.
- Internet
- 2nd Company Network
- Internal Network

Physically it looks like this:
--------------------------------
ppp0 (Internet), eth0 (plugged into DSL Modem)
eth1 (External-Network, 10.10.10.1/24)
eth2 (Internal-Network, 10.10.10.2/24)

I thought of setting up a bridge with eth1 and eth2, which would "merge" 
the two networks together and i would get br0.

Now I have the problem that I still want to firewall eth1 and eth2!
E.g. I only want to allow traffic going to 10.10.10.100-200 (on serveral 
ports) to leave interface eth1.

Can someone point me to the right place for more infos or examples?

Thanks, Mario



