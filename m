From: "Majid Khan" <majidkk@gmail.com>
Subject: Netfilter and SMP
Date: Thu, 25 May 2006 00:24:39 -0400
Message-ID: <a656c20605242124l1280ec3em57224425a84b910a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,
 I am developing a netfilter based application on an SMP (dual core) system=
.
One thing that I noticed over a period of time was that most of the
network traffic was handled by only one of the processor. Only under
high network traffic (roughly 10,000 packet/sec or more) did the
second processor got invloved invloved in traffic handling. Even then
more than 90 percent of the traffic was being handled by one of the
processor.

Can somebody provide me with some information on how to configure my
SMP system so that both processors share the traffic load.

My second question was that if there is any known method to gracefully
handle failures in a netfilter module. Currently any failure in
netfilter would cause the kernel panic.

Regards,
Majid

