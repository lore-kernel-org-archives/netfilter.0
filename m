From: Nico Schottelius <nico.schottelius@ungleich.ch>
Subject: IPv6 parsing issues in conntrackd?
Date: Thu, 02 Jan 2020 14:25:28 +0100
Message-ID: <874kxe0z3r.fsf@line.ungleich.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
        t=1577971528; bh=BP90UMNG2pnkzzukDOmpVLK7IBc4P+cni9l/w9liG1E=;
        h=From:To:Cc:Subject:Date:From;
        b=GbmI8YU4Q2PWtEeoGOdPFFPV5F/n0ot1D1mVgLqbGedMgLHxkl6Tz65+McojvypUQ
         G3XbkMMNQwsKDz9yH3IZpY/Zhk6RhXYWLdfr+iX4B2xekj4mlbMaWPyvEtLsv3Qc/7
         /KpRb6bd7SBoW8uWI2bxqXFWUO/aFcmw2+Kdym+bq0PzA876DzzitXZeS2IEewMFne
         ft+/ijr2NlfkDjI595pQRm22GpXaBa6+S7i8Oyjb2rflAwxg4sWzCX18vDJ9yAY7y9
         JQ/8ilyFogchH0gSCZwLHNHDgOFtej2UiFQ6vdnSbJ3vLZrZs4Oio4D3iYgUSpoDM0
         cW+4o00UmaM6g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: timothee.floure@ungleich.ch, Balazs Uniy <balazs.unyi@ungleich.ch>


Good morning,

I am wondering how to use conntrackd with IPv6.

when I try to use UDP + IPv6 [0], I get the error message
"[ERROR] inet_pton(): IPv6 unsupported!". I checked the IPv6 address and
inet_pton() outside of conntrackd nicely works [2] (sample code from
inet_pton(3).

When I change the same construct to use TCP [1], I get a different error
message:

[Thu Jan  2 14:21:32 2020] (pid=23772) [ERROR] can't open channel socket: Invalid argument
[Thu Jan  2 14:21:32 2020] (pid=23772) [ERROR] initialization failed
[Thu Jan  2 14:21:32 2020] (pid=23772) [ERROR] conntrackd cannot start, please review your configuration


And from the manual it looks like that IPv6 multicasting is not
supported - is that correct?

I have a couple of routers in IPv6 only networks and was wondering how
to use conntrackd with that. Am I doing something fundamentally wrong
here?

Another question: the source code of conntrackd-1.4.5 does not output
the errno string, would that be something you'd accept as a patch?

Best regards,

Nico



[0]
...
Sync {
        Mode FTFW {
                 ResendQueueSize 131072
                 PurgeTimeout 60
                 ACKWindowSize 300
                 DisableExternalCache Off
        }
        UDP Default {
                IPv6_address fe80::d66d:6dff:fe33:e00
                IPv6_Destination_Address fe80::21b:21ff:febc:7c80
                Port 3780
                Interface wlan0
                Checksum on
        }
}
...

[1]

Sync {
        Mode FTFW {
                 ResendQueueSize 131072
                 PurgeTimeout 60
                 ACKWindowSize 300
                 DisableExternalCache Off
        }
        TCP Default {
                IPv6_address fe80::d66d:6dff:fe33:e00
                IPv6_Destination_Address fe80::21b:21ff:febc:7c80
                Port 3780
                Interface wlan0
                Checksum on
        }
}

[2]
[13:29] line:~% ./pton i6 fe80::21b:21ff:febc:7c80
fe80::21b:21ff:febc:7c80
[13:29] line:~% ./pton i6 fe80::21b:21ff:febc:7c7a
fe80::21b:21ff:febc:7c7a
[13:29] line:~%




--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
