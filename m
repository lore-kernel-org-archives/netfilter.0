From: Simon Perreault <simon.perreault@viagenie.ca>
Subject: NFQUEUE hello world-style program
Date: Thu, 3 Jul 2008 16:07:21 -0400
Message-ID: <200807031607.21168.simon.perreault@viagenie.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'm trying to write a hello world-style program using NFQUEUE. It hangs in the 
select() call on the nfq file descriptor even though I can see 
with "iptables -L -n -v" that there are packets that match the rule.

Here's my iptables rule:

# iptables -A INPUT -p udp --dport 12345 -j NFQUEUE --queue-num=0

I generate packets thusly:

# echo "hello" | nc -u localhost 12345

Here's my C code:

=======================================================
#include <libnetfilter_queue/libnetfilter_queue.h>

#include <stdio.h>

int cb( struct nfq_q_handle* q, struct nfgenmsg *nfmsg,
        struct nfq_data *nfad, void *data )
{
    char* payload;
    printf( "received %d bytes\n", nfq_get_payload(nfad, &payload) );
    return 0;
}

int main()
{
    struct nfq_handle* h = nfq_open();
    struct nfq_q_handle* q = nfq_create_queue( h, 0, cb, 0 );
    int fd = nfq_fd(h);

    while (1) {
        fd_set readfds;
        FD_ZERO(&readfds);
        FD_SET(fd, &readfds);
        select( fd + 1, &readfds, 0, 0, 0 );

        char buf[8192];
        ssize_t size = recv( fd, buf, sizeof(buf), 0 );

        nfq_handle_packet( h, buf, size );
    }

    return 0;
}
=======================================================

Any idea what might be missing?

Thanks,
Simon

-- 
Please try Numb, a STUN/TURN server implementation.
Free access at http://numb.viagenie.ca/.
