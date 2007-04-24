From: "hitesh sharma" <engineerhitesh@gmail.com>
Subject: problem related to coustem module .....plz help
Date: Tue, 24 Apr 2007 13:32:59 +0530
Message-ID: <58cbfaa70704240102w5f7a9eb5kf904fd1db806c6a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=LFscpG/9MRGRIVe2OjgTQQZsT8o6Lfloq16SHjN0C4KKbA9JUaGBrqREdOgRHMFTlKyBCIFJBV1r7n/jeXTdnnEhgPMtntwmm8EIQ+rayt/CnamHNRIa3tUpf5oFkdXdwkgHyH3cHrsMGBIZa6bbqipaJIVT7+jF74nvzcI405c=
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hello all ,
actually i am writing the custom table at forward hook in netfilter framework.
so , as we know that if we want to pass argument at insertion time we
can pass it by using module_param(), so i did it successfully. but
problem occurs , when i want to pass array of structure to my module ,
i will explain it in brief
struct Queue{
int src_ip;
int dst_ip;
int tcp_port_src;
int tcp_port_dst;
int protocol;
char *action; /*NF_ACCEPT,NF_DROP,NF_QUEUE*/
}node[5];
so , now i want that i should be able to set the 5 diff. rules at the
time of insertion.
but i tried it alot , but no result.
so , plz anybody will suggest me how to do it, or any other idea to
set various rule by command line.
thanks .....
Hitesh

