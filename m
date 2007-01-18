From: "Arthur Liew" <geniusbb@gmail.com>
Subject: Problem for nfq_set_queue_maxlen of libnetfilter_queue
Date: Thu, 18 Jan 2007 15:36:03 +0000
Message-ID: <bb5ff7280701180736j5473b100q31709f6ebb9effe@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_133876_31279948.1169134563620"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

------=_Part_133876_31279948.1169134563620
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Dear All,

I don't seem to be able to set max queue len of libnetfilter. The
error I keep getting is

NFNETLINK answers: Invalid argument

Any idea why ?  The code snippet that cause this is

    u_int32_t qlen = 1024;
    if (nfq_set_queue_maxlen(qh, qlen) < 0)

The version of library I use is

libnetfilter_queue-0.0.13
libnfnetlink-0.0.25

I have use the test code from  libnetfilter_queue-0.0.13/utils with
additional nfq_set_queue_maxlen function

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <netinet/in.h>
#include <linux/netfilter.h>		/* for NF_ACCEPT */

#include <libnetfilter_queue/libnetfilter_queue.h>

/* returns packet id */
static u_int32_t print_pkt (struct nfq_data *tb)
{
	int id = 0;
	struct nfqnl_msg_packet_hdr *ph;
	u_int32_t mark,ifi;
	int ret;
	char *data;
	
	ph = nfq_get_msg_packet_hdr(tb);
	if (ph){
		id = ntohl(ph->packet_id);
		printf("hw_protocol=0x%04x hook=%u id=%u ",
			ntohs(ph->hw_protocol), ph->hook, id);
	}
	
	mark = nfq_get_nfmark(tb);
	if (mark)
		printf("mark=%u ", mark);

	ifi = nfq_get_indev(tb);
	if (ifi)
		printf("indev=%u ", ifi);

	ifi = nfq_get_outdev(tb);
	if (ifi)
		printf("outdev=%u ", ifi);

	ret = nfq_get_payload(tb, &data);
	if (ret >= 0)
		printf("payload_len=%d ", ret);

	fputc('\n', stdout);

	return id;
}
	

static int cb(struct nfq_q_handle *qh, struct nfgenmsg *nfmsg,
	      struct nfq_data *nfa, void *data)
{
	u_int32_t id = print_pkt(nfa);
	printf("entering callback\n");
	return nfq_set_verdict(qh, id, NF_ACCEPT, 0, NULL);
}

int main(int argc, char **argv)
{
	struct nfq_handle *h;
	struct nfq_q_handle *qh;
	struct nfnl_handle *nh;
	int fd;
	int rv;
	char buf[4096];

	printf("opening library handle\n");
	h = nfq_open();
	if (!h) {
		fprintf(stderr, "error during nfq_open()\n");
		exit(1);
	}

	printf("unbinding existing nf_queue handler for AF_INET (if any)\n");
	if (nfq_unbind_pf(h, AF_INET) < 0) {
		fprintf(stderr, "error during nfq_unbind_pf()\n");
		exit(1);
	}

	printf("binding nfnetlink_queue as nf_queue handler for AF_INET\n");
	if (nfq_bind_pf(h, AF_INET) < 0) {
		fprintf(stderr, "error during nfq_bind_pf()\n");
		exit(1);
	}

	printf("binding this socket to queue '0'\n");
	qh = nfq_create_queue(h,  0, &cb, NULL);
	if (!qh) {
		fprintf(stderr, "error during nfq_create_queue()\n");
		exit(1);
	}

	printf("setting copy_packet mode\n");
	if (nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xffff) < 0) {
		fprintf(stderr, "can't set packet_copy mode\n");
		exit(1);
	}

    u_int32_t qlen = 128;
    if (nfq_set_queue_maxlen(qh, qlen) < 0)
    {
        fprintf(stderr, "error during nfq_set_queue_maxlen()\n");
   //     exit(1);
    }

	nh = nfq_nfnlh(h);
	fd = nfnl_fd(nh);

	while ((rv = recv(fd, buf, sizeof(buf), 0)) && rv >= 0) {
		printf("pkt received\n");
		nfq_handle_packet(h, buf, rv);
	}

	printf("unbinding from queue 0\n");
	nfq_destroy_queue(qh);

#ifdef INSANE
	/* normally, applications SHOULD NOT issue this command, since
	 * it detaches other programs/sockets from AF_INET, too ! */
	printf("unbinding from AF_INET\n");
	nfq_unbind_pf(h, AF_INET);
#endif

	printf("closing library handle\n");
	nfq_close(h);

	exit(0);
}

------=_Part_133876_31279948.1169134563620
Content-Type: text/x-csrc; name=nfqnl_test.c; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ex3chn5f
Content-Disposition: attachment; filename="nfqnl_test.c"

CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRlIDx1bmlzdGQu
aD4KI2luY2x1ZGUgPG5ldGluZXQvaW4uaD4KI2luY2x1ZGUgPGxpbnV4L25ldGZpbHRlci5oPgkJ
LyogZm9yIE5GX0FDQ0VQVCAqLwoKI2luY2x1ZGUgPGxpYm5ldGZpbHRlcl9xdWV1ZS9saWJuZXRm
aWx0ZXJfcXVldWUuaD4KCi8qIHJldHVybnMgcGFja2V0IGlkICovCnN0YXRpYyB1X2ludDMyX3Qg
cHJpbnRfcGt0IChzdHJ1Y3QgbmZxX2RhdGEgKnRiKQp7CglpbnQgaWQgPSAwOwoJc3RydWN0IG5m
cW5sX21zZ19wYWNrZXRfaGRyICpwaDsKCXVfaW50MzJfdCBtYXJrLGlmaTsgCglpbnQgcmV0OwoJ
Y2hhciAqZGF0YTsKCQoJcGggPSBuZnFfZ2V0X21zZ19wYWNrZXRfaGRyKHRiKTsKCWlmIChwaCl7
CgkJaWQgPSBudG9obChwaC0+cGFja2V0X2lkKTsKCQlwcmludGYoImh3X3Byb3RvY29sPTB4JTA0
eCBob29rPSV1IGlkPSV1ICIsCgkJCW50b2hzKHBoLT5od19wcm90b2NvbCksIHBoLT5ob29rLCBp
ZCk7Cgl9CgkKCW1hcmsgPSBuZnFfZ2V0X25mbWFyayh0Yik7CglpZiAobWFyaykKCQlwcmludGYo
Im1hcms9JXUgIiwgbWFyayk7CgoJaWZpID0gbmZxX2dldF9pbmRldih0Yik7CglpZiAoaWZpKQoJ
CXByaW50ZigiaW5kZXY9JXUgIiwgaWZpKTsKCglpZmkgPSBuZnFfZ2V0X291dGRldih0Yik7Cglp
ZiAoaWZpKQoJCXByaW50Zigib3V0ZGV2PSV1ICIsIGlmaSk7CgoJcmV0ID0gbmZxX2dldF9wYXls
b2FkKHRiLCAmZGF0YSk7CglpZiAocmV0ID49IDApCgkJcHJpbnRmKCJwYXlsb2FkX2xlbj0lZCAi
LCByZXQpOwoKCWZwdXRjKCdcbicsIHN0ZG91dCk7CgoJcmV0dXJuIGlkOwp9CgkKCnN0YXRpYyBp
bnQgY2Ioc3RydWN0IG5mcV9xX2hhbmRsZSAqcWgsIHN0cnVjdCBuZmdlbm1zZyAqbmZtc2csCgkg
ICAgICBzdHJ1Y3QgbmZxX2RhdGEgKm5mYSwgdm9pZCAqZGF0YSkKewoJdV9pbnQzMl90IGlkID0g
cHJpbnRfcGt0KG5mYSk7CglwcmludGYoImVudGVyaW5nIGNhbGxiYWNrXG4iKTsKCXJldHVybiBu
ZnFfc2V0X3ZlcmRpY3QocWgsIGlkLCBORl9BQ0NFUFQsIDAsIE5VTEwpOwp9CgppbnQgbWFpbihp
bnQgYXJnYywgY2hhciAqKmFyZ3YpCnsKCXN0cnVjdCBuZnFfaGFuZGxlICpoOwoJc3RydWN0IG5m
cV9xX2hhbmRsZSAqcWg7CglzdHJ1Y3QgbmZubF9oYW5kbGUgKm5oOwoJaW50IGZkOwoJaW50IHJ2
OwoJY2hhciBidWZbNDA5Nl07CgoJcHJpbnRmKCJvcGVuaW5nIGxpYnJhcnkgaGFuZGxlXG4iKTsK
CWggPSBuZnFfb3BlbigpOwoJaWYgKCFoKSB7CgkJZnByaW50ZihzdGRlcnIsICJlcnJvciBkdXJp
bmcgbmZxX29wZW4oKVxuIik7CgkJZXhpdCgxKTsKCX0KCglwcmludGYoInVuYmluZGluZyBleGlz
dGluZyBuZl9xdWV1ZSBoYW5kbGVyIGZvciBBRl9JTkVUIChpZiBhbnkpXG4iKTsKCWlmIChuZnFf
dW5iaW5kX3BmKGgsIEFGX0lORVQpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAiZXJyb3IgZHVy
aW5nIG5mcV91bmJpbmRfcGYoKVxuIik7CgkJZXhpdCgxKTsKCX0KCglwcmludGYoImJpbmRpbmcg
bmZuZXRsaW5rX3F1ZXVlIGFzIG5mX3F1ZXVlIGhhbmRsZXIgZm9yIEFGX0lORVRcbiIpOwoJaWYg
KG5mcV9iaW5kX3BmKGgsIEFGX0lORVQpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAiZXJyb3Ig
ZHVyaW5nIG5mcV9iaW5kX3BmKClcbiIpOwoJCWV4aXQoMSk7Cgl9CgoJcHJpbnRmKCJiaW5kaW5n
IHRoaXMgc29ja2V0IHRvIHF1ZXVlICcwJ1xuIik7CglxaCA9IG5mcV9jcmVhdGVfcXVldWUoaCwg
IDAsICZjYiwgTlVMTCk7CglpZiAoIXFoKSB7CgkJZnByaW50ZihzdGRlcnIsICJlcnJvciBkdXJp
bmcgbmZxX2NyZWF0ZV9xdWV1ZSgpXG4iKTsKCQlleGl0KDEpOwoJfQoKCXByaW50Zigic2V0dGlu
ZyBjb3B5X3BhY2tldCBtb2RlXG4iKTsKCWlmIChuZnFfc2V0X21vZGUocWgsIE5GUU5MX0NPUFlf
UEFDS0VULCAweGZmZmYpIDwgMCkgewoJCWZwcmludGYoc3RkZXJyLCAiY2FuJ3Qgc2V0IHBhY2tl
dF9jb3B5IG1vZGVcbiIpOwoJCWV4aXQoMSk7Cgl9CgogICAgdV9pbnQzMl90IHFsZW4gPSAxMjg7
CiAgICBpZiAobmZxX3NldF9xdWV1ZV9tYXhsZW4ocWgsIHFsZW4pIDwgMCkKICAgIHsKICAgICAg
ICBmcHJpbnRmKHN0ZGVyciwgImVycm9yIGR1cmluZyBuZnFfc2V0X3F1ZXVlX21heGxlbigpXG4i
KTsKICAgLy8gICAgIGV4aXQoMSk7CiAgICB9CgoJbmggPSBuZnFfbmZubGgoaCk7CglmZCA9IG5m
bmxfZmQobmgpOwoKCXdoaWxlICgocnYgPSByZWN2KGZkLCBidWYsIHNpemVvZihidWYpLCAwKSkg
JiYgcnYgPj0gMCkgewoJCXByaW50ZigicGt0IHJlY2VpdmVkXG4iKTsKCQluZnFfaGFuZGxlX3Bh
Y2tldChoLCBidWYsIHJ2KTsKCX0KCglwcmludGYoInVuYmluZGluZyBmcm9tIHF1ZXVlIDBcbiIp
OwoJbmZxX2Rlc3Ryb3lfcXVldWUocWgpOwoKI2lmZGVmIElOU0FORQoJLyogbm9ybWFsbHksIGFw
cGxpY2F0aW9ucyBTSE9VTEQgTk9UIGlzc3VlIHRoaXMgY29tbWFuZCwgc2luY2UKCSAqIGl0IGRl
dGFjaGVzIG90aGVyIHByb2dyYW1zL3NvY2tldHMgZnJvbSBBRl9JTkVULCB0b28gISAqLwoJcHJp
bnRmKCJ1bmJpbmRpbmcgZnJvbSBBRl9JTkVUXG4iKTsKCW5mcV91bmJpbmRfcGYoaCwgQUZfSU5F
VCk7CiNlbmRpZgoKCXByaW50ZigiY2xvc2luZyBsaWJyYXJ5IGhhbmRsZVxuIik7CgluZnFfY2xv
c2UoaCk7CgoJZXhpdCgwKTsKfQo=
------=_Part_133876_31279948.1169134563620--

