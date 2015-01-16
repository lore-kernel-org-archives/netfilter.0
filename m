From: =?UTF-8?Q?St=C3=A9phane_Charette?= <stephanecharette@gmail.com>
Subject: What is the format of the header read from netfilter queues?
Date: Fri, 16 Jan 2015 00:23:56 -0800
Message-ID: <CA+HxBULFsFCy0yDsXm2mMbyAJ3HpkeePycR+b_9v8NarxnTWZA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=PqmPRB2xd1aKbjHXOW43cLm4QPRrTplh+KlUVyHsv8Q=;
        b=xazaxDT+WoEZ9MqWCgRG5nYVTkpN6nNOBrXvzhC52p1zkZQa8ua8GeyZW3Ox8/5qHy
         4NIRJiHh/cqVPVZWnWalQ+aKGLzz80d2nXUP07Al811WZCbwaSBI5cKo3BU27w/KFcDg
         A8/cphkolbqPs8mAN1AlhfHUpM+HGSr9bfR/e4vV64cg6XMIMUBPbKRKFWDN8Hh7SRI4
         oNq+E65BBOglvR8ojjRQHIQd0bKBQxt9Sd2vUI4NsNS3bgHMxnioZ7dwVBYhmnx5W2zz
         yGZmiIFbRA/E+y8+yavJM44+bBNFpfW8wXrj/5SmaGOHFQkTosBNo6g+bCxlui6Io2KK
         ywKA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

=46rom the docs on netfilter queues:

nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xffff);
=2E..
fd =3D nfq_fd(h);
while ((rv =3D recv(fd, buf, sizeof(buf), 0)) >=3D 0)
{
    printf("pkt received\n");
    nfq_handle_packet(h, buf, rv);
}

When the CPU hits the printf()....what exactly has been read from fd?

Looking at a hex dump of the bytes read, it doesn't look like L2+L3,
etc...  But I think I'm seeing L3 about 58 bytes into the buffer.  So
what are the first 58 bytes?

Which is what nfq_get_payload() returns as well.

Is there significance to those first 58 or so bytes?  If I subtract 14
from nfq_get_payload(), it doesn't seem to be L2.

St=C3=A9phane
