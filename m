From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Packet duplication
Date: Thu, 25 Oct 2007 10:34:15 +0200
Message-ID: <000a01c816e1$d3df0440$0b0ffe0a@NS006819>
References: <47184C6D.40202@netsys.co.za> <47186FC3.6030402@freemail.hu> <471875A4.8010000@netsys.co.za> <471882D0.2060602@freemail.hu> <47188A9A.2080604@netsys.co.za> <003801c81242$c160fec0$0b0ffe0a@NS006819> <471F003A.7090501@netsys.co.za> <001501c81620$a81ac3b0$0b0ffe0a@NS006819> <471F17BC.9060507@netsys.co.za> <001601c81629$cd4831f0$0b0ffe0a@NS006819> <471F21E7.2000901@netsys.co.za> <002e01c8163b$d1f931b0$0b0ffe0a@NS006819> <471F5E9C.5010802@netsys.co.za> <000b01c81654$93026210$fa92fea9@tanjian> <4720345D.40906@netsys.co.za> <000301c816d8$1e355da0$0b0ffe0a@NS006819> <47204736.8030803@netsys.co.za>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47204736.8030803@netsys.co.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

tiaan@netsys.co.za wrote:
> Rob Sterenborg wrote:

>> and which kernel version did you use?


[...]

> /usr/local/sbin/iptables -t mangle -A PREROUTING -p udp --dport 9090
> -j ROUTE --tee

Searching for how "-j ROUTE --tee" works, I stumbled on these pages:
http://www.gossamer-threads.com/lists/iptables/devel/68316
http://www.cl.cam.ac.uk/research/dtg/research/wiki/MulticastRouting

From what I read there, --tee is used like this:

iptables -t mangle -A INPUT [matches] \
  -j ROUTE --tee --gw <mirror_ip>

iptables -t mangle -A OUTPUT -d <dst_ip_net> -o <if_out> \
  -j ROUTE --tee --oif <mirror_if_out>


> /usr/local/sbin/iptables -t nat -A PREROUTING -p udp --dport 9090 -j
> DNAT --to-destination 192.168.51.46:9090
>
> but alas once i run these commands the packets just disappear. it
> doesn't reach either of the two destinations then. any comments ? -

AFAICS you forgot to tell iptables to where you want to packet copied.

I also found that there appears to be a TEE target in development.
http://www.gossamer-threads.com/lists/iptables/devel/68781


Grts,
Rob


