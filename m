From: "shantanu sharma" <ssharma_02@iiita.ac.in>
Subject: mangling a packet
Date: Thu, 8 Apr 2004 11:15:25 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <46653.172.31.1.1.1081403125.squirrel@mail.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

we are supposed to capture a dns packet at the firewall and mangle  it
appropriately
as the querry packet passes through the firewall DNAT'ing(destination nat)
takes place  now when the rply packet comes back we QUEUE it using the
forward chain of the filter table before the reverse SNAT automatically
takes place ,after mangling the packet using the IPQ library in checksum
of UDP and IP gets disturbed .We recalculated the checksum but due to
reverse S NATing  it again gets disturbed and the packets get disturbed at
the recieving end
please tell us how do we correct the checksum filed of UDP and IP after
the reverse S NAT takes place or do we need to queue the packets using
some other chain of someother table

regards,
shantanu sharma


-- 
Shantanu Sharma
B Tech student,
Indian Institute Of Information Technology,Allahabad
ALTERNATIVE MAIL:sharma_shantanu@rediffmail.com

