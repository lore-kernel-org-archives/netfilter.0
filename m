From: Oumer Teyeb <oumer@kom.auc.dk>
Subject: memory cleanup after setverdict
Date: Mon, 13 Oct 2003 14:24:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8A996A.6020707@kom.auc.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I thought once the set verdict is called, the ipq_packet_msg_t param 
that was holding the packet will be freed by libipq. but I can access it 
after the setverdict is called, and also the data I have copied. For 
example, in  a code like this

ipq_packet_msg_t *m = ipq_get_packet(buf);

ipq_set_verdict(handler, m->packet_id, NF_ACCEPT, 0, NULL);

fwrite ((usnigned int *) (m+1), 1, m->data_len, file);

I expected the third call to fail, but it doesn't. Then when is the 
memory used by the ipq_packet_msg_t parameter freed? Or am I responsible 
for freeing it myself?

Regards,
Oumer


