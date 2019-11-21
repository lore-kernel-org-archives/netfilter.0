From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: One more application available for nftables
Date: Thu, 21 Nov 2019 14:04:48 +1100
Message-ID: <87zhgq9bfz.fsf@goll.lan>
References: <b99d882d69f5e152919339c65ac26163@mailtower.de>
        <b5512a97bad28c14e57ebf2f92c12f27@mailtower.de>
        <87v9rhdhuz.fsf@goll.lan>
        <372da802-bc2e-a055-6ece-3c765c38ee00@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

zrm <zrm@trustiosity.com> writes:

> On 11/17/19 21:43, Trent W. Buck wrote:
>
>> I see you're matching vsftpd.  I very very strongly recommend
>> you... encourage your end users to switch from FTP to SFTP.  :-)
>> (Many (most?) Windows FTP clients can do SFTP these days.)
>>
>
> It's always fun to see the systems people and the network people argue
> over this.
>
> Everybody should obviously discontinue using plaintext FTP, but FTPS
> (i.e. FTP over TLS) is a thing that exists, and is generally a much
> smaller configuration change for an existing FTP service than
> switching to SFTP (i.e. the SFTP subsystem of the SSH protocol).
>
> Using SFTP also admits a lot of protocol features that you Do Not Want
> if all you're after is file transfers. Configure it a bit wrong and
> your users get a shell, the ability to forward ports from the public
> address of your SFTP server to their client, the ability to forward
> ports from their client to whatever internal hosts they want on the
> same internal network as your SFTP server, a VPN, X11 forwarding etc.
>
> By contrast, the disadvantage of FTPS is that it uses separate control
> and data connections, and because it's encrypted, the firewall can't
> snoop the control connection to see which ports it will use for the
> data connection. So the only way to really make it work is to allow
> clients to make outgoing connections to arbitrary unprivileged
> ports. Then you have to convince the client's network administrator to
> allow that.
>
> But the alternative is to allow outgoing connections to the SSH
> port. Which, because it's opaque and supports port forwarding and VPN
> and so on, effectively allows the same thing anyway.

This is an excellent analysis, thank you.

Obviously I have personal Opinions=E2=84=A2 about FTPS vs SFTP, but
I think we can agree that plaintext FTP is worse than EITHER. :-)

Some tangential comments:

  * (for me) ssh is already there for system administration, and
    "grant more access to existing service" can be an easier sell than
    "deploy another service".

  * tinyssh and dropbear use OpenSSH's sftp driver,
    so there's a monoculture risk there.  (Not sure about GNU ssh.)

  * OpenSSH with "internal-sftp" can chroot without needing anything
    inside the chroot (but chroot(2) isn't a security feature).

  * OpenSSH authorized_keys now has "restrict" keyword (block all
    features).  This means you no longer need to go back and update the
    blocked feature list every time you upgrade SSH.  No equivalent in
    sshd_config (yet) AFAICT.

  * SFTP is _still_ only a draft RFC, whereas
    FTPS is a full standards-track RFC.

  * As a wild alternative, you could do plain rsync --daemon, and
    auth/encrypt at l2/l3 with a wireguard/openvpn/ipsec peer link :-)

