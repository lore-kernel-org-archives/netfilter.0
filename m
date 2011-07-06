From: Borgert van der Kluit <borgertvanderkluit@gmail.com>
Subject: Tracking packets generated from individual socket.
Date: Wed, 6 Jul 2011 10:09:15 +0200
Message-ID: <CAEkK8mF1iYCo5gGjKf7N5zUb0o_PBZE7QEBjCEvEr9SOjTXuqA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=5MGc82LPjeQ5QXp0GbPzm9P2Ib5PHxC0wkXApoNlGgE=;
        b=mP6zut1Ie9hiPaDjqqDRG9oimQLB7/6HwTjpP4xIWMvcTPkcugyUJBebiDkZOaeDZs
         nPTpR6MsjQLK9JYrra+9BLw57OpsXkB4So03bAlXdvQnvls+uN1w1kCO+NME2G0QgaNv
         YIKOxJNOLCeT1PlSrnYayjplF2jJdg/plRxGw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I would like to track the individual packets generated from a socket.
I need the originating socket in order to set=A0 socket specific
transmit options for a network device driver ( transmit power ). I
have tried to get the socket associated with the sk_buff that is put
into dev_hard_start_xmit. The pointer to the sock structure is null.
So i tried to use the mark field in the sk_buff structure. This is to
my surprise also not set even if i mark all packets.

I use the TUN/TAP driver to test this setup and added a printk in
function tun_net_xmit

=A0=A0=A0=A0=A0=A0 printk("TUN TAP packet mark: %d\n", skb->mark);

I mark all packets by using the following iptable rule:

=A0=A0=A0=A0=A0 iptables -t mangle -A OUTPUT -p ip -j MARK --set-mark 3

The TUN/TAP interface is attached to a userspace socket and not to
another peer. (i just open the socket to read data and discard it).
I test operation by opening a telnet connection to an ip address in
the subnet of the TUN/TAP interface.
My suspicion is that the packet mark gets 'eaten' by qdisc, is this
correct or does iptables clean up after itself ?

Am i missing something ?
do i mark the packets correctly ?

Is it even possible to determine the originating socket at the interfac=
e level ?

Best regards,

Borgert
