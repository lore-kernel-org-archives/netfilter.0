From: "Damian Hites" <nizebulous@gmail.com>
Subject: Linking error using libnetfilter_queue on FC8
Date: Thu, 29 Nov 2007 15:44:33 -0800
Message-ID: <a2997d4b0711291544g7d8da729t6b965af6c1201292@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=0+85/ehmldXeKWWpegvSd4z6Y7o5NDk8fX8zTtL85/8=;
        b=OZgx1vihs+mQbq8AScfhQE7fA9XYYh/zyeLI6X4NXC3GouvVt3/Fp5zW0g0n6phiJeo6PY+vagLj4cCFCfVT1uZ/9jI/3BMTv2XS3YEwOdCx2X1E+C5okNKaL7PRgbzb6uRkMQQcK69mEi2JkktjxGjGFxXnaglZwr8IsyoYWv0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Sorry to repost this....but I have only gotten one response and it
wasn't really helpful at all.
I really have no idea what else to try.  It should be said that I
successfully install libnetfilter_queue and it compiles (the version
off the netfilter.org websit).  Even the example works fine, it's just
when I try to use the libraries in my own program.  I don't know if
there are more aspects to the Makefile that I'm missing, but I don't
know what it would be and why it would be needed.

I keep getting this errror.  I installed libnetfilter_queue and
libnetfilter_conntrack using yum.  The shared libraries are in the
right places (/usr/lib/ and /usr/lib64/) and I'm using the -l options
(-lnfnetlink -lnetfilter_queue).  Not sure why it's not working.  Here
is the output:

g++ -g -Wall -c test.cpp -o test.o
g++ test.o -lnfnetlink -lnetfilter_queue -o test
test.o: In function `main':
test.cpp:65: undefined reference to `nfq_open()'
test.cpp:72: undefined reference to `nfq_unbind_pf(nfq_handle*, unsigned short)'
test.cpp:78: undefined reference to `nfq_bind_pf(nfq_handle*, unsigned short)'
test.cpp:84: undefined reference to `nfq_create_queue(nfq_handle*,
unsigned short, int (*)(nfq_q_handle*, nfgenmsg*, nfq_data*, void*),
void*)'
test.cpp:91: undefined reference to `nfq_set_mode(nfq_q_handle*,
unsigned char, unsigned int)'
test.cpp:97: undefined reference to
`nfq_set_queue_maxlen(nfq_q_handle*, unsigned int)'
test.cpp:103: undefined reference to `nfq_nfnlh(nfq_handle*)'
test.cpp:104: undefined reference to `nfnl_fd(nfnl_handle*)'
test.cpp:108: undefined reference to `nfq_handle_packet(nfq_handle*,
char*, int)'
test.cpp:112: undefined reference to `nfq_destroy_queue(nfq_q_handle*)'
test.cpp:115: undefined reference to `nfq_close(nfq_handle*)'
test.o: In function `print_pkt':
test.cpp:18: undefined reference to `nfq_get_msg_packet_hdr(nfq_data*)'
test.cpp:25: undefined reference to `nfq_get_nfmark(nfq_data*)'
test.cpp:29: undefined reference to `nfq_get_indev(nfq_data*)'
test.cpp:33: undefined reference to `nfq_get_outdev(nfq_data*)'
test.cpp:37: undefined reference to `nfq_get_payload(nfq_data*, char**)'
test.o: In function `cb':
test.cpp:52: undefined reference to `nfq_set_verdict(nfq_q_handle*,
unsigned int, unsigned int, unsigned int, unsigned char*)'
collect2: ld returned 1 exit status
make: *** [test] Error 1

Here is my simplistic Makefile:
LDOPTS =
LIBS = -lnfnetlink -lnetfilter_queue
INCDIR =
CXXFLAGS= -g -Wall#$(INCDIR)
sources := $(wildcard *.cpp) $(wildcard *.c)
objs := $(sources)
objs := $(objs:.c=.o)
objs := $(objs:.cpp=.o)
all: test
clean:
   rm -f $(objs) test
test: $(objs)
   $(CXX) $^ $(LDOPTS) $(LIBS) -o $@
.c.o:
   $(CC) $(CXXFLAGS) -c $< -o $@
.cpp.o:
   $(CXX) $(CXXFLAGS) -c $< -o $@

Can anybody point me in the right direction?  Don't know why it
doesn't want to link.
