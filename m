From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Packet disappears after DNAT?
Date: Thu, 17 Dec 2015 16:51:37 -0800
Message-ID: <CAKmUPx7ST01XPj+cXSWhyksFJw77xeXf-WouaQkCxZ0QG1_aWQ@mail.gmail.com>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
	<5662BD03.60004@plouf.fr.eu.org>
	<CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com>
	<56653CCC.6020603@plouf.fr.eu.org>
	<CAKmUPx7UQD0zE4ngHanfid4BN8aMFLdJ284peiW0_d8=EFW_JQ@mail.gmail.com>
	<56706DC5.8010206@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=9MUN79j3hQJ0wCr0pbcSjvo/Nh3WSEqMumIqNjLmhpk=;
        b=Z7N0dxlbMDc9mjMuLI98lJNIqmYjOHzVbhr1kHSHKTJqhlwKinCaHCb+sRrBRXp7nL
         6Wp7y30s72o0K5nn1NO7SDtdM9v59OFJPuOsOWbGKUUgtRSIdaWpN3ichfPHZKXh2UXA
         j8EUs/Zd151FDjWaqMunQ/XgNWYt1tsIW7HLyhqpp/CAWabH64MooMQqbEKXH1JQ/JPz
         +WEE3VqyjvXuAStcOHFtLfRVUKs/m9MZYQiqTGg6zyD0tYjcVxN+Yw+fM0zfDqu3FA1B
         4TROslMpM8/Tk7a39ZNKESrJjR+xXSU5hnp8ZMROCVENXtsq8ZYs3L9XUoPfvQkv8TsY
         qKkg==
In-Reply-To: <56706DC5.8010206@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter <netfilter@vger.kernel.org>

On Tue, Dec 15, 2015 at 11:45 AM, Pascal Hambourg
<pascal@plouf.fr.eu.org> wrote:
> Scott Bronson a =C3=A9crit :
>> iptables -t nat -I POSTROUTING -s 192.168.122.10 -d 192.168.122.10 -=
p
>> tcp -j MASQUERADE
>
> Why restrict the MASQUERADE to TCP and UDP ?

Good question.  Editing mistake.  I'm actually forwarding different
ports to different guests depending on port number:

iptables -t nat -A POSTROUTING -s 192.168.122.10/32 -d
192.168.122.10/32 -p udp --dport 53 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.122.10/32 -d
192.168.122.10/32 -p tcp --dport 53 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.122.12/32 -d
192.168.122.12/32 -p tcp --dport 25 -j MASQUERADE


=46WIW, here's the script as it stands today:
    https://github.com/bronson/libvirt-hook-qemu/tree/hostfix
    https://github.com/bronson/libvirt-hook-qemu/blob/hostfix/qemu
And an example of the rules it inserts:
    https://github.com/bronson/libvirt-hook-qemu/blob/hostfix/test_qemu=
=2Epy#L58-L73

It seems a little overcomplex but it's working great.  Huge thanks to e=
veryone.

    - Scott
