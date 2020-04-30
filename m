From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: nftables and traffic control utility to QoS
Date: Thu, 30 Apr 2020 13:45:21 +1000
Message-ID: <87wo5xvdpq.fsf@goll.lan>
References: <a66c2c02-5966-3f1a-e902-3d12d167b5d2@mashtab.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

"d.gubin" <d.gubin@mashtab.org> writes:

> I need to setup QoS on Debian GNU/Linux.
> I am going to use nftables to modify DSCP field in IPv4 Header and tc
> to shape traffic.
>
> Where is packets come in first: in nftables or tc (iproute2) ?

I think this depends on the chain type/hook/priority.
Also, are you talking about egress QoS, or ingress QoS?

If you are completely new to QoS, for egress QoS, try tc-fq_codel
before you resort to hand-tuning DSCP/TOS bits for tc-pfifo_fast.

fq_codel is the default on some systems due to:

    https://github.com/systemd/systemd/blob/master/sysctl.d/50-default.conf

If you want an easy test of just the tc qdisc part, OpenSSH sets DSCP bits by default:

    ssh example.com         # defaults to -o IPQoS=lowdelay

    ssh example.com whoami  # defaults to -o IPQoS=throughput
    sftp example.com        # likewise
    rsync example.com:      # likewise

