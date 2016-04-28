From: Stephan Arndt <arndt.stephan@gmail.com>
Subject: libnetfilter_conntrack API question
Date: Thu, 28 Apr 2016 21:02:23 +0200
Message-ID: <CADe663vwDSDHWhZA_WeyKctoDbuK=1Ao8YtdiVN91Wn9KTu3Mw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to;
        bh=C21wtuR/IIHaAc/xJy2NBPkX60nqzhrKp6MypnMnKAE=;
        b=py8VZ8IMsyhXmUov2KsYTHBY+iDZilYyd73qgYWn7y72KKX2FtfesfhuBLe5Qxc118
         ur449qCjEcVOhmYQlu9kLIYP69jQVFPhF6X+54N92VyVY71Pv22ZW0H/uwxzW8hpgkbp
         aAS3BgVlvH9osPG4AR4LptFtvcpJB3wSnipIrVxNs2yWCIFvVcwtBz7vHi+Fq05jnQHB
         YfCvTcZmjm8d9Yxu3DzLCff16QtNPl9YgZJXO3/FfCDOl0LC+JiqrPVhS1n144rKp1AG
         vi1Xmzv6eYJQIk9pNy0ekmEFwxM/4qMOvm91PkRoXrW/koHGIF3pb9bJKtnl18rZuZxf
         La+w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am currently using the nfqueue library to process incoming and
outoing packets.
I now want to do some additional connection tracking and are looking
at the conntrack library for this. In general, I want to pretty much
the same as this guy [1], namely listen for TCP/UDP conntrack
DESTROY-events to remove additional info out of a list which also
tracks the connections.

Since I need to process both the nfqueue events, and the conntrack
events, I wanted implement the handling of both via polling, as
suggested in the answer to [1].
But while I know how to use the filedescriptor for the nfqueue, the
examples for libnetfilter_conntrack always use libmnl to receive
conntrack events and to run the callback on these events (and read
directly from an mnl_socket pointer) . So what I want to know is:

How can I handle conntrack events without using libmnl?
I have looked at the library setup page [2] and it seems like I can
just register a callback via "nfct_callback_register(..)", but how do
I run this callback?
I.e., for nfqueue, I would call "nfq_handle_packet()" after filling my
buffer for the packet with "recv()", but I don't know how what to do
with my conntrack buffer after I filled it via "rec()".

Basically I want to do something like this:

    while ((ready = poll(fds, FD_COUNT,0)) && ready > 0 )
    {
        int i;
        for (i = 0; i < FD_COUNT; i++) {

            if ( fds[i].revents == POLLIN ) {

                /* 0 is the nfqueue filedescriptor */
                if (i == 0) {
                    int rv = recv(fd_nfq, buf_nfq, sizeof(buf_nfq), 0);
                    nfq_handle_packet(nf_h, buf_nfq, rv);
                } else {
                    /* What to do here? */
                    recv(fd_ct, buf_ct, sizeof(buf_ct), 0);
                }

            }

        }
    }

Another question, when using the

 nfct_open(u_int8_t subsys_id, unsigned subscriptions)

function, what is the "subscriptions" variable? I've seen it set to 0
while poking around, what are the options that I can subscribe to?

Regards,

Stephan

Links:
[1] https://www.spinics.net/lists/netfilter-devel/msg03308.html
