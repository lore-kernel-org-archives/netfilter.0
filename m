From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Failing to get forwarding to work fully.
Date: Mon, 4 Feb 2008 07:29:05 +0100
Message-ID: <001201c866f7$3e096ee0$ba1c4ca0$@info>
References: <47A5F1A7.4030308@roamware.co.uk> <000c01c86688$e22637c0$a672a740$@info> <47A642E4.5040006@roamware.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47A642E4.5040006@roamware.co.uk>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: david@stpenable.com, netfilter@vger.kernel.org

> Tried this, it made no difference. I broadened the ports on the NEW
> to cover 722, so there was no confusion to the port 22 used to connect
> to the machine with the public facing NIC.

Actually, this should be working:

-P FORWARD DROP
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -m state --state NEW -i eth1 -o eth0 \
  -d 192.168.0.0/16 -p tcp --dport 22 -ACCEPT

-t nat -A PREROUTING -i eth1 -p tcp --dport 722 -j DNAT \
  --to 192.168.0.223:22

If you're running a local ssh server on port 22 there will be no
confusion on this host. You'll be accepting packets on (local) port 22
which are accepted in the INPUT chain. Packets forwarded from port 722
to 192.168.0.223:22 will (only) travel the FORWARD chain (of the filter
table) because they're routed through the host.

> Do I need a postrouting rule for the FORWARD used for the return
packets?

No that would be handled by the RELATED,ESTABLISHED rule.
Besides, you already have an SNAT rule:

-A POSTROUTING -o eth1 -j SNAT --to-source 333.333.333.333

so you should be able to access the internet from 192.168.0.223, but
that should not be related to the problem.


Grts,
Rob


