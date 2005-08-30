From: rb <user01@kyberwelt.de>
Subject: Re: FQDN filtering
Date: Tue, 30 Aug 2005 19:41:03 +0200
Message-ID: <20050830194103.3f0a5136.user01@kyberwelt.de>
References: <20050830125809.68053.qmail@web52505.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050830125809.68053.qmail@web52505.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 30 Aug 2005 05:58:09 -0700 (PDT)
rockey dada <rockeydada@yahoo.com> wrote:

> Is there any way one can use IPTABLES to filter traffic based on "Fully
> Qualified Domain Names".

not really. userspacetools can do dns-lookups when executed, but
the  rules inserted into the (kernelspace)  netfilter will NEVER do
any dns-lookups. (and i`m glad nobody even thought about implementing
this :) ).
so  /dev/rob0 is right: use proxys for this kind of  filtering.
even if  you rely on dns-lookups while creating the netfilter-rules
you cant be sure you got ALL entrys in  a rr-dns record AND  after
inserting the rules you  cant beu  sure the entrys  do not change.

virtual

